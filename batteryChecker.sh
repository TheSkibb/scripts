#!/bin/bash

power=$(upower -i `upower -e | grep 'BAT'` | grep percentage | grep -Eo '[0-9]{1,4}')

echo $power
