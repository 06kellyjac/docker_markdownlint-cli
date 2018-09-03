FROM node:alpine
LABEL maintainer="06kellyjac@googlemail.com"
ENV MARKDOWNLINTCLI_VERSION latest
RUN npm install -g markdownlint-cli@${MARKDOWNLINTCLI_VERSION} &&\
	mkdir /markdown
WORKDIR /markdown
ENTRYPOINT [ "markdownlint" ]
CMD [ "--help" ]
