
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

## Level 15 -> level 16
**Goal:** The password for the next level can be retrieved by submitting the password of the current level to port 30001 on
 localhost using SSL/TLS encryption.

```bash
openssl s_client -connect localhost:30001
```
After the prompt, i enter the password gotten from the previous level 8xCjnmgoKbGLhHFAZlGE5Tmu4M2tKJQo and click enter

- The password gotten here is kSkvUpMQ7lBYyCM4GBPvCvT1BfWRy0Dx


## Level 16 -> Level 17
**Goal:** The credentials for the next level can be retrieved by submitting the password of the current level to a port on
 localhost in the range 31000 to 32000. First find out which of these ports have a server listening on them. Then find out which of
 those speak SSL/TLS and which don’t. There is only 1 server that will give the next credentials, the others will simply send
 back to you whatever you send to it.

```bash
nmap -p 31000-32000 --open localhost
```
This (nmap) is used to scan ports on a service, the *--open* flag specifies that we are only looking for open ports so just that
should be returned.
Now we need to check which of the open ports do speak ssl/tls
TO easily find ports in that range in localhost who speak it, we can use
```bash
nmap -sV --script ssl-enum-ciphers -p 31000-32000 localhost
```
We get a response similar to;
31002/tcp open  unknown
31555/tcp open  ssl/https
31790/tcp open  unknown



```bash
echo "kSkvUpMQ7lBYyCM4GBPvCvT1BfWRy0Dx" | openssl s_client -connect localhost:31790 -quiet
```
THis sends the password to the port using openssl and since it's the correct port we get the credentials (ssh key)
**
-----BEGIN RSA PRIVATE KEY-----
MIIEogIBAAKCAQEAvmOkuifmMg6HL2YPIOjon6iWfbp7c3jx34YkYWqUH57SUdyJ
imZzeyGC0gtZPGujUSxiJSWI/oTqexh+cAMTSMlOJf7+BrJObArnxd9Y7YT2bRPQ
Ja6Lzb558YW3FZl87ORiO+rW4LCDCNd2lUvLE/GL2GWyuKN0K5iCd5TbtJzEkQTu
DSt2mcNn4rhAL+JFr56o4T6z8WWAW18BR6yGrMq7Q/kALHYW3OekePQAzL0VUYbW
JGTi65CxbCnzc/w4+mqQyvmzpWtMAzJTzAzQxNbkR2MBGySxDLrjg0LWN6sK7wNX
x0YVztz/zbIkPjfkU1jHS+9EbVNj+D1XFOJuaQIDAQABAoIBABagpxpM1aoLWfvD
KHcj10nqcoBc4oE11aFYQwik7xfW+24pRNuDE6SFthOar69jp5RlLwD1NhPx3iBl
J9nOM8OJ0VToum43UOS8YxF8WwhXriYGnc1sskbwpXOUDc9uX4+UESzH22P29ovd
d8WErY0gPxun8pbJLmxkAtWNhpMvfe0050vk9TL5wqbu9AlbssgTcCXkMQnPw9nC
YNN6DDP2lbcBrvgT9YCNL6C+ZKufD52yOQ9qOkwFTEQpjtF4uNtJom+asvlpmS8A
vLY9r60wYSvmZhNqBUrj7lyCtXMIu1kkd4w7F77k+DjHoAXyxcUp1DGL51sOmama
+TOWWgECgYEA8JtPxP0GRJ+IQkX262jM3dEIkza8ky5moIwUqYdsx0NxHgRRhORT
8c8hAuRBb2G82so8vUHk/fur85OEfc9TncnCY2crpoqsghifKLxrLgtT+qDpfZnx
SatLdt8GfQ85yA7hnWWJ2MxF3NaeSDm75Lsm+tBbAiyc9P2jGRNtMSkCgYEAypHd
HCctNi/FwjulhttFx/rHYKhLidZDFYeiE/v45bN4yFm8x7R/b0iE7KaszX+Exdvt
SghaTdcG0Knyw1bpJVyusavPzpaJMjdJ6tcFhVAbAjm7enCIvGCSx+X3l5SiWg0A
R57hJglezIiVjv3aGwHwvlZvtszK6zV6oXFAu0ECgYAbjo46T4hyP5tJi93V5HDi
Ttiek7xRVxUl+iU7rWkGAXFpMLFteQEsRr7PJ/lemmEY5eTDAFMLy9FL2m9oQWCg
R8VdwSk8r9FGLS+9aKcV5PI/WEKlwgXinB3OhYimtiG2Cg5JCqIZFHxD6MjEGOiu
L8ktHMPvodBwNsSBULpG0QKBgBAplTfC1HOnWiMGOU3KPwYWt0O6CdTkmJOmL8Ni
blh9elyZ9FsGxsgtRBXRsqXuz7wtsQAgLHxbdLq/ZJQ7YfzOKU4ZxEnabvXnvWkU
YOdjHdSOoKvDQNWu6ucyLRAWFuISeXw9a/9p7ftpxm0TSgyvmfLF2MIAEwyzRqaM
77pBAoGAMmjmIJdjp+Ez8duyn3ieo36yrttF5NSsJLAbxFpdlc1gvtGCWW+9Cq0b
dxviW8+TFVEBl1O4f7HVm6EpTscdDxU+bCXWkfjuRb7Dy9GOtt9JPsX8MBTakzh3
vBgsyi/sN3RqRBcGU40fOoZyfAMT8s1m/uYv52O6IgeuZ/ujbjY=
-----END RSA PRIVATE KEY-----

We save this to a file `nano bandit17.key` which we canuse to login to bandit 17

modify the file permissions using `chmod 600 bandit17.key` so that it's secure

And to login we use 
```bash
ssh -i /path/to/sshkey bandit17.key bandit17@bandit.labs.overthewire.org -p 2220
```

We are then logged in as bandit17 user
