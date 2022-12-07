cmake_minimum_required(VERSION 3.15)

project(assembly-playground
    VERSION 0.0.1
    LANGUAGES ASM)

add_executable(hello-world
    hello-world.s
)

