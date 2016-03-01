#alfresco-monitoring


What is it?
-----------

This project is a solution to monitor Alfresco software (http://www.alfresco.com/) with OpenSource tools. 
Note that these tools can be used to monitor most software i.e. a database server, so we can use them to monitor the solution not just one application.

These tools have been configured to run on Linux servers only so if you are going to run the on a different Operating System you may have to make some changes.

The OpenSource tools used are:

- Logstash - for collecting/tailing log files and output from custom commands and pushing data to ElasticSearch.
- ElasticSearch - Lucene engine to index content.
- Kibana -  browser based analytics and search dashboard for ElasticSearch.

Installation
------------

Please refer to document Monitoring ```Alfresco and Tomcat Logs.docx```