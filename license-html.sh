shopt -s globstar
for i in `grep --include=\*.{html\.erb,html} --exclude-dir=vendor -rwL . -e 'Solamo'`
do
  echo "<!--" >> $i
  echo "# Author: ${1}" >> $i
  echo "# This is a course requirement for CS 192 Software Engineering II under the supervision of Asst. Prof. Ma. Rowena C. Solamo of the Department of Computer Science, College of Engineering, University of the Philippines, Diliman for the AY 2017-2018." >> $i

  echo "" >> $i
  echo "# Code History:" >> $i
  echo "# ${1}" >> $i
  echo "# $(date +%D)" >> $i
  echo "# Sprint ${2}" >> $i

  echo "" >> $i
  echo "# Comments" >> $i
  echo "# $(date +%D)" >> $i
  echo "# Group 3" >> $i
  echo "# Recoletas Chapel" >> $i
  echo "#" >> $i
  echo "-->" >> $i
done

# ./license.sh <name> <sprint created>
