#!/usr/bin/env python3
import ftplib
import gzip
import os

with ftplib.FTP('ftp.ncdc.noaa.gov', 'anonymous', 'egurnee@emich.edu') as ftp:

  limit = 1901
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
      local_fname = '{0}/{1}/{2}'.format(store_loc, year, fname)
      if os.path.isfile(local_fname):
        print('  already had {}'.format(fname))
        continue
      with open(local_fname, 'wb') as ofile:
        ftp.retrbinary('RETR ' + fname, ofile.write)

      try:
        with open(local_fname[:-3], 'wb') as uzip:
          with gzip.open(local_fname, 'rb') as zdld:
            uzip.write(zdld.read())
            os.remove(local_fname)
      except EOFError as e:
        print('couldn\'t unzip {} because of {}'.format(local_fname, e))

print('all source files downloaded and unzipped')
