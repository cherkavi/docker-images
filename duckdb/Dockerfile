FROM ubuntu:20.04

RUN apt-get update && apt-get install -y gettext-base unzip wget 

# installation 
RUN wget https://github.com/duckdb/duckdb/releases/download/v0.8.0/duckdb_cli-linux-amd64.zip \
    && unzip duckdb_cli-linux-amd64.zip -d /usr/local/bin \
    && rm duckdb_cli-linux-amd64.zip

# install extensions
# https://duckdb.org/docs/extensions/overview.html

RUN for e in "fts" "json" "sqlite_scanner"; do \
        echo "Installing $e ..."; \
        duckdb -c "INSTALL $e;"; \
        echo "LOAD $e;" >> $HOME/.duckdbrc; \
    done

# Install PRQL
# http://welsch.lu/duckdb/prql/v0.0.4/

RUN duckdb -unsigned -c "SET custom_extension_repository='welsch.lu/duckdb/prql/v0.0.4'; INSTALL prql;" \
    && echo "LOAD prql;" >> $HOME/.duckdbrc

ENTRYPOINT ["/usr/local/bin/duckdb", "-unsigned"]