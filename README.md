🚀 Automated Backup System for AWS EC2

A robust, automated backup solution for EC2 instances with Google Drive integration, cron scheduling, and detailed logging.

📖 Overview

This project provides a fully automated backup system for Linux (Ubuntu) running on AWS EC2. It:

Creates timestamped backups of critical project files
Uploads backups to Google Drive using rclone
Implements automated scheduling with cron jobs
Maintains organized logs for monitoring and auditing

The system is designed to minimize manual intervention while ensuring secure, reliable backups.

⚙️ Tech Stack
AWS EC2 – Cloud server hosting
Linux (Ubuntu) – Operating system
Bash Scripting – Automation scripts
rclone – Cloud storage integration with Google Drive
Cron Jobs – Scheduling automated tasks
✨ Features
Automated local backups
Upload to Google Drive for offsite redundancy
Configurable retention policies (daily, weekly, monthly)
Webhook or log notifications for monitoring
Timestamped and organized backup directories
📂 Project Structure
backup-project/
├── script/
│   └── backup.sh        # Main backup script
├── config/
│   └── settings.conf    # Configuration file
├── logs/
│   ├── backup.log       # Backup activity log
│   └── cron.log         # Cron execution log
└── backups/             # Local backup storage
⚡ Installation & Setup
Update your system and install required packages:
sudo apt update
sudo apt install zip curl -y
Install rclone for Google Drive integration:
curl https://rclone.org/install.sh | sudo bash
Configure rclone with Google Drive:
rclone config
Authenticate your Google account
Test the connection:
rclone ls drive:
🛠 Configuration

Edit config/settings.conf with your environment:

PROJECT_NAME="MyEC2Backup"
PROJECT_DIR="/home/ubuntu/my-project"
BACKUP_DIR="/home/ubuntu/backups"
REMOTE_NAME="drive"
REMOTE_FOLDER="EC2Backups"
DAILY_RETENTION=7
WEEKLY_RETENTION=4
MONTHLY_RETENTION=3
WEBHOOK_URL="https://webhook.site/your-unique-url"
NOTIFY=true
🚀 Usage

Run the backup script manually:

./script/backup.sh

The script will:

Create timestamped ZIP backups
Upload them to Google Drive
Log all operations in logs/backup.log
⏰ Automate with Cron

Schedule daily backups at 2 AM:

crontab -e

Add the line:

0 2 * * * /home/ubuntu/backup-project/script/backup.sh >> /home/ubuntu/backup-project/logs/cron.log 2>&1

Check scheduled cron jobs:

crontab -l
📊 Logs & Monitoring
Backup activity logs: logs/backup.log
Cron execution logs: logs/cron.log
Optional webhook notifications for real-time status

View logs:

cat ~/backup-project/logs/backup.log
📝 Backup Policies
Daily backups: Keep last 7 days
Weekly backups: Keep last 4 weeks
Monthly backups: Keep last 3 months
Older backups are automatically deleted to manage storage
⚖️ License

Include your preferred license here (e.g., MIT, Apache 2.0).Automated Backup & Cloud Integration
Bash shell scripting
Linux (Ubuntu/Debian)
rclone for Google Drive integration
Cron for scheduling backups
curl for webhook notifications
zip utility for compressed backups
Installation
Update your system and install required packages:
sudo apt update
sudo apt install zip curl -y
Install rclone:
curl https://rclone.org/install.sh | sudo bash
Configure Google Drive remote:
rclone config
Follow the prompts to authenticate your Google account
Test connection:
rclone ls drive:
Project Directory Structure
backup-project/
├── script/
│   └── backup.sh
├── config/
│   └── settings.conf
├── logs/
│   ├── backup.log
│   └── cron.log
└── backups/
Configuration

Edit the settings.conf file to match your environment:

PROJECT_NAME="MyGitProject"
PROJECT_DIR="/home/ubuntu/my-github-code"
BACKUP_DIR="/home/ubuntu/backups"
REMOTE_NAME="drive"
REMOTE_FOLDER="ProjectBackups"
DAILY_RETENTION=7
WEEKLY_RETENTION=4
MONTHLY_RETENTION=3
WEBHOOK_URL="https://webhook.site/your-unique-url"
NOTIFY=true
Usage

Run the backup script manually:

/home/ubuntu/backup-project/script/backup.sh

The script will:

Create timestamped ZIP backups
Store them locally under /backups/YYYY/MM/DD/
Upload backups to Google Drive
Trigger webhook notifications
Log all operations
Backup Policies
Daily backups: retain last 7 days
Weekly backups: retain last 4 weeks
Monthly backups: retain last 3 months
Older backups are automatically deleted to manage storage
Automation

Schedule automatic backups using cron:

crontab -e

Add the following line to run backups daily at 2 AM:

0 2 * * * /home/ubuntu/backup-project/script/backup.sh >> /home/ubuntu/backup-project/logs/cron.log 2>&1
Logs & Monitoring
Backup activity: logs/backup.log
Cron execution: logs/cron.log
Webhook notifications show backup success/failure in real-time
