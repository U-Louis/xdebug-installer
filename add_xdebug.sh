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

# Step 3: Install Xdebug (Version 3.4 or higher for PHP 8.4 support)
echo "Step 3: Installing Xdebug for PHP 8.4..."
docker exec -it $container_name pecl install xdebug && \
echo "Xdebug installed successfully." && \

# Step 4: Enable and Configure Xdebug
echo "Step 4: Configuring Xdebug..."
# Use docker-php-ext-enable to handle the pathing automatically
docker exec -it $container_name docker-php-ext-enable xdebug && \

# Append custom settings to the generated ini
docker exec -it $container_name sh -c 'cat <<EOF >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
xdebug.mode=debug
xdebug.start_with_request=yes
xdebug.discover_client_host=true
xdebug.client_host=host.docker.internal
xdebug.client_port=9003
xdebug.log_level=0
EOF' && \
echo "Xdebug configuration updated successfully."

# Step 5: Restart PHP service inside the Docker container to apply changes
echo "Step 5: Restarting PHP service inside the Docker container to apply changes..."
docker exec -it $container_name kill -USR2 1 && \
echo "PHP service restarted successfully." && \

echo "Xdebug configuration has been updated and PHP service has been restarted."
