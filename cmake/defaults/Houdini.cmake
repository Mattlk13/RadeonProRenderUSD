if(NOT DEFINED HOUDINI_ROOT)
	if (NOT DEFINED ENV{HOUDINI_ROOT})
	    message(FATAL_ERROR "Specify HOUDINI_ROOT")
	endif()
    set(HOUDINI_ROOT $ENV{HOUDINI_ROOT})
endif()

if(CMAKE_INSTALL_PREFIX_INITIALIZED_TO_DEFAULT)
    message(STATUS "Setting CMAKE_INSTALL_PREFIX to HOUDINI_ROOT - ${HOUDINI_ROOT}")
    set(CMAKE_INSTALL_PREFIX "${HOUDINI_ROOT}" CACHE PATH "..." FORCE)
endif()

if(WIN32)
    set(HOUDINI_LIB ${HOUDINI_ROOT}/custom/houdini/dsolib)
    set(HOUDINI_INCLUDE_DIR ${HOUDINI_ROOT}/toolkit/include)
    set(HOUDINI_HH houdini)
else()
    set(HOUDINI_INCLUDE_DIR ${HOUDINI_ROOT}/Resources/toolkit/include)
    set(HOUDINI_LIB ${HOUDINI_ROOT}/Libraries)
    set(HOUDINI_HH Resources/houdini)
endif()
add_definitions(-DBUILD_AS_HOUDINI_PLUGIN)
