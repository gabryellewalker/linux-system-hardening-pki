# Linux System Hardening & PKI Security

## Project Overview

This project demonstrates the development of a secure Linux deployment baseline for a fictional enterprise environment.

The project combines operating-system hardening, security automation, configuration validation, logging, Public Key Infrastructure (PKI), certificate management, and security documentation.

The objective is to demonstrate how cybersecurity professionals can transform security requirements into repeatable technical controls that reduce configuration errors, improve consistency, and strengthen enterprise security.

## Fictional Organization

**NovaCore Technologies** is a fictional technology organization deploying Linux workstations and servers across its enterprise environment.

Security leadership has identified several challenges:

- Inconsistent workstation configurations
- Manual deployment processes
- Insufficient system-hardening standards
- Inconsistent logging configurations
- Weak certificate-management practices
- Risk of configuration drift
- Limited validation of security controls

The security team is tasked with developing a standardized Linux security baseline and supporting PKI architecture.

## Project Objectives

- Develop a standardized Linux security baseline
- Automate repeatable system-hardening tasks
- Reduce manual configuration errors
- Establish secure workstation configuration requirements
- Implement security logging requirements
- Develop an operating-system security checklist
- Design a basic enterprise PKI model
- Demonstrate certificate authority concepts
- Document certificate signing workflows
- Apply least-privilege principles
- Apply defense-in-depth principles
- Validate security configurations
- Document implementation and validation evidence

## Security Architecture

The project applies multiple layers of security:

### Operating System Hardening

Linux systems are configured according to an approved organizational security baseline.

Example controls include:

- Standardized host naming
- Approved time-zone configuration
- Automatic screen locking
- Process monitoring
- Security logging
- Account security
- File permissions
- Service hardening
- Network configuration
- Patch management

### Security Automation

Repeatable configuration tasks are automated to reduce human error and improve consistency.

Automation provides several benefits:

- Standardized deployment
- Faster configuration
- Repeatability
- Reduced administrative error
- Easier auditing
- Configuration consistency
- Scalable security controls

## Linux Hardening Workflow

### 1. Establish Baseline

Define approved security requirements based on organizational risk, business requirements, and recognized security guidance.

### 2. Configure

Apply required security settings to Linux systems.

### 3. Automate

Convert repeatable configuration tasks into controlled automation.

### 4. Validate

Verify that required settings were applied successfully.

### 5. Document

Record configuration status and validation evidence.

### 6. Monitor

Monitor systems for security events and configuration drift.

### 7. Maintain

Update the baseline as threats, technology, and organizational requirements change.

## Automated Security Controls

The fictional hardening automation demonstrates several configuration categories.

| Security Area | Example Control | Security Purpose |
|---|---|---|
| System Identification | Standardized hostname | Supports asset identification and administration |
| Time Configuration | Approved system time zone | Supports accurate logging and event correlation |
| Session Security | Automatic screen locking | Reduces unauthorized access to unattended systems |
| Process Visibility | Running-process inventory | Supports monitoring and investigation |
| Logging | Security log collection | Supports auditing and incident investigation |
| Account Security | Authentication configuration | Reduces unauthorized access |
| Service Hardening | Disable unnecessary services | Reduces attack surface |
| Patch Management | Update security packages | Reduces exposure to known vulnerabilities |

## Public Key Infrastructure (PKI)

The project also demonstrates how PKI can support secure enterprise communications and authentication.

A basic PKI environment includes:

**Certificate Authority (CA)**  
Issues and manages trusted digital certificates.

**Private Key**  
Must remain protected because possession of the CA private key allows certificates to be signed.

**Certificate Signing Request (CSR)**  
Contains identifying information and a public key that is submitted to the CA for approval.

**Digital Certificate**  
Associates a public key with an approved identity.

**Certificate Validation**  
Allows systems to verify that certificates were issued by a trusted authority and remain valid.

## Certificate Lifecycle

1. Generate a private key
2. Protect the private key
3. Generate a Certificate Signing Request
4. Submit the CSR to the Certificate Authority
5. Validate the request
6. Sign and issue the certificate
7. Deploy the certificate
8. Validate certificate trust
9. Monitor expiration
10. Renew or revoke the certificate when necessary

## Security Design Principles

### Defense in Depth

System hardening, authentication controls, logging, encryption, and certificates provide multiple layers of protection.

### Least Privilege

Users, services, certificates, and administrative accounts should receive only the permissions required to perform authorized functions.

### Secure by Default

New systems should begin with an approved security baseline rather than relying on administrators to manually secure systems after deployment.

### Standardization

Consistent configuration reduces security gaps caused by configuration differences between systems.

### Automation

Automation reduces repetitive manual work and helps apply approved controls consistently.

## CIA Triad

### Confidentiality

Encryption, authentication, certificate-based trust, access controls, and secure configurations help prevent unauthorized disclosure.

### Integrity

Digital certificates, controlled configurations, logging, and validation help protect systems and information from unauthorized modification.

### Availability

Standardized and tested configurations help maintain reliable access to systems while reducing security-related disruptions.

## Configuration Validation

Security controls should be verified rather than assumed to be working.

Validation may include:

- Configuration review
- Script execution results
- Hostname verification
- Time configuration verification
- Screen-lock testing
- Process review
- Log verification
- Service-status review
- Certificate inspection
- Certificate-chain validation
- Permission review

## Portfolio Artifacts

This repository will contain original cybersecurity portfolio artifacts demonstrating system security and PKI implementation.

Planned artifacts include:

- Linux Security Hardening Baseline
- Automated Linux Hardening Script
- System Hardening Validation Checklist
- PKI & Certificate Architecture Guide
- Security Configuration Validation Report
- Executive System Security Brief

## Skills Demonstrated

**Linux Security | System Hardening | Security Automation | Bash | Secure Configuration | Security Baselines | Logging | Process Monitoring | PKI | OpenSSL | Digital Certificates | Certificate Signing Requests | Encryption | Authentication | Least Privilege | Defense in Depth | CIA Triad | Security Documentation**

## Key Takeaways

- Secure configurations should be standardized across systems.
- Automation improves consistency and reduces manual configuration errors.
- Security settings should be validated after implementation.
- Logging supports security monitoring, auditing, and incident investigation.
- PKI provides a scalable trust model for authentication and encrypted communications.
- Private keys require strong protection.
- Certificate management requires lifecycle planning, including issuance, renewal, expiration, and revocation.
- Security baselines should evolve as organizational risks and technologies change.

## Portfolio Disclaimer

This repository contains an original fictional cybersecurity project created for defensive cybersecurity education and professional portfolio demonstration.

NovaCore Technologies, its systems, configurations, certificates, users, and security environment are fictional. All scripts and configurations are intended for controlled educational environments and authorized systems only.

## Author

**Gabryelle Walker**  
Cybersecurity Student  
Bachelor's in Cybersecurity — Expected November 2026
