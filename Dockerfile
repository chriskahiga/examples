#
FROM tiangolo/uwsgi-nginx-flask:python3.6
ENV LISTEN_PORT 8080
EXPOSE 8080
ADD /azure-vote /app
RUN pip install redis && cp -f /app/conf/uwsgi.ini /etc/uwsgi/uwsgi.ini && chmod -R g+rwx /var/log/supervisor && chmod -R g+rwx /var/cache/nginx /var/log/nginx /etc/nginx/ && find /var/run | egrep -v "secrets" | xargs -i /bin/chmod -R g+rwx {} 2>/dev/null

