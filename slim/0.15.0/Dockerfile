FROM node:slim
LABEL maintainer="dev+markdownlint-cli@j-k.io"
ENV MARKDOWNLINTCLI_VERSION 0.15.0
RUN npm install -g markdownlint-cli@${MARKDOWNLINTCLI_VERSION} &&\
	mkdir /markdown
WORKDIR /markdown
ENTRYPOINT [ "markdownlint" ]
CMD [ "--help" ]
