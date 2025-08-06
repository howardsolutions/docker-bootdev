FROM debian:stable-slim

# COPY source destination
COPY docker-bootdev /bin/docker-bootdev

ENV PORT=8991

# The Server Start
CMD ["/bin/docker-bootdev"]