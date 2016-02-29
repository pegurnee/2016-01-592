#sets all the files into hdfs

IN_LOC="in"

hdfs dfs -rm -r "assign3/$IN_LOC"
hdfs dfs -mkdir -p "assign3/$IN_LOC"

for f in $IN_LOC/*; do
  [[ -e $f ]] || continue
  # echo $f
  hdfs dfs -put "$f" "assign3/$f"
done
