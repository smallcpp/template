add_test(
    NAME hello
    COMMAND ${CMAKE_COMMAND}
        -DPROGRAM=${HELLO_PROGRAM}
        "-DNEEDLE=hello, smallcpp"
        -P ${CMAKE_CURRENT_SOURCE_DIR}/ExpectHello.cmake)
