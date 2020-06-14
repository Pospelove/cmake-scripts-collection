function(integrate_vcpkg)
  cmake_parse_arguments(A "" "VCPKG_PATH" "TARGETS;ADDITIONAL_INCLUDE_DIRS" ${ARGN})
  foreach(arg VCPKG_PATH TARGETS)
    if ("${A_${arg}}" STREQUAL "")
      message(FATAL_ERROR "Missing ${arg} argument")
    endif()
  endforeach()

  if (NOT "${CMAKE_GENERATOR_PLATFORM}" STREQUAL "")
    set(platform ${CMAKE_GENERATOR_PLATFORM})
  elseif(NOT "${CMAKE_VS_PLATFORM_NAME}" STREQUAL "")
    set(platform ${CMAKE_VS_PLATFORM_NAME})
  else()
    message(FATAL_ERROR "Enable to detect current platform")
  endif()

  if (WIN32)
    set(os windows)
  elseif(UNIX)
    set(os linux)
  else()
    message(FATAL_ERROR "Only Windows and Linux are supported")
  endif()

  set(triplet_prefix_Win32 "x86")
  set(triplet_prefix_x64 "x64")
  set(triplet "${triplet_prefix_${platform}}-${os}-static")

  message(STATUS "[integrate_vcpkg] platform is ${platform}, triplet is ${triplet}")

  foreach(target ${A_TARGETS})
    target_include_directories(${target} PUBLIC
      "${A_VCPKG_PATH}/installed/${triplet}/include"
    )
    foreach(dir ${A_ADDITIONAL_INCLUDE_DIRS})
      target_include_directories(${target} PUBLIC
        "${A_VCPKG_PATH}/installed/${triplet}/include/${dir}"
      )
    endforeach()
    file(GLOB_RECURSE release_libs "${A_VCPKG_PATH}/installed/${triplet}/lib/*")
    file(GLOB_RECURSE debug_libs "${A_VCPKG_PATH}/installed/${triplet}/debug/lib/*")
    target_link_libraries(${target} PUBLIC debug ${debug_libs} optimized ${release_libs})
  endforeach()
endfunction()