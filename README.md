# CMake Scripts Collection

Usage:
```cmake
include(cmake_scripts_collection.cmake)
```

npm example:

```cmake
include(cmake_scripts_collection.cmake)

# Executes 'npm install' in 'some/dir' directory
npm_execute_command(COMMAND install WORKING_DIRECTORY /some/dir)

# Adds start script to package.json in '/some/dir' directory
npm_set_script(
  WORKING_DIRECTORY /some/dir 
  NAME start 
  SCRIPT node . 
  RESULT_VARIABLE result_variable
  OUTPUT_VARIABLE output_variable
)
# Can run this command immediately
npm_execute_command(COMMAND start WORKING_DIRECTORY /some/dir)

```
