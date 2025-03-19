## Viewing Top 5 CPU-Consuming Processes

To get a snapshot of the top 5 CPU-consuming processes on your system, use the following command:

ps -eo pid,comm,%cpu --sort=-%cpu | head -6

Explanation:

ps -eo pid,comm,%cpu → Displays the Process ID (PID), command name, and CPU usage percentage.

--sort=-%cpu → Sorts processes by CPU usage in descending order.

head -6 → Displays the top 5 processes (the first row is the header).

My Output:

    PID COMMAND         %CPU
    992 redis-server     0.2
      1 systemd          0.0
    104 systemd-udevd    0.0
     59 systemd-journal  0.0
    178 wsl-pro-service  0.0

Alternatively, you can use top or htop:

Run top and press Shift + P to sort by CPU usage.

Install htop with sudo apt install htop, then run htop for a better interactive view.
