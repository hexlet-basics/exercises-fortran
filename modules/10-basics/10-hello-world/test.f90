program test
  use naturalfruit
  integer :: exit_code, ios
  character(100) :: actual, filename='stdout'

  ! Get data from stdout
  open(6, file=filename)
  include 'solution.f90'
  close(6)

  open(6, file=filename)
  do
    read(6, '(a)', iostat = ios) actual
    if (ios /= 0) exit
  end do
  close(6)

  open(6, file='/dev/stdout')
  ! ---------------------

  call testsuite_initialize()

  call set_case_name('base test')
  call assert_equal('Hello World!', actual)

  call testsuite_summary()
  call testsuite_finalize(exit_code)
  call exit(exit_code)

end program test
