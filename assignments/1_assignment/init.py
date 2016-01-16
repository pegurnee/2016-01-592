import sqlite3
import csv

conn = sqlite3.connect('src/assign1.db')
c = conn.cursor()

relations = [
  'building',
  'campus',
  'classes',
  'college',
  'department',
  'subject',
  'term',
  'enrollment'
  ]
bigun = 'enrollment'

for relation in relations:
  with open('src/raw_%s.csv' % relation, newline='') as f:
    read = csv.reader(f)
    headers = next(read)

    sql = '''
    create table
      if not exists
    %s
    (
      %s
    );
    ''' % (relation, ','.join(headers))

    #c.execute('create table if not exists %s ( %s, primary key (%s) on conflict ignore);' % (relation, ','.join(headers), headers[0]))

    c.executemany('insert into %s values (%s)' % (relation, ','.join('?' * len(headers))), read)
