FROM python:3

RUN pip install sqlite-web

WORKDIR /db
ENTRYPOINT ["sqlite_web", "--host=0.0.0.0", "--port=8080", "--no-browser", "/db/database.db"]
