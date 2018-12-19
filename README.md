# Compilation
./start.sh

# Install
export FALCON_HOME=/home/work
export WORKSPACE=$FALCON_HOME/open-falcon
mkdir -p $WORKSPACE
tar -xzvf open-falcon-v0.2.1.tar.gz -C $WORKSPACE

# Arrange
cd $WORKSPACE
grep -Ilr 3306  ./ | xargs -n1 -- sed -i 's/root:/root:Bras123456!/g'

# Create mysql table
mysql -h 127.0.0.1 -u root -p < 1_uic-db-schema.sql
mysql -h 127.0.0.1 -u root -p < 2_portal-db-schema.sql
mysql -h 127.0.0.1 -u root -p < 3_dashboard-db-schema.sql
mysql -h 127.0.0.1 -u root -p < 4_graph-db-schema.sql
mysql -h 127.0.0.1 -u root -p < 5_alarms-db-schema.sql

# Start
cd $WORKSPACE
./open-falcon start
./open-falcon check
