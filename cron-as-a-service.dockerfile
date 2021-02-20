FROM python:3.8.3-buster

# install necessary additional applications
RUN apt-get update && apt-get install -y zip unzip imagemagick cron

# prepare application source code 
RUN mkdir /application
COPY ./src /application
COPY ./requirements.txt /application

WORKDIR /application

# install python requirements 
RUN pip3 install -r requirements.txt

EXPOSE 5000

# start cron job 
COPY ./cleanup-image-folder.cron /cleanup-image-folder.cron
RUN chmod +x /cleanup-image-folder.cron && crontab /cleanup-image-folder.cron


# service should be started as a separate process
ENTRYPOINT service cron start && gunicorn --config gunicorn.conf.py app:flask_app

# service not workinbg with:
# service not starting: RUN /etc/init.d/cron start
# service not starting: RUN cron
# service not starting: RUN /usr/sbin/cron
# not working && service cron start

# CMD ["python3", "app.py"]
# CMD ["gunicorn", "--config", "gunicorn.conf.py", "app:flask_app"]
