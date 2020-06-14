function(determine_cppcov_tag)
  set(options)
  set(oneValueArgs OUTPUT_VARIABLE)
  set(multiValueArgs)
  cmake_parse_arguments(A
    "${options}" "${oneValueArgs}" "${multiValueArgs}" ${ARGN}
  )

  if ("${A_OUTPUT_VARIABLE}" STREQUAL "")
    message(FATAL_ERROR "Missing OUTPUT_VARIABLE")
  endif()

  file(READ ${CMAKE_CURRENT_BINARY_DIR}/cppcov_tag.tmp tag)
  if("${tag}" STREQUAL "")
    message(FATAL_ERROR "Unable to determine CPPCOV_TAG")
  endif()
  set("${A_OUTPUT_VARIABLE}" "${tag}" PARENT_SCOPE)
endfunction()
