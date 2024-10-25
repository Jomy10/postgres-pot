# Usage
#   sh pot_build.sh <postgres password>

if [ "$1" = "" ]
then
    echo "Usage: sh pot_build.sh <postgres-password>"
    return 1
fi

set -e
set -x

POT_NAME=postgres
FREEBSD_VERSION=14.0

pot create \
    -p $POT_NAME \
    -b $FREEBSD_VERSION \
    -t single

pot copy-in \
    -p $POT_NAME \
    -s pot_init.sh \
    -d /pot_init.sh

pot start $POT_NAME
pot exec -p $POT_NAME sh /pot_init.sh $1
pot stop $POT_NAME

pot set-cmd -p $POT_NAME -c "service postgresql start"

