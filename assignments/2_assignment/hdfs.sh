#sets all the files into hdfs

IN_LOC="in"

for f in $IN_LOC/*; do
  [[ -e $f ]] || continue
  echo $f
done
