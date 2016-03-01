if [ -z "$RUN_ELASTICSEARCH" ]; then
  echo "Please set RUN_ELASTICSEARCH variable to the path of your logstash-elasticsearch folder"
  echo "i.e. export RUN_ELASTICSEARCH=<path>/logstash-ealsticsearch"
  exit
fi

dir=$RUN_ELASTICSEARCH

if [ "$1" = "start" ] ; then
  echo "Starting logstash script"
  #Start processes in the background
  nohup $dir/bin/logstash agent -f $RUN_ELASTICSEARCH/logstash.conf > /dev/null 2>&1 &
elif [ "$1" = "stop" ] ; then
  echo "Stopping logstash"
  #Terminate previous processes
  ps -ef | grep "$RUN_ELASTICSEARCH/lib/bootstrap/environment.rb" | grep -v grep | awk '{print $2}' | xargs -I {} kill -9 {}
else
  echo "Use run_logstash.sh <start|stop>"
fi
