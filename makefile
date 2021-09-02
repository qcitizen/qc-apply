build: compress.mli compress.ml driver.ml
	ocamlopt -o compress compress.mli compress.ml driver.ml

test: compress_test.ml compress.mli compress.ml
	ocamlfind ocamlopt -o test -linkpkg -package ounit2 compress.mli compress.ml compress_test.ml && ./test