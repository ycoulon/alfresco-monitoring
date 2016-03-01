# This script does a very simple test for high CPU usage.
# Gets 5 jstacks if percentage of CPU available is less than alertValue"
alertValue="105"

# Calculate percentage of CPU usage based on top id value
idleCPU=`top -n 1 | grep us | grep sy | grep id | awk '{print $5}' | awk -F '%' '{print $1}'`
total=100
freeCPU=`bc <<< "$total-(100-$idleCPU)"`

if [ `echo $idleCPU'<'$alertValue | bc -l` -gt "0" ]
then
  percentage=$(expr $total - $alertValue)
  echo "Free CPU is under threshold of ${alertValue}%" > output
  # Run jstack
  for i in `seq 1 1`;
  do
    ps -ef | grep java | grep Bootstrap | grep -v grep | awk '{print $2}' | xargs -I {} jstack {}
    echo "asdfasdfadsfkajdsfkjadsflkjds;"
    #sleep 10
  done
fi
