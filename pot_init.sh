if [ "$1" = "" ]
then
    echo "Usage: sh pot_init.sh <postgres-password"
    return 1
fi

set -x

cat << EOF > /etc/rc.conf
postgresql_enable="YES"
EOF

pkg install -y \
    postgresql16-server \
    postgresql16-client

service postgresql enable
service postgresql initdb
service postgresql start

sockstat -l4

su - postgres -c "psql -c \"ALTER USER postgres WITH PASSWORD '$1'\";"

