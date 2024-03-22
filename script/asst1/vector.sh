#!/bin/bash

build_path=/home/max.qin/time_wheel_24/cmu15418/asst1/prog2_vecintrin
log_path=/home/max.qin/time_wheel_24/cmu15418/log/asst1/vector.log
cd $build_path

make

echo "vector test" > $log_path
./vrun -s 1024  &>> $log_path