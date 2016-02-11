#sets all the files into hdfs

IN_LOC="in"

hdfs dfs -mkdir -p "assign2/$IN_LOC"

for f in $IN_LOC/*; do
  [[ -e $f ]] || continue
  # echo $f
  hdfs dfs -put "in/$f" "assign2/$f"
done
