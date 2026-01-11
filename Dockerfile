FROM ubuntu
RUN apt-get update -y && apt install nginx -y
WORKDIR /var/www/html
COPY index.html /var/www/html
CMD ["nginx", "-g", "daemon off;"]
