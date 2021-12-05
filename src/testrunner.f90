program testrunner
  use naturalfruit
  use tests
  integer :: exit_code

  call testsuite_initialize()

  call test()

  call testsuite_summary()
  call testsuite_finalize(exit_code)
  call exit(exit_code)

end program testrunner
