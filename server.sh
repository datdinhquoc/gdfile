#!/bin/bash
set +ex;

echo "================================================================================";
mongo <<<exit;
node -v;
node --experimental-modules server.mjs;
#EOF