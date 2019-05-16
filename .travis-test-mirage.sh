#!/bin/sh -ex

eval `opam config env`
#logs has an optional dependency on lwt, install it now to avoid recompilations
#in the "make depend" step further down
opam install mirage lwt

cd mirage-test
mirage configure -t ${MIRAGE_TEST_MODE} && make depend && mirage build
