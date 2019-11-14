FROM python:3.7.4-alpine3.10

RUN apk --no-cache --update add bash jq make git openssh-client ca-certificates curl openssl

ARG KUBECTL=1.16.3
RUN curl -sL https://storage.googleapis.com/kubernetes-release/release/v${KUBECTL}/bin/linux/amd64/kubectl \
    -o /usr/local/bin/kubectl && chmod +x /usr/local/bin/kubectl

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
