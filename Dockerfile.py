FROM debian:stable-slim

# Install Python and pip
RUN apt-get update && \
    apt-get install -y python3 python3-pip && \
    apt-get clean && \
    ln -s /usr/bin/python3 /usr/bin/python

# Copy files into the container
COPY main.py main.py
COPY books/ books/

# Run the script
CMD ["python", "main.py"]
