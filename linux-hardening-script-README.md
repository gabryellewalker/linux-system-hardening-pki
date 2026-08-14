# Automated Linux Hardening Script

This script is an original portfolio artifact for the fictional **NovaCore Technologies** environment.

## What it demonstrates

- Safe-by-default `--dry-run` behavior
- Standardized Linux hostname configuration
- Approved time-zone configuration
- Running-process inventory collection
- Security-log export
- GNOME automatic screen-lock configuration when a valid user session is available
- Post-implementation validation output
- Defensive scripting practices such as strict error handling and prerequisite checks

## Lab usage

```bash
sudo bash linux-hardening.sh --dry-run
sudo bash linux-hardening.sh --apply
```

Review the script before using `--apply`.

## Output

When applied, the script creates a local `hardening-output` directory containing:

- `running-processes.txt`
- `security-log-sample.txt`
- `validation-summary.txt`

## Scope

The script is intentionally limited to controls that can be demonstrated safely in a lab. Firewall rules, SSH restrictions, account removal, package removal, and other environment-dependent controls should be tested and approved separately before deployment.

## Disclaimer

Use only on systems you own or are authorized to administer. NovaCore Technologies is fictional, and this script is intended for defensive cybersecurity education and portfolio demonstration.
