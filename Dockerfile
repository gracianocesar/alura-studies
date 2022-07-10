FROM nginx:latest

WORKDIR /app

COPY package*.json /app/

RUN apt-get update && apt-get install -y nodejs npm

RUN npm install

COPY ./ /app

RUN  npm run build

COPY build /usr/share/nginx/html

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["nginx", "-g", "daemon off;"]