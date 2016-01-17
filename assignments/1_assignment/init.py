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
    c.execute(sql)
    #c.execute('create table if not exists %s ( %s, primary key (%s) on conflict ignore);' % (relation, ','.join(headers), headers[0]))

    #c.executemany('insert into %s values (%s)' % (relation, ','.join('?' * len(headers))), read)
    moresql = 'insert into %s values ' % relation
    for i,line in enumerate(read):
      #moresql += '(%s),' % (line)
      lineish = '("' + '","'.join(line) + '"),'
      moresql += lineish
      if relation == 'enrollment':
        pass
        #print(lineish)
      if i % 250 == 0:
        c.execute(moresql[:-1])
        moresql = 'insert into %s values ' % relation

    c.execute(moresql[:-1])
    moresql = 'insert into %s values ' % relation
    conn.commit()
     #('(' + '),('.join(read) + ')'))
    #print(moresql)
