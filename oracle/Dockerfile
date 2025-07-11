# TODO: need to check it
FROM oracle/database:19.3.0-se2

ENV ORACLE_PWD=YourPassword
ENV ORACLE_SID=ORCL
ENV ORACLE_CHARACTERSET=AL32UTF8

COPY ./scripts/init-db.sql /docker-entrypoint-initdb.d/

EXPOSE 1521 5500

CMD ["sqlplus", "sys/YourPassword@ORCL as sysdba"]
