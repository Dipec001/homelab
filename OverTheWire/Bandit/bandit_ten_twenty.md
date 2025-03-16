
## Level 10 → Level 11  

**Goal:**  
*"The password for the next level is stored in the file `data.txt`, which contains base64 encoded data

1. **Check the contents of `data.txt`**  
   ```bash
   cat data.txt
   ```
   **Output:**  
   ```
   VGhlIHBhc3N3b3JkIGlzIGR0UjE3M2ZaS2IwUlJzREZTR3NnMlJXbnBOVmozcVJyCg==
   ```

2. **Recognize Base64 encoding and decode it**  
   ```bash
   base64 -d data.txt
   ```
   **Output:**  
   ```
   The password is dtR173fZKb0RRsDFSGsg2RWnpNVj3qRr
   ```

- Password for Level 11 -  dtR173fZKb0RRsDFSGsg2RWnpNVj3qRr

## Level 11 -> Level 12
**Goal: ** The password for the next level is stored in the file data.txt, where all lowercase (a-z) and uppercase (A-Z) letters
 have been rotated by 13 positions

We need to use the idea of ROT13
```bash
cat data.txt | tr 'A-Za-z' 'N-ZA-Mn-za-m'
```

The result of this command is 'The password is 7x16WNeHIi5YkIhWsfFIqoognUTyj9Q4'

- The password gotten here is - 7x16WNeHIi5YkIhWsfFIqoognUTyj9Q4


## Level 12 -> Level 13

**Goal:** 
The password for the next level is stored in the file data.txt, which is a hexdump of a file that has been repeatedly compressed.
For this level it may be useful to create a directory under /tmp in which you can work. Use mkdir with a hard to guess directory
name. Or better, use the command “mktemp -d”. Then copy the datafile using cp, and rename it using mv (read the manpages!)

To solve this, the first thing i did was create a temp unique dir using the command
```
mktemp -d
```
a dir was created under /tmp with the name *tmp.wXHgyqoR4e*
i copied the data.txt file to this temp dir using the command
```
cp data.txt /tmp/tmp.wXHgyqoR4e
```
- Moved into the dir where the data was copied to and since it's a hexdump, i did convert it to binary using the command
```
xxd -r data.txt > data.bin
```
The .txt file was converted to a .bin file which is saved under *data.bin*

It was stated that the file was compressed multiple times and i actually did uncompress it multiple times. The files were
compressed to different formats. the gzip, bzip2, tar
Here are the commands i used to do the uncompression

## File Type ->	Decompression Command
gzip compressed data ->	mv data data.gz && gunzip data.gz
bzip2 compressed data ->	mv data data.bz2 && bunzip2 data.bz2
tar archive ->	tar -xvf data
POSIX shell archive (shar) ->	sh data

- After each compressing, i checked the file type by using the command
```
file <filename>
```
When the file type becomes ASCII text, it did this 👇
ASCII text ->	cat data (✅ This means you've reached the password!)

- The password gotten here is *FO5dwFsc0cbaIiH0h8J2eUks2vdTDwAn*

## Level 13 -> Level 14
**Goal:** The password for the next level is stored in /etc/bandit_pass/bandit14 and can only be read by user bandit14. For this
 level, you don’t get the next password, but you get a private SSH key that can be used to log into the next level. Note:
 localhost is a hostname that refers to the machine you are working on

```bash
ssh -i sshkey.private -p 2220 bandit14@localhost
```
This is the command i am using to log in to Level 14 as user bandit14. The usual command to log in to ssh is 
```ssh username@hostname
```
And log in with the password but here we use the private key(sshkey.private) to login so we use the flag *-i* AND Overthewire
(bandit) uses port 2220 and not the default 22 so we use the *-p* to specify the port 2220 then the username as *bandit* and the
hostname *localhost*
So now that we are logged in as bandit14 user, we have permission to read the file and get the password from file bandit14

- The password for this level is *MU4VWeTyJk8ROof1qqmcBPaLh7lDCPvS*

## Level 14 -> Level 15
**Goal:** The password for the next level can be retrieved by submitting the password of the current level to port 30000 on
 localhost.

```bash
telnet localhost 30000
```
Then submit the code gotten from the previous step *MU4VWeTyJk8ROof1qqmcBPaLh7lDCPvS* and click enter

- the password gotten here is 8xCjnmgoKbGLhHFAZlGE5Tmu4M2tKJQo

