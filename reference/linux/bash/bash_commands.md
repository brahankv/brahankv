## BASH Commands

#### Generate random port number in a range
```bash
shuf -i 30575-30600 -n 1
```
using awk,
```bash
awk -v min=30575 -v max=30600 'BEGIN{srand(); print int(min+rand()*(max-min+1))}'
```
