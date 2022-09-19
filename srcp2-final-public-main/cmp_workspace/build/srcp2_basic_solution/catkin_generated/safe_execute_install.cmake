execute_process(COMMAND "/home/srcp2/cmp_workspace/build/srcp2_basic_solution/catkin_generated/python_distutils_install.sh" RESULT_VARIABLE res)

if(NOT res EQUAL 0)
  message(FATAL_ERROR "execute_process(/home/srcp2/cmp_workspace/build/srcp2_basic_solution/catkin_generated/python_distutils_install.sh) returned error code ")
endif()
