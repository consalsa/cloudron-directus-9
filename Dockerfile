FROM cloudron/base:2.0.0@sha256:f9fea80513aa7c92fe2e7bf3978b54c8ac5222f47a9a32a7f8833edf0eb5a4f4

RUN mkdir -p /app/code
WORKDIR /app/code

# copy code
ADD package.json start.sh /app/code/
ADD extensions/ /app/data/extensions/
ADD pm2.process.js /app/data/

RUN mkdir -p '/app/data/.pm2'
RUN ln -s '/home/cloudron/.pm2/' '/app/data/.pm2/'

# PM2
RUN npm install pm2 -g

# install packages
RUN npm install

CMD [ "/app/code/start.sh" ]
