#!/usr/bin/env python3
import ftplib

def _write(block, file_to_write):
  file_to_write.write(block)


years = range(1901, 1926)

ftp = ftplib.FTP('ftp.ncdc.noaa.gov', 'anonymous', 'egurnee@emich.edu')
ftp.cwd('/pub/data/noaa/1901/')

files = ftp.nlst()
for fname in files:
  with open(fname, 'wb') as ofile:
    ftp.retrbinary('RETR ' + fname, ofile.write)

# dest = '1901'
# ofile = open(dest, 'wb')
# ftp.retrbinary('RETR ' + dest, _write)

print("File List: ")


for f in files:
  print(f)

ofs = ftp.mlsd(facts=['type'])

for f in ofs:
  print(f)
