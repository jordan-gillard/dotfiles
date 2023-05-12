# Use the CentOS 9-stream base image
FROM centos-stream-9

# Copy all installation files
COPY . .

# Run the install script
RUN ./install.sh

# Set the entrypoint to Zsh
ENTRYPOINT ["/usr/bin/env zsh"]
