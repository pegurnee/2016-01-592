from itertools import groupby
from operator import itemgetter
import sys

def read_mapper_output(file, separator='\t'):
    for line in file:
        yield line.rstrip().split(separator)

def main(separator='\t'):
    data = read_mapper_output(sys.stdin, separator=separator)
    for key, values in groupby(data, itemgetter(0, 1)):
        print key[0]+'-'+key[1], ','.join(map(itemgetter(2), values))     

if __name__ == "__main__":
    main()
