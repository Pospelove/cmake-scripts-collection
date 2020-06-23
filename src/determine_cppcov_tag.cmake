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

  set(tag)
  set(tag2)

  if(EXISTS ${CMAKE_BINARY_DIR}/cppcov_tag.tmp)
    file(READ ${CMAKE_BINARY_DIR}/cppcov_tag.tmp tag)
  endif()
  if(EXISTS ${CMAKE_BINARY_DIR}/../cppcov_tag.tmp)
    file(READ ${CMAKE_BINARY_DIR}/../cppcov_tag.tmp tag2)
  endif()
  if("${tag}" STREQUAL "" AND "${tag2}" STREQUAL "")
    message(FATAL_ERROR "Unable to determine CPPCOV_TAG")
  endif()

  if("${tag2}" STREQUAL "")
    set("${A_OUTPUT_VARIABLE}" "${tag}" PARENT_SCOPE)
  else()
    set("${A_OUTPUT_VARIABLE}" "${tag2}" PARENT_SCOPE)
  endif()
endfunction()
