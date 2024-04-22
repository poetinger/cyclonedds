set(CMAKE_SYSTEM_NAME QNX)
set(CMAKE_SYSTEM_VERSION ${QNX_VERSION})
set(CMAKE_SYSTEM_PROCESSOR ${QNX_PROCESSOR})

set(CMAKE_C_COMPILER qcc)
set(CMAKE_CXX_COMPILER q++)

set(CMAKE_C_COMPILER_TARGET ${QNX_TOOLCHAIN_ARCH})
set(CMAKE_CXX_COMPILER_TARGET ${QNX_TOOLCHAIN_ARCH})

if(NOT DEFINED ENV{QNX_HOST} OR NOT DEFINED ENV{QNX_TARGET})
  message(FATAL_ERROR "Environment variable(s) QNX_HOST and/or QNX_TARGET not set! Set the QNX SDP environment by running e.g. 'source qnxsdp-env.sh'")
endif()

set(CMAKE_FIND_ROOT_PATH $ENV{QNX_TARGET};$ENV{QNX_TARGET}/${CMAKE_SYSTEM_PROCESSOR})
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)

add_compile_options("-D_QNX_SOURCE=1")

# Default features which are not supported by QNX and need to be disabled
set(ENABLE_SOURCE_SPECIFIC_MULTICAST 0)

