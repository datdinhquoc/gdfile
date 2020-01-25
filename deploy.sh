#!/bin/bash
set +ex;

#Check MongoDB installation
Count=$(mongo <<<exit | grep "command not found" | wc -l);
echo "MongoDB installed: $Count";

if [[ $Count == 0 ]]; then
  sudo yum install mongodb-org;
fi

#Restart app
git pull && git add -A && git commit -a -m Msg && git push;
heroku logs -ta gdfile;
#EOF