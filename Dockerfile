FROM alpine AS builder
RUN apk add --update-cache --no-cache \
        git \
        make \
        gcc \
        libc-dev \
 && git clone https://github.com/Tiiffi/mcrcon \
 && cd mcrcon \
 && make

FROM alpine
COPY --from=builder /mcrcon/mcrcon /
ENTRYPOINT [ "/mcrcon" ]
