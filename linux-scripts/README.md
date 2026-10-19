# Linux Automation Scripts

This folder contains Bash scripts designed to automate daily system administration tasks.

## 1. `system-health-check.sh`

**Purpose:** 
A quick diagnostic script that outputs the current health of the system (Disk usage, RAM usage, and top 5 CPU-consuming processes). It is useful for a fast check during incident triage.

**How to run it:**
```bash
# Make the script executable first
chmod +x system-health-check.sh

# Run the script
./system-health-check.sh



**What it does:**
- Uses `df -h` to check disk space (excluding temporary file systems).
- Uses `free -h` to check memory usage.
- Uses `ps aux --sort=-%cpu` to identify resource-heavy processes.
