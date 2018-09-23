# http://archive.apache.org/dist/lucene/solr/4.10.3/solr-4.10.3.tgz 
# docker run -d --name=solr -p 8983:8983 -v /home/technik/temp/solr/example:/opt/solr/example solr:4.10.3

docker run -d --name=solr -p 8983:8983 solr:4.10.3
