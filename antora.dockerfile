# antora.dockerfile
FROM antora/antora:3.1.7
RUN yarn global add http-server onchange
WORKDIR /srv/docs
