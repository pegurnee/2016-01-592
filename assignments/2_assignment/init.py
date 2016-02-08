#!/usr/bin/env python3
import ftplib
import os

ftp = ftplib.FTP('ftp.ncdc.noaa.gov', 'anonymous', 'egurnee@emich.edu')

limit = 1926
years = range(1901, limit + 1)
store_loc = 'src/'

if not os.path.exists(store_loc):
    os.makedirs(store_loc)

for year in years:
  print('getting year {}'.format(year))
  ftp.cwd('/pub/data/noaa/{0}/'.format(year))
  files = ftp.nlst()

  if not os.path.exists('{0}/{1}/'.format(store_loc, year)):
      os.makedirs('{0}/{1}/'.format(store_loc, year))

  for fname in files:
    if os.path.isfile('{0}/{1}/{2}'.format(store_loc, year, fname)):
      print('  already had {}'.format(fname))
      continue
    with open('{0}/{1}/{2}'.format(store_loc, year, fname), 'wb') as ofile:
      ftp.retrbinary('RETR ' + fname, ofile.write)
