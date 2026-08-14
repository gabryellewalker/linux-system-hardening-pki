#!/usr/bin/env bash
#
# NovaCore Technologies (Fictional)
# Linux Security Hardening Automation
# Portfolio artifact by Gabryelle Walker
#
# Purpose:
#   Apply and validate a small set of repeatable Linux security-baseline
#   controls in an authorized lab environment.
#
# Usage:
#   sudo bash linux-hardening.sh --dry-run
#   sudo bash linux-hardening.sh --apply
#
# Notes:
#   - Designed for Debian/Ubuntu-style systems using systemd.
#   - Review and test before use. --dry-run is the default.
#   - This script intentionally avoids destructive firewall, SSH, account,
#     or package-removal changes because those require environment-specific
#     approval and testing.

set -Eeuo pipefail
IFS=$'\n\t'

MODE="dry-run"
TARGET_HOSTNAME="novacore-linux01"
TARGET_TIMEZONE="America/Denver"
IDLE_TIMEOUT_SECONDS="180"
REPORT_DIR="./hardening-output"
LOG_EXPORT_LINES="50"

usage() {
  cat <<'EOF'
Usage: sudo bash linux-hardening.sh [--dry-run|--apply]

  --dry-run   Show intended changes without modifying the system (default)
  --apply     Apply the approved baseline settings implemented by this script
EOF
}

case "${1:---dry-run}" in
  --dry-run) MODE="dry-run" ;;
  --apply) MODE="apply" ;;
  -h|--help) usage; exit 0 ;;
  *) echo "Unknown option: $1"; usage; exit 1 ;;
esac

log() {
  printf '[%s] %s\n' "$(date '+%Y-%m-%d %H:%M:%S')" "$*"
}

run_cmd() {
  if [[ "$MODE" == "dry-run" ]]; then
    printf '[DRY-RUN] '
    printf '%q ' "$@"
    printf '\n'
  else
    "$@"
  fi
}

require_root_for_apply() {
  if [[ "$MODE" == "apply" && "${EUID}" -ne 0 ]]; then
    echo "ERROR: --apply must be run with administrative privileges." >&2
    exit 1
  fi
}

require_command() {
  command -v "$1" >/dev/null 2>&1 || {
    echo "ERROR: Required command not found: $1" >&2
    exit 1
  }
}

prepare_report_dir() {
  mkdir -p "$REPORT_DIR"
}

configure_hostname() {
  log "Baseline control: standardized hostname"
  if [[ "$(hostname)" == "$TARGET_HOSTNAME" ]]; then
    log "PASS: Hostname already set to $TARGET_HOSTNAME"
  else
    run_cmd hostnamectl set-hostname "$TARGET_HOSTNAME"
  fi
}

configure_timezone() {
  log "Baseline control: approved time zone"
  local current
  current="$(timedatectl show -p Timezone --value 2>/dev/null || true)"
  if [[ "$current" == "$TARGET_TIMEZONE" ]]; then
    log "PASS: Time zone already set to $TARGET_TIMEZONE"
  else
    run_cmd timedatectl set-timezone "$TARGET_TIMEZONE"
  fi
}

collect_process_inventory() {
  log "Baseline control: process visibility"
  local outfile="$REPORT_DIR/running-processes.txt"
  if [[ "$MODE" == "dry-run" ]]; then
    log "DRY-RUN: Would export running process inventory to $outfile"
  else
    ps auxww > "$outfile"
    chmod 600 "$outfile"
    log "PASS: Process inventory written to $outfile"
  fi
}

export_security_log_sample() {
  log "Baseline control: security logging evidence"
  local outfile="$REPORT_DIR/security-log-sample.txt"
  if [[ "$MODE" == "dry-run" ]]; then
    log "DRY-RUN: Would export the latest $LOG_EXPORT_LINES journal entries to $outfile"
  else
    journalctl -n "$LOG_EXPORT_LINES" --no-pager > "$outfile"
    chmod 600 "$outfile"
    log "PASS: Security log sample written to $outfile"
  fi
}

configure_screen_lock() {
  log "Baseline control: automatic session locking"

  # GNOME settings are user-session settings. The script documents the
  # intended baseline and applies it only when an active graphical user
  # and gsettings are available.
  local target_user="${SUDO_USER:-${USER:-}}"

  if ! command -v gsettings >/dev/null 2>&1; then
    log "INFO: gsettings not available; screen-lock control requires manual validation."
    return
  fi

  if [[ "$MODE" == "dry-run" ]]; then
    log "DRY-RUN: Would enable screen lock and set idle timeout to ${IDLE_TIMEOUT_SECONDS}s for ${target_user:-active user}"
    return
  fi

  if [[ -z "$target_user" || "$target_user" == "root" ]]; then
    log "INFO: No non-root graphical user identified; screen-lock control requires manual validation."
    return
  fi

  local uid
  uid="$(id -u "$target_user")"
  local bus="unix:path=/run/user/${uid}/bus"

  if [[ ! -S "/run/user/${uid}/bus" ]]; then
    log "INFO: User session bus unavailable; screen-lock control requires manual validation."
    return
  fi

  sudo -u "$target_user" \
    DBUS_SESSION_BUS_ADDRESS="$bus" \
    gsettings set org.gnome.desktop.session idle-delay "uint32 $IDLE_TIMEOUT_SECONDS"

  sudo -u "$target_user" \
    DBUS_SESSION_BUS_ADDRESS="$bus" \
    gsettings set org.gnome.desktop.screensaver lock-enabled true

  log "PASS: Screen lock baseline applied for $target_user"
}

validate_baseline() {
  log "Generating validation summary"
  local outfile="$REPORT_DIR/validation-summary.txt"

  {
    echo "NovaCore Linux Hardening Validation"
    echo "Generated: $(date -Is)"
    echo
    echo "Hostname: $(hostname)"
    echo "Target hostname: $TARGET_HOSTNAME"
    echo
    echo "Time zone: $(timedatectl show -p Timezone --value 2>/dev/null || echo 'Unavailable')"
    echo "Target time zone: $TARGET_TIMEZONE"
    echo
    echo "Enabled services snapshot:"
    systemctl list-unit-files --type=service --state=enabled --no-pager 2>/dev/null | head -n 25 || true
    echo
    echo "Listening sockets snapshot:"
    if command -v ss >/dev/null 2>&1; then
      ss -lntup 2>/dev/null || true
    else
      echo "ss command unavailable"
    fi
  } > "$outfile"

  chmod 600 "$outfile"
  log "PASS: Validation summary written to $outfile"
}

main() {
  require_root_for_apply
  require_command hostname
  require_command hostnamectl
  require_command timedatectl
  require_command ps
  require_command journalctl
  require_command systemctl

  prepare_report_dir

  log "Starting NovaCore Linux hardening automation in $MODE mode."
  configure_hostname
  configure_timezone
  collect_process_inventory
  export_security_log_sample
  configure_screen_lock

  if [[ "$MODE" == "apply" ]]; then
    validate_baseline
  else
    log "DRY-RUN complete. No system changes were made."
  fi

  log "Hardening workflow complete."
}

main "$@"
