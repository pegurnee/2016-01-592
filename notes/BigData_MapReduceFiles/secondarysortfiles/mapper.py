import sys

for line in sys.stdin:
    line = line.strip().split(',')
    keyVal = line[0]+'\t'+line[1]+'\t'+line[3]
    print keyVal
