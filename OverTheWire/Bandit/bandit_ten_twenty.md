
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
