#!/bin/bash

if [ -z "$NUMBER" ]; then
  if [ -z "$1" ]; then
    echo "Không tìm thấy biến môi trường NUMBER hoặc tham số đầu vào."
    exit 1
  else
    INPUT_NUMBER=$1
  fi
else
  INPUT_NUMBER=$NUMBER
fi

OUTPUT=""
for ((i = 1; i <= INPUT_NUMBER; i++)); do
  HOSTNAME_INDEX=$((i - 1))
  ENTRY="${i}@hostname-${HOSTNAME_INDEX}"
  if [ -z "$OUTPUT" ]; then
    OUTPUT="$ENTRY"
  else
    OUTPUT+=" , $ENTRY"
  fi
done

echo "$OUTPUT"
