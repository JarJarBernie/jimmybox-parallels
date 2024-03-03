#!/bin/sh

# make jimmy commands available to all users
rm -rf /usr/local/bin/jimmy*
chmod +x jimmy*
cp jimmy* /usr/local/bin
