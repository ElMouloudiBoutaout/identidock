FROM python:3.4
RUN groupadd -r uwsgi && useradd -r -g uwsgi uwsgi
RUN pip install Flask==0.10.1 uWSGI==2.0.8 requests==2.5.1 redis==2.10.3
RUN apt-get update && apt-get install -y dos2unix
WORKDIR /app
COPY app /app
COPY cmd.sh /
EXPOSE 9090 9191
RUN dos2unix /cmd.sh
RUN chmod +x /cmd.sh
USER uwsgi
CMD ["/cmd.sh"]
