FROM node:10.16.0
RUN apt-get update    && apt-get install -y nginx
WORKDIR /app
COPY . /app/
EXPOSE 80
RUN  npm config set registry https://registry.npm.taobao.org && npm install      && npm run build      && cp -r dist/* /var/www/html      && rm -rf /app
CMD ["nginx","-g","daemon off;"]
