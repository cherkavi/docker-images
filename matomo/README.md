Download docker-compose files 
```sh
wget https://raw.githubusercontent.com/matomo-org/docker/master/.examples/apache/db.env
wget https://raw.githubusercontent.com/matomo-org/docker/master/.examples/apache/docker-compose.yml
```

start containers
```bash
docker-compose up
```
* [video tutorial](https://matomo.org/docs/videos/)
* [track training](https://matomo.org/tag-manager-training/)
* [data layer, custom triggers](https://developer.matomo.org/guides/tagmanager/datalayer)
* [privacy](https://matomo.org/docs/privacy)
* [DNT removing](https://forum.matomo.org/t/browser-do-not-track-kills-active-opt-out-ability/36116)
* [privacy cookie](https://matomo.org/faq/new-to-piwik/how-can-i-still-track-a-visitor-without-cookies-even-if-they-decline-the-cookie-consent/)
* [tracking API](https://developer.matomo.org/api-reference/tracking-api)
* [customize Matomo Tag](http://127.0.0.1:8080/index.php?module=CoreAdminHome&action=trackingCodeGenerator&idSite=1&period=day&date=yesterday)

* [matomo DB schema](https://developer.matomo.org/guides/database-schema)
* [matomo DB schema trace](https://developer.matomo.org/guides/log-data)
* [matomo customization](https://matomo.org/docs/include-piwik-in-your-project/)
* [matomo debug container](https://developer.matomo.org/guides/tagmanager/debugging#:~:text=layer%2C%20and%20more.-,Activating%20the%20debug%20mode,the%20bottom%20of%20the%20website)



## Containers start/stop 
### start containers
```bash
docker-compose up
```

### stop containers
```bash
docker-compose down
```

### remove volumes
```
docker volume ls
docker volume rm apache_matomo
docker volume rm apache_db
```

## Matomo installation 
* go to installation page http://127.0.0.1:8080/
* Database Setup: 
    > Password: matomo
* Super User
    > Super user login: admin
    > Password: adminadmin
    > Password (repeat): adminadmin
    > Email: one@mail.ru
* website
    > Website name: localhost-matomo
    > Website url: http://127.0.0.1:8080

* for removing Warning about differences in configuration and real host running:
```bash
docker exec -it apache_app_1 /bin/bash
sed --in-place 's/\[General\]/\[General\]\nenable_trusted_host_check=0/g' /var/www/html/config/config.ini.php
```

* debug messages during request:
```bash
# request to remote resource
x-www-browser http://127.0.0.1:8080/matomo.php?idsite=3&rec=1

# create property block 
sed --in-place 's/\[TagManager\]/\[TagManager\]\n\n\[Tracker\]\ndebug=1/g' /var/www/html/config/config.ini.php

# deactivate element in the block
sed --in-place 's/debug = 1/debug = 0/g' /var/www/html/config/config.ini.php
# activate element in the block
sed --in-place 's/debug = 0/debug = 1/g' /var/www/html/config/config.ini.php
```    

In Chrome will not work due default DNT 
```bash
http://127.0.0.1:8080/matomo.php?idsite=4&rec=1
```


* additional parameters - show full stack trace 
```bash
docker exec -it apache_app_1 /bin/bash
# activate
sed --in-place  "s/define('PIWIK_PRINT_ERROR_BACKTRACE', false);/define('PIWIK_PRINT_ERROR_BACKTRACE', true);/g" /var/www/html/index.php

# deactivate
sed --in-place  "s/define('PIWIK_PRINT_ERROR_BACKTRACE', true);/define('PIWIK_PRINT_ERROR_BACKTRACE', false);/g" /var/www/html/index.php
```

* simple visit trace:
```
http://127.0.0.1:8080/matomo.php?idsite=3&rec=1
```

## [Connect to Database](http://127.0.0.1:9090/)
> server: db
> username: matomo
> password: matomo
> database: matomo


* custom variables for each visit/page to save in database 
https://matomo.org/docs/custom-variables/
https://developer.matomo.org/guides/tracking-javascript-guide
```javascript
// scope: page: matomo_log_link_visit_action
// scope: visit: matomo_log_visit
var _paq = window._paq = window._paq || [];
// setCustomVariable( 1, "list_of_items", "24,25,23,42", "visit" ) 
_paq.push(['setCustomVariable',1,"listing-id","13,14,15,16","page"]);
```

* custom event pushing
https://github.com/matomo-org/tag-manager/tree/master/Template/Trigger
https://developer.matomo.org/guides/tagmanager/custom-trigger
```js
window._mtm = window._mtm || [];

window._mtm.push({'event': 'fire-showing-listing-id'});

window.push(['trackEvent', 'category', 'name', 'action']);

var _paq = window._paq = window._paq || [];
_paq.push(['trackPageView']);
_paq.push(['trackEvent', 'category', 'name', 'action']);
```

https://developer.matomo.org/api-reference/tracking-api


# start apache for writing first html page with code
```bash
docker rm apache
docker run --name apache -v $(pwd):/app -p 7070:8080 bitnami/apache:latest
```


```sql
select * from matomo_log_visit --  contains one entry per visit (returning visitor)
select * from matomo_log_action --  contains all the type of actions possible on the website (e.g. unique URLs, page titles, download URLs…)
select * from matomo_log_link_visit_action --  contains one entry per action of a visitor (page view, …)
select * from matomo_log_conversion --  contains conversions (actions that match goals) that happen during a visit
select * from matomo_log_conversion_item --  contains e-commerce conversion items
```
