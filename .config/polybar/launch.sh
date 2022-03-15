#!/bin/bash
killall -q polybar &&
echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log /tmp/polybar3.log
polybar left 2>&1 | tee -a /tmp/polybar1.log & disown
polybar right 2>&1 | tee -a /tmp/polybar2.log & disown
polybar center 2>&1 | tee -a /tmp/polybar3.log & disown