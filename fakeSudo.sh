#! /usr/bin/env bash
# sudo which will always result in wrong password

read -s -p "[sudo] password for ${USER}: " throwaway
echo
sleep 1
echo "Sorry, try again"
read -s -p "[sudo] password for ${USER}: " throwaway
echo
sleep 1
echo "Sorry, try again"
read -s -p "[sudo] password for ${USER}: " throwaway
echo
echo "sudo: 3 incorrect password attempts"
