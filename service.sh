#!/bin/bash

# Service to monitor
SERVICE="httpd"
# System administrator email
ADMIN_EMAIL="admin@example.com"

# Function to check if the service is running
check_service() {
    systemctl is-active --quiet $SERVICE
}

# Function to start the service
start_service() {
    systemctl start $SERVICE
}

# Function to send notification email
send_notification() {
    SUBJECT="Service $SERVICE restarted"
    BODY="The $SERVICE service was found stopped and has been restarted on $(hostname) at $(date)."
    echo "$BODY" | mail -s "$SUBJECT" $ADMIN_EMAIL
}

# Main script logic
if ! check_service; then
    start_service
    if check_service; then
        send_notification
    else
        echo "Failed to start $SERVICE" | mail -s "Service $SERVICE failed to start" $ADMIN_EMAIL
    fi
fi

