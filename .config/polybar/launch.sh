#!/bin/bash
killall -q polybar &&
echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log
polybar barra1 2>&1 | tee -a /tmp/polybar1.log & disown
polybar barra2 2>&1 | tee -a /tmp/polybar2.log & disown