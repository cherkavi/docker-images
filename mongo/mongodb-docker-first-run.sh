# don't do that:  -e MONGO_INITDB_ROOT_USERNAME=vitalii -e MONGO_INITDB_ROOT_PASSWORD=vitalii
docker run -d --name mongo -p 27017:27017 -p 28017:28017 -v /tmp/mongo/db:/data/db mongo