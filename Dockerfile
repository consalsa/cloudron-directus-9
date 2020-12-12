FROM cloudron/base:2.0.0

RUN mkdir -p /app/code
WORKDIR /app/code

# copy code
ADD package.json start.sh /app/code/
ADD extensions/ /app/data/extensions/
ADD example.env /app/code/.env

# install packages
RUN npm install

CMD [ "/app/code/start.sh" ]
