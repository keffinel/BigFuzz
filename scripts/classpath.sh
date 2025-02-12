#!/bin/bash

# Figure out script absolute path
pushd `dirname $0` > /dev/null
SCRIPT_DIR=`pwd`
popd > /dev/null

# The root dir is one up
ROOT_DIR=`dirname $SCRIPT_DIR`

# Create classpath
cp="$ROOT_DIR/fuzz/target/classes:$ROOT_DIR/fuzz/target/test-classes:$ROOT_DIR/instrument/target/classes"

for jar in $ROOT_DIR/fuzz/target/dependency/*.jar; do
  cp="$cp:$jar"
done

for jar in $ROOT_DIR/../spark-2.4.3-bin-hadoop2.7/jars/*jar; do
  cp="$cp:$jar"
done

for jar in /usr/scala/scala-2.11.8/lib/*.jar; do
  cp="$cp:$jar"
done

for jar in /usr/openjfx/javafx-sdk-11.0.2/lib/*.jar; do
  cp="$cp:$jar"
done

for jar in /jar_files/*.jar; do
  cp="$cp:$jar"
done

echo $cp
