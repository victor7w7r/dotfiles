#!/usr/bin/env bash
export LC_ALL=en_US.UTF-8

get_temp() {
  if grep -q "Raspberry" /proc/device-tree/model 2>/dev/null; then
    echo "$(vcgencmd measure_temp | sed 's/temp=//')"
  else
    echo "$(sensors | grep 'Tctl' | awk '{print substr($2, 2)}')"
  fi
}

echo "$(get_temp)" >/tmp/sys_temp.exectmux
sleep 5
