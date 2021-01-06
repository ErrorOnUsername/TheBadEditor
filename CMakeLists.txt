cmake_minimum_required(VERSION 3.10)

project("The Bad Text Editor")

file(GLOB_RECURSE sources src/*.cc)

add_executable(bad ${sources})
