## Cron Job Scheduling in Linux

A cron job consists of five time fields followed by the command to execute:

m  h  dom  mon  dow   command

- m (Minute) → 0-59

- h (Hour) → 0-23

- dom (Day of Month) → 1-31

- mon (Month) → 1-12

- dow (Day of Week) → 0-7 (0 & 7 = Sunday)

- command → The actual command to execute

### Common Scheduling Examples

Schedule

Description

Command Example

* * * * *

Runs every minute

* * * * * ls > ~/cronres.txt

0 * * * *

Runs at the start of every hour

0 * * * * echo "Hourly job"

30 2 * * *

Runs at 2:30 AM daily

30 2 * * * /path/to/script.sh

0 0 * * 0

Runs every Sunday at midnight

0 0 * * 0 backup.sh

*/10 * * * *

Runs every 10 minutes

*/10 * * * * echo "Job running"

0 9-17 * * *

Runs every hour from 9 AM to 5 PM

0 9-17 * * * notify.sh

Managing Cron Jobs

Edit crontab:

crontab -e

View scheduled jobs:

crontab -l

Remove all cron jobs:

crontab -r

Redirecting Cron Output

By default, cron does not show output. To log it:

* * * * * my_command >> /home/dipec/logs.txt 2>&1

>> → Appends output to logs.txt

2>&1 → Captures errors too
