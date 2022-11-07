#!/bin/bash
#定义函数的格式1
test (){
	read -p "pls input:" value
	return $[$value * 2]
}
test 
echo $?
#定义函数的格式2
function example {
echo "Hello world!"
}
example
