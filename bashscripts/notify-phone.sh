#!/bin/bash

curl -s -X POST https://api.telegram.org/bot7593705436:AAFoOb0rtnBlbbgBsgx5zLBexGCbdVcx57o/sendMessage \
  -d chat_id="5964916686" \
  -d text="$1"
  

