FROM cloudron/base:2.0.0@sha256:f9fea80513aa7c92fe2e7bf3978b54c8ac5222f47a9a32a7f8833edf0eb5a4f4

RUN mkdir -p /app/code
WORKDIR /app/code

# copy code
ADD package.json start.sh /app/code/
ADD extensions/ /app/data/extensions/
ADD setenv.sh /app/data/

RUN chmod +x /app/data/setenv.sh

# install packages
RUN npm install

# add supervisor configs
ADD supervisor/* /etc/supervisor/conf.d/
RUN ln -sf /run/supervisord.log /var/log/supervisor/supervisord.log

CMD [ "/app/code/start.sh" ]
