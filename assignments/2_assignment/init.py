#!/usr/bin/env python3
import ftplib

def _write(block, file_to_write):
  file_to_write.write(block)

ftp = ftplib.FTP('ftp.ncdc.noaa.gov', 'anonymous', 'egurnee@emich.edu')

ftp.cwd('/pub/data/noaa/')

# dest = '1901'
# ofile = open(dest, 'wb')
# ftp.retrbinary('RETR ' + dest, _write)

print("File List: ")

files = ftp.nlst()

for f in files:
  print(f)

ofs = ftp.mlsd(facts=['type'])

for f in ofs:
  print(f)
