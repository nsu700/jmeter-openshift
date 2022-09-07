#!/usr/bin/env bash
testplan=$1

working_dir=`pwd`

#Get Master pod details

master_pod=`oc get pod  | grep -v -i completed | grep jmeter-master | awk '{print $1}'`

oc cp $testplan.jmx $master_pod:/jmeter/$testplan.jmx

## Echo Starting Jmeter load test

oc exec -ti $master_pod -- /bin/bash /jmeter/load_test /jmeter/$testplan.jmx
