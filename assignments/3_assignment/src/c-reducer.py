#!/usr/bin/env python

import sys

# input comes from STDIN
for line in sys.stdin:
  # remove leading and trailing whitespace
  line = line.strip()

  # parse the input we got from mapper.py
  count, word = line.split('\t', 1)

  # convert count (currently a string) to int
  # i'm relatively sure this isn't going to happen, but just in case
  try:
    count = int(count)
  except ValueError:
    # count was not a number, so silently
    # ignore/discard this line
    continue

  print '%s\t%s' % (word, count)
