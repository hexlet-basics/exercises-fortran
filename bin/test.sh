#!/bin/bash

clean() {
  rm -f output stdout
}

gfortran \
  -J /usr/local/lib/fortran /usr/local/lib/fortran/naturalfruit.o \
  test.f90 /exercises-fortran/src/testrunner.f90 \
  -o output \
  && ./output

exit_code=$?

clean
exit $exit_code
