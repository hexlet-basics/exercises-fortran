module tests
implicit none

contains
  subroutine test()
    use naturalfruit
    integer :: ios
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

    call set_case_name('base test')
    call assert_equal('Hello, World!', actual)
  end subroutine test

end module tests
