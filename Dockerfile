FROM hexletbasics/base-image:latest

RUN apt-get update && apt-get install -y gfortran

RUN wget -q https://github.com/cibinjoseph/naturalFRUIT/releases/download/v0.7.4/naturalFRUIT.zip
RUN unzip -qd /naturalFRUIT naturalFRUIT.zip
RUN mkdir /usr/local/lib/fortran
RUN cd /usr/local/lib/fortran && gfortran -c /naturalFRUIT/src-zip/src/naturalfruit.f90

# TODO: желательно заменить этот линтер. Проверяет как-то выборочно.
RUN pip install fortran-linter

WORKDIR /exercises-fortran

COPY . .

ENV PATH=/exercises-fortran/bin:$PATH
