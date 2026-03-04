#!/usr/bin/env bash
set -e

#WARNING: AI vibe coded script which uses sudo, use with caution

# --- CONFIG ---
BRIDGE_IF="br0"
BRIDGE_IP="192.168.50.1/24"
VM_NET="192.168.50.0/24"
WAN_IF="wlp3s0"   # your Wi-Fi interface
# ---------------

echo "[*] Creating/setting up bridge ${BRIDGE_IF} with IP ${BRIDGE_IP} ..."

# Create bridge if it doesn't exist
if ! ip link show "${BRIDGE_IF}" >/dev/null 2>&1; then
    sudo ip link add name "${BRIDGE_IF}" type bridge
fi

# Assign IP and bring it up
sudo ip addr flush dev "${BRIDGE_IF}"
sudo ip addr add "${BRIDGE_IP}" dev "${BRIDGE_IF}"
sudo ip link set "${BRIDGE_IF}" up

echo "[*] Enabling IPv4 forwarding ..."
sudo sysctl -w net.ipv4.ip_forward=1 >/dev/null

echo "[*] Setting up iptables NAT and forwarding rules ..."

# Avoid duplicating rules: check before adding
# NAT (MASQUERADE) for VM network
if ! sudo iptables -t nat -C POSTROUTING -s "${VM_NET}" -o "${WAN_IF}" -j MASQUERADE 2>/dev/null; then
    sudo iptables -t nat -A POSTROUTING -s "${VM_NET}" -o "${WAN_IF}" -j MASQUERADE
fi

# Forward VMs -> WAN
if ! sudo iptables -C FORWARD -i "${BRIDGE_IF}" -o "${WAN_IF}" -j ACCEPT 2>/dev/null; then
    sudo iptables -A FORWARD -i "${BRIDGE_IF}" -o "${WAN_IF}" -j ACCEPT
fi

# Forward WAN -> VMs (established/related only)
if ! sudo iptables -C FORWARD -i "${WAN_IF}" -o "${BRIDGE_IF}" -m state --state ESTABLISHED,RELATED -j ACCEPT 2>/dev/null; then
    sudo iptables -A FORWARD -i "${WAN_IF}" -o "${BRIDGE_IF}" -m state --state ESTABLISHED,RELATED -j ACCEPT
fi

echo "[*] Bridge ${BRIDGE_IF} is up with ${BRIDGE_IP}"
echo "[*] You can now start your VM bridged to ${BRIDGE_IF}."
echo "    Inside the Windows VM, use e.g.: IP 192.168.50.10, mask 255.255.255.0, gateway 192.168.50.1"

