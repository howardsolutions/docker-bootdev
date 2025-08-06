FROM debian:stable-slim

# COPY source destination
COPY docker-bootdev /bin/docker-bootdev

CMD ["/bin/docker-bootdev"]