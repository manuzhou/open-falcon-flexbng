# Compilation
./build.sh

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

# Start Server
cd $WORKSPACE
./open-falcon start
./open-falcon check

# Dashboard
export HOME=/home/work
export WORKSPACE=$HOME/open-falcon
mkdir -p $WORKSPACE
cd $WORKSPACE
git clone https://github.com/open-falcon/dashboard.git
yum install -y python-virtualenv
yum install -y python-devel
yum install -y openldap-devel
yum install -y mysql-devel
yum groupinstall "Development tools"

cd $WORKSPACE/dashboard/
virtualenv ./env

./env/bin/pip install -r pip_requirements.txt -i https://pypi.douban.com/simple

dashboard的配置文件为： 'rrd/config.py'，请根据实际情况修改

## API_ADDR 表示后端api组件的地址
API_ADDR = "http://127.0.0.1:8080/api/v1" 

## 根据实际情况，修改PORTAL_DB_*, 默认用户名为root，默认密码为""
## 根据实际情况，修改ALARM_DB_*, 默认用户名为root，默认密码为""

# start dashboard
bash control start
open http://127.0.0.1:8081 in your browser.
