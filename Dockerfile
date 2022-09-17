FROM php:7.4-cli
RUN mkdir myapp
COPY . /myapp
WORKDIR /myapp
EXPOSE 8001
CMD ["php", "-S" ,"0.0.0.0:8001"]