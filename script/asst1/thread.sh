#!/bin/bash
exe_path=/home/max.qin/time_wheel_24/cmu15418/asst1/prog1_mandelbrot_threads/mandelbrot
log_path=/home/max.qin/time_wheel_24/cmu15418/log/asst1/thread.log

echo "threat test" > $log_path

arr=(2 4 8 16 32)
for num in "${arr[@]}"
do
    echo "thread: $num"
    echo "thread: $num" >> $log_path
    $exe_path -t $num &>> $log_path
done
