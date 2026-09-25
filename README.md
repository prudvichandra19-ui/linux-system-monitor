# linux-system-monitor
A lightweight Bash script to monitor system resources and process utilization.
# Linux System Health Monitor

A lightweight command-line monitoring script written in Bash that checks CPU usage, memory utilization, disk space, and active processes in real time.

## Features

- **System Uptime & Host Information:** Displays hostname and system run duration.
- **RAM Monitoring:** Formats available and used physical memory.
- **Disk Usage Alerts:** Alerts if the root partition (`/`) exceeds 85% capacity.
- **Process Inspection:** Lists the top processes consuming the most CPU.

## Prerequisites

- Linux operating system (Ubuntu, Debian, Fedora, Arch, or WSL on Windows)
- Standard GNU core utilities (`awk`, `df`, `free`, `ps`)

## Installation & Usage

1. Clone the repository:

   ```bash
   git clone https://github.com/prudvichandra19-ui/linux-system-monitor.git
   cd linux-system-monitor
   ```

2. Make the script executable:

   ```bash
   chmod +x sysmon.sh
   ```

3. Run the sysmon:

   ```bash
   ./sysmon.sh
   ```

## Bash Script Preview

```bash
#!/bin/bash

echo "Linux System Health Monitor"
echo "==========================="
echo "Hostname: $(hostname)"
echo "Uptime: $(uptime -p)"
echo
echo "Memory Usage:"
free -h
echo
echo "Disk Usage:"
df -h /
echo
echo "Top CPU Processes:"
ps aux --sort=-%cpu | head -n 6
```
