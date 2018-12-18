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

# Start
cd $WORKSPACE
./open-falcon start
./open-falcon check
