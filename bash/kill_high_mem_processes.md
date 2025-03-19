## Kill High Memory Usage Processes

*Overview*

This script identifies and kills processes that use more than 1GB of RAM. It extracts the process list, checks their memory
 usage, and terminates those exceeding the threshold.


Bash Script

#!/bin/bash

# This script kills processes that use more than 1GB of RAM.
# It retrieves the list of running processes, filters those exceeding 1GB memory usage,
# and forcefully terminates them.

# Define memory threshold (1GB in KB)
THRESHOLD=1048576  # 1GB = 1024 * 1024 KB

echo "Checking for processes using more than 1GB of RAM..."

# Get process list, filter by memory usage, extract PID, and kill
ps aux | awk -v threshold="$THRESHOLD" '$6 > threshold {print $2}' | while read -r pid; do
    if [[ -n "$pid" ]]; then
        echo "Killing process $pid (using more than 1GB RAM)..."
        kill -9 "$pid"
    fi
done

echo "Done."

- The command `ps aux` gives a snapshot of the processes currently running. Mine looks like;

dipec@DIPEC:/$ ps aux
USER         PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
root           1  0.0  0.3  22092 13572 ?        Ss   Mar16   2:32 /sbin/init
root           2  0.0  0.0   2776  1920 ?        Sl   Mar16   0:33 /init
root           6  0.0  0.0   2792    68 ?        Sl   Mar16   0:00 plan9 --control-socket 7 --log-level 4 --server-fd 8 --pipe-fd 1
root          59  0.0  0.5  75440 23144 ?        S<s  Mar16   1:34 /usr/lib/systemd/systemd-journald
root         104  0.0  0.1  24968  6728 ?        Ss   Mar16   2:16 /usr/lib/systemd/systemd-udevd
systemd+     134  0.0  0.3  21452 12040 ?        Ss   Mar16   0:20 /usr/lib/systemd/systemd-resolved
systemd+     139  0.0  0.1  91020  6596 ?        Ssl  Mar16   0:30 /usr/lib/systemd/systemd-timesyncd
root         164  0.0  0.0   4236  2728 ?        Ss   Mar16   0:07 /usr/sbin/cron -f -P
message+     165  0.0  0.1   9704  5396 ?        Ss   Mar16   0:12 @dbus-daemon --system --address=systemd: --nofork --nopidfile --
root         174  0.0  0.2  18180  8712 ?        Ss   Mar16   0:11 /usr/lib/systemd/systemd-logind
root         176  0.0  0.3 468968 15372 ?        Ssl  Mar16   0:21 /usr/libexec/udisks2/udisksd
root         178  0.0  0.5 1904456 20528 ?       Ssl  Mar16   1:26 /usr/libexec/wsl-pro-service -vv
root         197  0.0  0.0   3160  1148 hvc0     Ss+  Mar16   0:00 /sbin/agetty -o -p -- \u --noclear --keep-baud - 115200,38400,96
root         211  0.0  0.0   3116  1148 tty1     Ss+  Mar16   0:00 /sbin/agetty -o -p -- \u --noclear - linux
polkitd      212  0.0  0.2 308160  7880 ?        Ssl  Mar16   0:14 /usr/lib/polkit-1/polkitd --no-debug
root         224  0.0  0.5 106992 22872 ?        Ssl  Mar16   0:00 /usr/bin/python3 /usr/share/unattended-upgrades/unattended-upgra
root         325  0.0  0.1   6700  4624 pts/1    Ss   Mar16   0:00 /bin/login -f
root         421  0.0  0.2  20108 11384 ?        Ss   Mar16   0:20 /usr/lib/systemd/systemd --user
root         422  0.0  0.0  21192  1724 ?        S    Mar16   0:00 (sd-pam)
root         433  0.0  0.1   6072  5208 pts/1    S+   Mar16   0:00 -bash
redis        992  0.2  0.4  62348 16616 ?        Ssl  Mar17   7:36 /usr/bin/redis-server 127.0.0.1:6379
dipec       1122  0.0  0.2  20336 11580 ?        Ss   Mar17   0:23 /usr/lib/systemd/systemd --user
dipec       1123  0.0  0.0  21180  1732 ?        S    Mar17   0:00 (sd-pam)

- The RSS column containst the data we need. RSS (Resident Set Size): The actual physical RAM being used by the process
 (excluding swapped-out memory).
We pipe the first command to this `awk -v threshold="$THRESHOLD" '$6 > threshold {print $2}'` which checks the rss and returns 
the ones which are using ram greater than the threshold which i set to 1GB.

- Then the while loop kills them forcefully using their PID(process ids)

Usage Instructions

Save the script as kill_high_mem_processes.sh.

Make it executable:

chmod +x kill_high_mem_processes.sh

Run the script with:

./kill_high_mem_processes.sh

Notes

This script forcefully kills processes (kill -9). Use with caution.

It is recommended to run this script as root or with sudo to ensure it can terminate all processes.

Modify the threshold (THRESHOLD) if you need a different memory limit.
