# linux-group-shared-directory-sgid-monitoring
A Linux administration project that demonstrates shared directory management using SGID, user/group administration, Bash scripting, and automated monitoring with Cron.
Project Overview

In a development environment, multiple users often need to collaborate on the same files. Without proper group permissions, newly created files may belong to different groups, causing permission issues.

This project solves that problem by:

Creating a common developers group.
Assigning users to the group.
Creating a shared directory.
Enabling SGID so new files inherit the developers group.
Monitoring the directory with a Bash script.
Logging verification results.
Automating monitoring using Cron.
Objective

The main objective of this project is to implement a secure shared workspace where team members can collaborate without file permission conflicts.

The project includes:

Creating a Linux group.
Creating multiple users.
Assigning users to the group.
Configuring a shared directory.
Setting SGID permissions.
Writing a Bash monitoring script.
Logging monitoring results.
Scheduling the script using Cron.
Prerequisites

Before starting this project, ensure the following:

Ubuntu Linux (or another Linux distribution)
Root or sudo privileges
Basic knowledge of Linux commands
Bash shell installed
Cron service available
Git and GitHub (for version control)
Skills Covered
Linux User Management
Linux Group Management
File Permissions
SGID (Set Group ID)
Directory Management
Bash Shell Scripting
File Monitoring
Logging
Cron Job Scheduling
Linux Security
System Administration
Git & GitHub
Technologies Used
Technology	Purpose
Ubuntu Linux	Operating System
Bash	Shell Scripting
groupadd	Create Group
useradd	Create Users
usermod	Add Users to Group
mkdir	Create Directory
chmod	Set SGID Permission
chgrp	Change Group Ownership
stat	Verify Group Ownership
Cron	Schedule Monitoring Script
Git	Version Control
GitHub	Repository Hosting
Project Architecture
Users
│
├── user1
├── user2
│
▼
developers Group
│
▼
/home/devshare
│
├── test.txt
├── project.txt
├── code.sh
│
▼
monitor_devshare.sh
│
▼
devshare_monitor.log
Folder Structure
linux-group-shared-directory-sgid-monitoring/
│
├── README.md
├── LICENSE
├── .gitignore
│
├── scripts/
│   └── monitor_devshare.sh
│
├── outputs/
│   └── devshare_monitor.log
│
└── screenshots/
    ├── 01.create_group.png
    ├── 02.create_users.png
    ├── 03.add_users_group.png
    ├── 04.create_directory.png
    ├── 05.set_sgid.png
    ├── 06.test_sgid.png
    ├── 07.script_creation.png
    ├── 08.running_script.png
    ├── 09.monitor_log.png
    ├── 10.cron_job.png
    └── 11.validation.png
Project Workflow
Step 1: Create Developers Group
Description

Create a new Linux group named developers that will be shared among all team members.

Commands
sudo groupadd developers

cat /etc/group | grep developers
Expected Output
developers:x:1002:
Step 2: Create Users
Description

Create two Linux users who will collaborate inside the shared directory.

Commands
sudo useradd user1

sudo useradd user2

sudo passwd user1

sudo passwd user2
Step 3: Add Users to Developers Group
Description

Add both users to the developers group so they inherit shared permissions.

Commands
sudo usermod -aG developers user1

sudo usermod -aG developers user2

Verify:

groups user1

groups user2
Step 4: Create Shared Directory
Description

Create a directory that will be shared among all developers.

Commands
sudo mkdir /home/devshare

sudo chgrp developers /home/devshare
Step 5: Enable SGID
Description

Apply the SGID permission so every newly created file automatically inherits the developers group.

Command
sudo chmod 2775 /home/devshare

Verify

ls -ld /home/devshare

Expected Output

drwxrwsr-x
Step 6: Test SGID
Description

Create a sample file to verify that it automatically inherits the developers group.

Commands
touch /home/devshare/test.txt

ls -l /home/devshare
Step 7: Create Monitoring Script
Description

Develop a Bash script that:

Monitors files inside /home/devshare
Checks group ownership
Writes results into a log file
Step 8: Run the Script
Description

Make the script executable and run it.

Commands
chmod +x monitor_devshare.sh

./monitor_devshare.sh
Step 9: Check Log File
Description

Verify that the monitoring script logged the results correctly.

Command
cat devshare_monitor.log
Step 10: Configure Cron
Description

Automate monitoring by scheduling the script to execute every five minutes.

Commands
crontab -e

Add

*/5 * * * * /home/username/monitor_devshare.sh

Verify

crontab -l
Script Explanation

The monitoring script performs the following tasks:

Defines the shared directory path.
Defines the log file path.
Records the current date and time.
Reads every file inside /home/devshare.
Uses the stat command to determine the group owner.
Compares the group with developers.
Logs Correct Group if the ownership matches.
Logs Wrong Group if the ownership is incorrect.
Ends the monitoring session.
Commands Used
Command	Description
groupadd	Create Linux group
useradd	Create Linux users
passwd	Set user passwords
usermod	Add users to group
mkdir	Create directory
chgrp	Change directory group
chmod	Enable SGID
stat	Display group ownership
ls	Verify permissions
touch	Create test file
cat	Display log file
chmod +x	Make script executable
crontab	Schedule automated execution
Screenshots

#Output
Screenshots of output are uploaded in outputs folder

#Learning Outcome

After completing this project, I learned how to manage Linux users and groups, configure shared directories using SGID, automate monitoring with Bash scripts, log system events, and schedule recurring tasks using Cron. This project enhanced my understanding of Linux permissions, collaboration mechanisms, and automation, which are essential skills for Linux Administration, DevOps, and Cloud Engineering.
