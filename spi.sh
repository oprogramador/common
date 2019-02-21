#!/bin/bash

dir="/home/pierre/pierre_copy/undo"
touch $1 &&
cp $1 $dir/$(date +'%Y-%m-%d_%H-%M-%S')_@$(cut256 $(realpath $1 | sed 's/\//___/g'))
