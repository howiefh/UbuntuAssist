#!/usr/bin/python
import base64
import sys
if len(sys.argv) != 3:
    sys.exit()
dore = sys.argv[1]
source = sys.argv[2]

if dore == 'e':
    print base64.encodestring(source),
elif dore == 'd':
    print base64.decodestring(source),
else:
    sys.exit()

