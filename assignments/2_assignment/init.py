#!/usr/bin/env python3
import ftplib
import gzip
import os

with ftplib.FTP('ftp.ncdc.noaa.gov', 'anonymous', 'egurnee@emich.edu') as ftp:

  limit = 1926
  years = range(1901, limit + 1)
  store_loc = 'in/'

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
      if os.path.isfile(local_fname) or os.path.isfile(local_fname[:-3]):
        print('  already had {}'.format(fname))
        continue
      with open(local_fname, 'wb') as ofile:
        ftp.retrbinary('RETR ' + fname, ofile.write)

      try:
        with open('{0}/{1}/{1}.txt'.format(store_loc, year), 'ab') as uzip:
          with gzip.open(local_fname, 'rb') as zdld:
            uzip.write(zdld.read())
            os.remove(local_fname)
      except EOFError as e:
        print('couldn\'t unzip {} because of {}'.format(local_fname, e))

print('all source files downloaded and unzipped')
