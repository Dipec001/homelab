🚀 Process Check & Auto-Restart Script

📅 Date: 3/19/25
👤 Author: Dipec
💻 System: Ubuntu 24.04

1️⃣ Why Monitor Running Processes?

Processes like web servers (nginx, apache), databases (mysql, postgres), and other critical services must be running at all times. If they crash, it can lead to:
✅ Downtime
✅ Service disruptions
✅ Security risks

To prevent this, I automated a process check & auto-restart script to ensure key services stay active.

2️⃣ The Bash Script (check-process.sh)

I wrote a simple Bash script to check if a process is running and restart it if it's down.

#!/bin/bash

if pgrep -x "nginx" > /dev/null; then
    echo "Nginx is running"
else
    echo "Nginx is NOT running, restarting..."
    sudo systemctl restart nginx
fi

🔹 What This Script Does:
✔ Checks if nginx is running using pgrep
✔ If running, it prints a message
✔ If NOT running, it restarts nginx automatically

3️⃣ Automate It with Cron

I set up a cron job to run the script every 5 minutes, ensuring nginx stays up.

🔧 Edit the cron jobs:

crontab -e

📌 Add this line at the bottom:

*/5 * * * * /path/to/check-process.sh

🔹 How It Works:

Cron Field

Value

Meaning

Minute

*/5

Runs every 5 minute

4️⃣ Logging & Alerts

To log restarts, modify the script:

#!/bin/bash

log_file="/var/log/process_monitor.log"

if pgrep -x "nginx" > /dev/null; then
    echo "$(date): Nginx is running" >> "$log_file"
else
    echo "$(date): Nginx was down! Restarting..." | tee -a "$log_file"
    sudo systemctl restart nginx
fi

📌 Now, every restart is logged in /var/log/process_monitor.log.

5️⃣ Future Improvements 🔮

🚀 Integrate Telegram alerts for instant notifications
🚀 Extend to monitor multiple services (MySQL, Apache, etc.)
🚀 Add email notifications when a restart occurs

📌 Now my homelab ensures critical services stay up! 🚀

