#!/bin/bash
set +ex;

echo "================================================================================";
node -v;
node --experimental-modules server.mjs;
#EOF