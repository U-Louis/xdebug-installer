#!/bin/bash

# Define the name of the Docker container
container_name="php"

# Step 1: Update package manager inside the Docker container
echo "Step 1: Updating package manager inside the Docker container..."
docker exec -it $container_name apk update && \
echo "Package manager updated successfully." && \

# Step 2: Install necessary dependencies inside the Docker container
echo "Step 2: Installing necessary dependencies inside the Docker container..."
docker exec -it $container_name apk add autoconf automake build-base && \
docker exec -it $container_name apk add --update linux-headers && \
echo "Dependencies installed successfully." && \

# Step 3: Install Xdebug version 3.2.2 inside the Docker container
echo "Step 3: Installing Xdebug version 3.2.2 inside the Docker container..."
docker exec -it $container_name pecl install xdebug-3.2.2 && \
echo "Xdebug 3.2.2 installed successfully." && \

# Step 4: Create or edit the 99-xdebug.ini file inside the Docker container
echo "Step 4: Creating or editing the 99-xdebug.ini file inside the Docker container..."
docker exec -it $container_name sh -c 'echo "zend_extension=xdebug" > /usr/local/etc/php/conf.d/99-xdebug.ini' && \
docker exec -it $container_name sh -c 'echo "xdebug.mode=debug" >> /usr/local/etc/php/conf.d/99-xdebug.ini' && \
docker exec -it $container_name sh -c 'echo "xdebug.start_with_request=yes" >> /usr/local/etc/php/conf.d/99-xdebug.ini' && \
docker exec -it $container_name sh -c 'echo "xdebug.discover_client_host=true" >> /usr/local/etc/php/conf.d/99-xdebug.ini' && \
docker exec -it $container_name sh -c 'echo "xdebug.client_host=host.docker.internal" >> /usr/local/etc/php/conf.d/99-xdebug.ini' && \
docker exec -it $container_name sh -c 'echo "xdebug.client_port=9003" >> /usr/local/etc/php/conf.d/99-xdebug.ini' && \
docker exec -it $container_name sh -c 'echo "xdebug.log_level = 0" >> /usr/local/etc/php/conf.d/99-xdebug.ini' && \

echo "Xdebug configuration updated successfully." && \

# Step 5: Restart PHP service inside the Docker container to apply changes
echo "Step 5: Restarting PHP service inside the Docker container to apply changes..."
docker exec -it $container_name kill -USR2 1 && \
echo "PHP service restarted successfully." && \

echo "Xdebug configuration has been updated and PHP service has been restarted."
