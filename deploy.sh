#!/bin/bash

logfile="/var/log/middleman.log"
middleman_dir=/home/punkisdead/punkisdead

cd $middleman_dir

echo "$(date) - Loading RVM env" >> $logfile
source $(~/.rvm/bin/rvm env --path -- middleman)

echo "$(date) - Refreshing" >> $logfile
git pull

echo "$(date) - Building" >> $logfile
middleman build --verbose --clean

if [[ ! $? -eq 0 ]]
then
  echo "$(date) - Could not build website, exiting." >> $logfile
  exit 1
else
  echo "$(date) - Deployed" >> $logfile
  exit 0
fi

cd -
