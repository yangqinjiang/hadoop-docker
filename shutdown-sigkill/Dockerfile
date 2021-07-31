
#应用程序作为容器中的 1 号进程

FROM iojs:onbuild
COPY ./app.js ./app.js
COPY ./package.json ./package.json
EXPOSE 3000
ENTRYPOINT ["node", "app"]