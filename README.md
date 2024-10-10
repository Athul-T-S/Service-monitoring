# Service Monitoring Script for MyComp

This project contains a Bash script that monitors essential services like `httpd` and `sshd` on MyComp servers. The script checks if the service is running, restarts it if needed, and sends a notification email to the system administrator if a restart occurs. The script can be automated using cron to run at regular intervals, ensuring continuous monitoring.

## Features

- **Service Monitoring**: Automatically checks if a specified service (e.g., `httpd`, `sshd`) is running.
- **Restart Service**: If the service is found to be stopped, the script will start it.
- **Email Notification**: Sends an email to the system administrator when the service is restarted or if the restart fails.
- **Automation**: The script can be scheduled to run at regular intervals using cron.

## Files

- `service_monitor.sh`: The main script that handles service monitoring, restarting, and notification.

## Prerequisites

1. **mailutils**: Required to send email notifications.
   ```bash
   sudo apt-get install mailutils  # For Debian-based systems
   sudo yum install mailx          # For Red Hat-based systems
   sudo dnf insatll procmail       # For Red Hat-based systems

   How to Use
Clone this repository to your server:

bash
Copy code
git clone https://github.com/your-username/service-monitoring.git
cd service-monitoring-mycomp
Make the script executable:

bash
Copy code
chmod +x service.sh
Update the script configuration:

SERVICE: Specify the service you want to monitor (e.g., httpd, sshd).
ADMIN_EMAIL: Set the system administrator's email address to receive notifications.
Run the script manually to verify functionality:

bash
Copy code
sudo ./service.sh
The log for the operation will be stored in your system's mail logs (e.g., /var/mail/root).

Setting up Automation with Cron
To automate the script and run it every 5 minutes:

Open the crontab editor:

bash
Copy code
crontab -e
Add the following line to schedule the script to run every 5 minutes:

bash
Copy code
*/5 * * * * /path/to/service.sh
Verify the cron job is set up correctly:

bash
Copy code
crontab -l

Verifying the Script
To check if the service is running after the script has executed, use:

bash
Copy code
sudo systemctl status httpd
Check the system's mail log for notifications sent by the script. For example, on Debian-based systems:

bash
Copy code
sudo cat /var/mail/root
To verify the cron job, you can inspect the cron job list:

bash
Copy code
crontab -l

