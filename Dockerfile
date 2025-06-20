# ---------- Stage 1: Builder ----------
FROM alpine:latest AS builder

RUN apk add --no-cache build-base yasm git wget

WORKDIR /app

RUN git clone https://github.com/nemasu/asmttpd.git . && \
    make CC=musl-gcc CFLAGS="-Os -static" LDFLAGS="-Wl,--gc-sections -s" && \
    strip asmttpd && \
    mkdir -p /app/web

COPY index.html /app/web/index.html

# ---------- Stage 2: Final minimal image ----------
FROM scratch

COPY --from=builder /app/asmttpd /asmttpd
COPY --from=builder /app/web /web

EXPOSE 80

ENTRYPOINT ["/asmttpd"]
CMD ["/web", "80"]
