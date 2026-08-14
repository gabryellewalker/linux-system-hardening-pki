# Linux System Hardening & PKI Security

## Project Overview

This project demonstrates the design, implementation, automation, and validation of a secure Linux deployment baseline for a fictional enterprise environment.

The project combines Linux operating-system hardening, Bash security automation, configuration validation, security logging, Public Key Infrastructure (PKI), certificate management, and executive security communication.

The objective is to demonstrate how cybersecurity professionals can translate security requirements into repeatable technical controls, validate those controls, identify configuration gaps, manage certificate trust, and communicate security risk to organizational leadership.

## Fictional Organization

**NovaCore Technologies** is a fictional technology organization deploying Linux workstations and servers across its enterprise environment.

Security leadership identified several challenges:

- Inconsistent Linux configurations
- Manual deployment processes
- Configuration drift
- Unnecessary service exposure
- Inconsistent security logging
- Limited validation of security controls
- Certificate-management risks
- Potential for administrative configuration errors

The security team was tasked with developing a standardized Linux security baseline supported by automation, validation, and PKI controls.

## Project Objectives

- Develop a standardized Linux security baseline
- Automate repeatable system-hardening tasks
- Reduce manual configuration errors
- Establish secure configuration requirements
- Implement security logging controls
- Validate system-hardening controls
- Identify failed or incomplete controls
- Develop remediation recommendations
- Design an enterprise PKI model
- Document certificate issuance and validation
- Apply least privilege and defense in depth
- Communicate technical risk to leadership

## Security Hardening Lifecycle

### 1. Establish Baseline

Define approved security requirements based on organizational risk, system purpose, and recognized security practices.

### 2. Configure

Apply required settings for:

- System identification
- Time configuration
- Session security
- Authentication
- Privileged access
- Patch management
- Logging
- Network services
- File permissions
- Remote administration

### 3. Automate

Convert repeatable configuration tasks into controlled automation.

Automation helps improve:

- Consistency
- Scalability
- Repeatability
- Deployment efficiency
- Auditability
- Configuration accuracy

### 4. Validate

Verify that security controls were successfully implemented.

Validation may include:

- Configuration review
- Script-output review
- Hostname verification
- Time configuration verification
- Screen-lock testing
- Process review
- Security-log verification
- Service-status review
- Listening-port review
- Certificate inspection

### 5. Remediate

Document failed controls and assign corrective actions.

### 6. Retest

Validate that remediation successfully corrected the identified security gap.

### 7. Monitor

Continuously monitor systems for configuration drift, security events, vulnerabilities, and certificate lifecycle issues.

## Linux Security Baseline

The project evaluates multiple security domains.

| Security Area | Example Control | Security Purpose |
|---|---|---|
| System Identification | Standardized hostname | Supports asset management and event correlation |
| Time Configuration | Approved time settings | Supports accurate logging and investigations |
| Session Security | Automatic screen locking | Protects unattended systems |
| Process Visibility | Running-process inventory | Supports monitoring and investigation |
| Logging | Security event collection | Supports auditing and incident response |
| Authentication | Secure account controls | Reduces unauthorized access |
| Privileged Access | Least privilege | Limits administrative exposure |
| Patch Management | Security updates | Reduces exposure to known vulnerabilities |
| Service Hardening | Disable unnecessary services | Reduces attack surface |
| Network Security | Review listening services and firewall rules | Limits unnecessary network exposure |
| File Security | Restrictive permissions | Protects sensitive files |
| Remote Administration | Secure remote-access configuration | Protects administrative sessions |
| Certificate Trust | Approved PKI configuration | Supports trusted authentication and encryption |

## Automated Linux Hardening

The repository includes an original Bash hardening script developed for the fictional NovaCore environment.

The automation demonstrates:

- Safe dry-run operation
- Administrative privilege validation
- Required-command checks
- Standardized hostname configuration
- Time-zone configuration
- Running-process inventory collection
- Security-log collection
- Automatic screen-lock configuration where supported
- Post-hardening validation output
- Defensive error handling

The script intentionally avoids blindly changing high-impact controls such as firewall rules, SSH access, user accounts, and package removal because those changes require environment-specific review, authorization, and testing.

## Public Key Infrastructure

The project also demonstrates a basic enterprise PKI model.

### Certificate Authority

The Certificate Authority acts as the trusted entity responsible for approving and signing digital certificates.

### Private Keys

Private keys must remain protected and should never be committed to source control or distributed with certificate requests.

### Certificate Signing Requests

Systems generate a Certificate Signing Request containing their public key and identifying information.

