#!/bin/bash

# New username and password
NEW_USER="client"
NEW_PASSWORD="client"

# Current username (the user that is being renamed)
CURRENT_USER=$(whoami)

# Change username
if [ "$CURRENT_USER" != "$NEW_USER" ]; then
    sudo usermod -l $NEW_USER $CURRENT_USER
    sudo usermod -d /home/$NEW_USER -m $NEW_USER
    echo "Username changed from $CURRENT_USER to $NEW_USER"
else
    echo "Username is already $NEW_USER"
fi

# Change password
echo -e "$NEW_PASSWORD\n$NEW_PASSWORD" | sudo passwd $NEW_USER

# Verify changes
echo "New username: $NEW_USER"
echo "Password changed for $NEW_USER"
