From ubuntu:22.04
RUN apt update;apt install -y nginx
RUN apt install -y git
RUN rm -rf /var/www/html
RUN git clone https://github.com/qkralsgml78/qkralsgml78.github.io.git /var/www/html/

RUN apt install cron

COPY pull.sh /var/www/html
COPY blog-pull-cronjob /etc/cron.d

RUN crontab /etc/cron.d/blog-pull-cronjob
RUN chmod +x /var/www/html/pull.sh

CMD service cron start && nginx -g "daemon off;"