### Certificate Issuance

The CA validates the request before signing and issuing a certificate.

### Certificate Validation

Certificates should be checked for:

- Subject
- Issuer
- Validity period
- Intended use
- Cryptographic configuration
- Trust chain

## Certificate Lifecycle

1. Generate key pair
2. Protect private key
3. Generate Certificate Signing Request
4. Submit CSR
5. Validate request
6. Sign certificate
7. Deploy certificate
8. Validate trust
9. Monitor expiration and certificate status
10. Renew or revoke when required

## Security Design Principles

### Defense in Depth

Linux hardening, authentication, logging, network controls, encryption, and PKI create multiple security layers.

### Least Privilege

Users, administrators, services, and certificate-management functions should receive only the permissions required for authorized activities.

### Secure by Default

New systems should begin with an approved security baseline.

### Standardization

Consistent configurations reduce security gaps caused by system-to-system variation.

### Automation

Repeatable automation can reduce administrative errors and improve deployment consistency.

### Validation

Security controls should be verified rather than assumed to be operating correctly.

## Configuration Validation Scenario

A fictional post-hardening validation was performed against a NovaCore Linux workstation.

The scenario evaluated 14 controls.

**12 controls passed validation.**

**2 controls required remediation:**

- An unnecessary listening service
- Centralized security-log forwarding not yet configured

The system remained in a remediation-required state until the failed controls could be corrected and independently retested.

This demonstrates an important security principle:

> Successful configuration or script execution does not automatically prove that a security control is effective.

## Portfolio Artifacts

| Deliverable | Description |
|---|---|
| [Linux Security Hardening Baseline](linux-security-hardening-baseline.docx) | Defines standardized Linux security requirements, validation methods, deployment workflow, and exception handling. |
| [Automated Linux Hardening Script](linux-hardening.sh) | Bash automation demonstrating controlled Linux configuration, process inventory, security-log collection, session controls, and validation. |
| [Hardening Script Documentation](linux-hardening-script-README.md) | Documents script purpose, functionality, safe usage, output, and operational limitations. |
| [System Hardening Validation Checklist](system-hardening-validation-checklist.docx) | Provides a repeatable process for verifying Linux security controls and recording evidence. |
| [PKI & Certificate Architecture Guide](pki-certificate-architecture-guide.docx) | Documents certificate authorities, key protection, CSRs, certificate issuance, trust validation, renewal, revocation, and OpenSSL lab workflows. |
| [Security Configuration Validation Report](security-configuration-validation-report.docx) | Documents post-hardening control testing, identified gaps, remediation actions, ownership, and retesting requirements. |
| [Executive System Security Brief](executive-system-security-brief.docx) | Translates technical system-security findings into business risk, leadership recommendations, metrics, and remediation priorities. |

## Security Metrics

The fictional program tracks:

- Percentage of Linux systems meeting the approved baseline
- Failed controls awaiting remediation
- Systems approved with security exceptions
- Systems forwarding logs to centralized monitoring
- Unapproved listening services
- Privileged-access findings
- Configuration-drift findings
- Certificates approaching expiration
- Failed remediation validation

## Skills Demonstrated

**Linux Security | System Hardening | Bash | Security Automation | Secure Configuration | Security Baselines | Configuration Validation | Logging | Process Monitoring | Service Hardening | Least Privilege | Network Security | PKI | OpenSSL | Digital Certificates | Certificate Signing Requests | Encryption | Authentication | Defense in Depth | CIA Triad | Risk Documentation | Security Analysis | Executive Communication**

## Key Takeaways

- Secure configurations should be standardized.
- Automation can improve consistency and reduce manual configuration errors.
- Security controls must be validated after implementation.
- Failed controls should remain open until remediation is verified.
- Logging supports monitoring, auditing, and incident investigation.
- Unnecessary services increase attack surface.
- PKI provides a scalable trust model for authentication and encrypted communications.
- Private keys require strong protection.
- Certificate security requires lifecycle management.
- Configuration drift requires continuous monitoring.
- Leadership visibility is important when security gaps require resources, exceptions, or cross-team remediation.

## Portfolio Disclaimer

This repository contains an original fictional cybersecurity project created for defensive cybersecurity education and professional portfolio demonstration.

NovaCore Technologies, its systems, assets, certificates, validation results, security findings, owners, and remediation activities are fictional.

No production credentials, private keys, confidential organizational information, or unauthorized system-testing data are included.

## Author

**Gabryelle Walker**  
Cybersecurity Student  
Bachelor's in Cybersecurity — Expected November 2026
