#!/bin/bash
set +ex;

#Restart app
git pull && git add -A && git commit -a -m Msg && git push;
heroku logs -ta gdfile;
#EOF