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
##2
chmod +x backup-directory.sh
./backup-directory.sh


## 3. Automated Backups with Cron

This project demonstrates how to automate the `backup-directory.sh` script using `cron`.

### How to set it up:
1. Open the crontab editor: `crontab -e`
2. Add the line from the `cron-backup-config` file.
3. Save and exit. The system will now run the backup automatically every day at 2:00 AM.

### Why this matters:
This demonstrates the ability to automate recurring system administration tasks, a core requirement for DevOps roles.
