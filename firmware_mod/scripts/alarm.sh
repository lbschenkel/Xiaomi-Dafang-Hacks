#!/bin/sh

FILE=/tmp/alarm_on

alarm() {
  while [ -f "$FILE" ]; do
    /system/sdcard/bin/audioplay /system/sdcard/media/police.wav 90
  done
}

case "$1" in
  ON|on)
    touch "$FILE"
    alarm >/dev/null 2>/dev/null &
    ;;
  OFF|off)
    rm -rf "$FILE"
    pkill -f audioplay
    ;;
  status)
    [ -f "$FILE" ] && echo ON || echo OFF
esac
