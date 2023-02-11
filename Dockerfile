# Use an official Golang runtime as a parent image
FROM golang:latest
RUN apt update && apt install -y wget 
# Set the working directory in the container
# WORKDIR /app
RUN wget https://github.com/althea-net/althea-chain/releases/download/v0.3.2/althea-v0.3.2-linux-amd64
RUN chmod +x althea-v0.3.2-linux-amd64
RUN mv althea-v0.3.2-linux-amd64 /usr/bin/althea
# Copy the local package files to the container's workspace
# COPY . .

# Build the Golang application inside the container
# RUN go build -o myapp .

# Expose the port that the application listens on
# EXPOSE 8080
WORKDIR /usr/bin/
VOLUME ~/.althea/
# Run the Golang application when the container starts
CMD [ "./althea","start" ]
