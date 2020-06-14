file(MAKE_DIRECTORY "${OUT_DIR}")

file(WRITE ${OUT_DIR}/cmake_scripts_collection.cmake "
# It's a collection of CMake scripts combined into a single file automatically
# See build.cmake

")

set(SOURCE_FILES
  ${ROOT}/src/apply_default_settings.cmake
  ${ROOT}/src/cmake_generate.cmake
  ${ROOT}/src/determine_cppcov_tag.cmake
  ${ROOT}/src/integrate_vcpkg.cmake
  ${ROOT}/src/npm.cmake
  ${ROOT}/src/run_cppcoverage.cmake
  ${ROOT}/src/skymp_execute_process.cmake
)

foreach(path ${SOURCE_FILES})
  message(STATUS "Writing ${path} content")
  file(READ ${path} content)
  get_filename_component(name ${path} NAME)
  file(APPEND ${OUT_DIR}/cmake_scripts_collection.cmake "#\n# ${name}:\n#\n\n${content}\n\n")
endforeach()
