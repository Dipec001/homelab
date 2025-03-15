## Level 10 -> Level 11
**Goal:** "Get The password for the next level which is stored in the file data.txt, where all lowercase (a-z) and uppercase (A-Z) letters
 have been rotated by 13 positions"

```bash
cat data.txt | tr 'A-Za-z' 'N-ZA-Mn-za-m'
```
OR
```bash
tr 'A-Za-z' 'N-ZA-Mn-za-m' < data.txt
```

Using the ROT13 conversion to convert the passsword 'VGhlIHBhc3N3b3JkIGlzIGR0UjE3M2ZaS2IwUlJzREZTR3NnMlJXbnBOVmozcVJyCg=='
 in the txt file to the actual password value.

- THe password gotten here is 'ITuyVUOup3A3o3WxVTymVTE0HwR3Z2MnF2VjHyWmERMGE3AaZyWKoaOBIzbmpIWlPt=='

