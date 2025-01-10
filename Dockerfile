# Step 1: Build the project
FROM alpine:3.21 AS builder

# Install necessary dependencies
RUN apk add --no-cache wget upx

# Set the working directory
WORKDIR /app

# Copy the current project into the container
COPY index.html .

# Download the asmttpd (a lightweight HTTP server written in assembly) binary from the specified GitHub release
RUN wget https://github.com/nemasu/asmttpd/releases/download/0.4.5/asmttpd && chmod +x asmttpd

# Use UPX (Ultimate Packer for eXecutables) to compress the asmttpd binary for minimal size
RUN upx --best --lzma asmttpd

# Step 2: Final minimal image with scratch
FROM scratch

# Copy the source code from the previous stage (Builder stage) into the backend build stage
COPY --from=builder /app /web

# Copy the built backend binary (asmttpd) from the build stage
COPY --from=builder /app/asmttpd /asmttpd

# Set the entrypoint to start the web server
ENTRYPOINT ["/asmttpd"]

# Default command to serve from /web_root on port 80
CMD ["/web", "80"]
