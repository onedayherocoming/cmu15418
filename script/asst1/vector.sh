#!/bin/bash

build_path=/home/max.qin/time_wheel_24/cmu15418/asst1/prog2_vecintrin
log_path=/home/max.qin/time_wheel_24/cmu15418/log/asst1/vector.log
cd $build_path

make

./vrun -s 14  &> $log_path