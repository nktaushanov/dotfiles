#!/bin/bash
find "$1" -not -path '*/\.*' -type f -exec md5sum {} \; | cut -d" " -f1 | sort  | md5sum
