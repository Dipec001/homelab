# Linux Commands Cheat Sheet

## 🔹 Basic Navigation Commands
- `pwd` → Print current working directory
- `ls` → List files in the current directory
- `cd <directory>` → Change directory

## 🔹 File Management
- `touch file.txt` → Create a new file
- `mkdir new_folder` → Create a new folder
- `rm file.txt` → Delete a file
- `rm -r folder` → Delete a folder and its contents
- `nano <filename>` → Opens the file in read and write mode(if permissions allow)
- `sudo` → (superuser do) Gives superuser commands to run commands that need administrative privileges

## 🔹 File Viewing
- `cat file.txt` → View file content
- `less file.txt` → View file with scrolling
- `head -n 10 file.txt` → Show first 10 lines
- `tail -n 10 file.txt` → Show last 10 lines

## 🔹 System Info
- `uname -a` → Show system info
- `df -h` → Check disk space usage
- `free -m` → Check memory usage

## 🔹 Package management 
- `apt-get install <package-name>` → Installs the package whose name is specified
- `apt-get remove <package-name>` → Removes the package whose name is specified if installed
- `apt-cache search <package-name>*` → It searches for available packages in your system's APT package cache that match the
 given name. The * wildcard allows for partial matches
- `apt-cache search <package-name>`
- `apt-cache policy <package-name>` → Shows the info(version etc) about the specified package


