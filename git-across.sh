#!/bin/sh

if [ "run" != "$1" ]; then
  exec ssh -i "$IDENTITY_FILE" -o "StrictHostKeyChecking no" "$@"
fi

echo "Deploying from $GITHUB_URL to $HEROKU_GIT_URL"

self="$( cd "$( dirname "$0" )" && pwd )"/$0

export IDENTITY_FILE="`mktemp /tmp/tmp.XXXXXXXXXX`"
export GIT_SSH="$self"

repo=`mktemp -d /tmp/tmp.XXXXXXXXXX`

echo "$GITHUB_KEY" >"$IDENTITY_FILE"
echo "$GITHUB_PUBLIC_KEY" >"$IDENTITY_FILE.pub"


git clone $GITHUB_URL $repo
cd $repo
git remote add heroku $HEROKU_GIT_URL
git push heroku

rm -f "$IDENTITY_FILE"
rm -f "$IDENTITY_FILE.pub"
rm -rf $repo

exit 0

