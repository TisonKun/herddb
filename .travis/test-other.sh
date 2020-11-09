#bin/bash
set -x -e
mvn -v
# run tests up to herddb-net
mvn verify -Pjenkins -Dmaven.test.redirectTestOutputToFile=true -DforkCount=1 -Dherddb.file.requirefsync=false -am -pl herddb-net
# skip herddb-core
# resume from herddb-jdbc
mvn verify -Pjenkins -Dmaven.test.redirectTestOutputToFile=true -DforkCount=1 -Dherddb.file.requirefsync=false -rf herddb-jdbc
