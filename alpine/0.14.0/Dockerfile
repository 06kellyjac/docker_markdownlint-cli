FROM node:alpine
LABEL maintainer="dev+markdownlint-cli@j-k.io"
ENV MARKDOWNLINTCLI_VERSION 0.14.0
RUN npm install -g markdownlint-cli@${MARKDOWNLINTCLI_VERSION}
WORKDIR /markdown
ENTRYPOINT [ "markdownlint" ]
CMD [ "--help" ]
