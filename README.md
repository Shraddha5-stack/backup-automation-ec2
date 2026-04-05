# Automated Backup System for AWS EC2

A robust, automated backup solution for EC2 instances with Google Drive integration, cron scheduling, and detailed logging.

## Introduction

This project provides a fully automated backup system for AWS EC2 instances running Linux (Ubuntu). It is designed to create timestamped backups of critical project files, upload them securely to Google Drive using rclone, and maintain detailed logs. Cron jobs automate scheduling, ensuring reliable and consistent backups with minimal manual intervention.

## Technology Stack

- **AWS EC2** – Cloud server hosting  
- **Linux (Ubuntu)** – Operating system  
- **Bash Scripting** – Automation scripts  
- **rclone** – Cloud storage integration with Google Drive  
- **Cron Jobs** – Scheduling automated tasks  
- **curl** – Optional webhook notifications  
- **zip** – Compressed backups
   

## Features

- Automated local backups  
- Offsite backup to Google Drive for redundancy  
- Configurable retention policies (daily, weekly, monthly)  
- Organized, timestamped backup directories  
- Logging system for monitoring and auditing


## Project Structure
backup-project/
├── script/
│ └── backup.sh 

├── config/
│ └── settings.conf 

├── logs/
│ ├── backup.log
│ └── cron.log

└── backups/ 


## Configuration Setup

Update configuration file with project paths and retention values:

PROJECT_NAME="MyEC2Backup"

PROJECT_DIR="/home/ubuntu/my-project"

BACKUP_DIR="/home/ubuntu/backups"

REMOTE_NAME="drive"

REMOTE_FOLDER="EC2Backups"

DAILY_RETENTION=7

WEEKLY_RETENTION=4

MONTHLY_RETENTION=3

WEBHOOK_URL="https://webhook.site/your-unique-url
"

NOTIFY=true


## Backup Script Execution

Run the backup script manually:
cd ~/backup-project
./script/backup.sh


- Creates timestamped ZIP backups  
- Uploads backups to Google Drive  
- Logs all operations in `logs/backup.log`  

## Rotational Backup Policy

- **Daily backups:** Keep the last 7 days  
- **Weekly backups:** Keep the last 4 weeks  
- **Monthly backups:** Keep the last 3 months  

Older backups are automatically deleted to manage storage efficiently.

## Automation Using Cron

Schedule daily backups at 2 AM:
crontab -e


Add the following line:

0 2 * * * /home/ubuntu/backup-project/script/backup.sh >> /home/ubuntu/backup-project/logs/cron.log 2>&1


Verify scheduled cron jobs:
crontab -l


## Logs and Monitoring

- Backup logs: `logs/backup.log`  
- Cron execution logs: `logs/cron.log`  
- webhook notifications can provide real-time backup status.  

View logs:

tail -f ~/backup-project/logs/backup.log


## Project Summary

This solution provides a production-ready automated backup system for EC2 instances, combining local and cloud storage with logging, monitoring, and automated retention policies. It is suitable for DevOps engineers, system administrators, and anyone requiring secure, reliable backup automation.

## License

Specify your preferred license here (e.g., MIT, Apache 2.0).
