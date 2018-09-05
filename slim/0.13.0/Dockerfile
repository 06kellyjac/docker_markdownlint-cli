FROM node:slim
LABEL maintainer="06kellyjac@googlemail.com"
ENV MARKDOWNLINTCLI_VERSION 0.13.0
RUN npm install -g markdownlint-cli@${MARKDOWNLINTCLI_VERSION} &&\
	mkdir /markdown
WORKDIR /markdown
ENTRYPOINT [ "markdownlint" ]
CMD [ "--help" ]
