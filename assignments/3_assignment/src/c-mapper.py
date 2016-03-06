#!/usr/bin/env python

import sys

# input comes from STDIN (standard input)
for line in sys.stdin:
  # remove leading and trailing whitespace
  line = line.strip()
  # split the line into words
  word, count = line.split()

  print '%s\t%s' % (count, word)
