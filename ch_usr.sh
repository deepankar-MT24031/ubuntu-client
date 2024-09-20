#!/bin/bash

# Define the new user and password
NEW_USER="client"
NEW_PASSWORD="client"

# Check if the user already exists
if id "$NEW_USER" &>/dev/null; then
    echo "User $NEW_USER already exists!"
else
    # Create the new user with a home directory and set the password
    sudo useradd -m -s /bin/bash $NEW_USER
    echo -e "$NEW_PASSWORD\n$NEW_PASSWORD" | sudo passwd $NEW_USER
    echo "User $NEW_USER created with password $NEW_PASSWORD"
fi

# Add the user to the sudo group (optional)
sudo usermod -aG sudo $NEW_USER

# Switch to the new user
echo "You can now log in to user $NEW_USER using: su - $NEW_USER"
