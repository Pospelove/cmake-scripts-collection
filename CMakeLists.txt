cmake_minimum_required(VERSION 3.17)
project(cmake_scripts_collection)

add_custom_target(cmake_scripts_collection ALL COMMAND ${CMAKE_COMMAND}
  -DROOT=${CMAKE_SOURCE_DIR}
  -DOUT_DIR=${CMAKE_SOURCE_DIR}
  -P ${CMAKE_SOURCE_DIR}/helper/build.cmake
)
