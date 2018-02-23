shopt -s globstar
for i in **/*.rb
do
  echo "" >> $i
  cat license.txt >> $i
done
