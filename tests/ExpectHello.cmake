if(NOT DEFINED PROGRAM OR NOT DEFINED NEEDLE)
    message(FATAL_ERROR "hello check is missing a path")
endif()

execute_process(
    COMMAND "${PROGRAM}"
    RESULT_VARIABLE run_status
    OUTPUT_VARIABLE program_output
    ERROR_VARIABLE program_error)
if(NOT run_status EQUAL 0)
    message(FATAL_ERROR "hello exited ${run_status}: ${program_error}")
endif()

set(expected "${NEEDLE}\n")
if(NOT program_output STREQUAL "${expected}")
    message(FATAL_ERROR "hello wrote '${program_output}'")
endif()
