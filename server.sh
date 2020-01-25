#!/bin/bash
set +ex;

echo "================================================================================";
#Check MongoDB installation
Count=$(mongo <<<exit | grep "command not found" | wc -l);
echo "MongoDB installed: $Count";

if [[ $Count == 0 ]]; then
  sudo yum install mongodb-org;
fi

#Start app
node -v;
node --experimental-modules server.mjs;
#EOF