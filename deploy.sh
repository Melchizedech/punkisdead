#!/bin/bash

echo "Building"
middleman build --clean --verbose
if [[ ! $? -eq 0 ]]
then
  echo "Could not build website, exiting."
  exit 1
fi
echo "Tarzipping website"
tar zcf punkisdead.tar.gz build
echo "Transmitting tarzip"
scp -P 2206 punkisdead.tar.gz root@punkisdead.fr:/root/
echo "Deploying website"
ssh -p 2206 root@punkisdead.fr 'tar xzf punkisdead.tar.gz && rm -rf /var/www/punkisdead && mv build /var/www/punkisdead && chown -R www-data:www-data /var/www/punkisdead && rm punkisdead.tar.gz'
echo "Cleaning local"
rm punkisdead.tar.gz
echo "Deployed"
