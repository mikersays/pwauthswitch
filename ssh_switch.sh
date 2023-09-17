#!/bin/bash

SSHD_CONFIG="/etc/ssh/sshd_config"

if [[ $EUID -ne 0 ]]; then
    echo "You must run this script as root."
    exit 1
fi

# Check if the line is commented
if grep -qE "^[[:space:]]*#[[:space:]]*PasswordAuthentication[[:space:]]+no" $SSHD_CONFIG; then
    echo "Deactivating password authentication..."
    # Uncomment the line
    sed -i 's/^[[:space:]]*#\([[:space:]]*PasswordAuthentication[[:space:]]no\)/\1/' $SSHD_CONFIG
elif grep -qE "^[[:space:]]*PasswordAuthentication[[:space:]]+no" $SSHD_CONFIG; then
    echo "Activating password authentication..."
    # Comment the line
    sed -i 's/^\([[:space:]]*PasswordAuthentication[[:space:]]no\)/#\1/' $SSHD_CONFIG
else
    echo "No specific PasswordAuthentication setting found. Please check the configuration manually."
    exit 1
fi

systemctl reload sshd

echo "Done."
