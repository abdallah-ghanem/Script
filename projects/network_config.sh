#!/bin/bash

# Variables
INTERFACE="eth0"  # Replace with the network interface name
STATIC_IP="172.21.90.191"
CIDR="24"
GATEWAY="172.21.90.1"  # Adjust based on your network setup
DNS1="8.8.8.8"

# Function to set a static IP
configure_static_ip() {
    echo "Configuring static IP..."
    sudo nmcli con add type ethernet autoconnect yes con-name "$INTERFACE" ifname "$INTERFACE"
    sudo nmcli con mod "$INTERFACE" ipv4.addresses "$STATIC_IP/$CIDR"
    sudo nmcli con mod "$INTERFACE" ipv4.gateway "$GATEWAY"
    sudo nmcli con mod "$INTERFACE" ipv4.dns "$DNS1"
    sudo nmcli con mod "$INTERFACE" ipv4.method manual
    echo "Static IP configuration done."
}

# Function to restart the network service
restart_network() {
    echo "Restarting network service..."
    sudo nmcli con up "$INTERFACE"
    echo "Network service restarted."
}

# Function to display current network configuration
show_network_config() {
    echo "Current network configuration:"
    ip addr show "$INTERFACE"
}

# Automate configuration
configure_static_ip
restart_network
show_network_config

