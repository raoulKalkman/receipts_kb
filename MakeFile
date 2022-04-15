# basic makefile, used to set up a test suite and to cleanly remove excess files
# nothing needs to be compiled, however deploy can be called to start a server

LANGUAGE:=python3 
PORT:=5000

.PHONY: deploy test debug clean

deploy:
# TODO: fill in

test:


debug:


clean:
	rm -rf venv/ instance/ __pycache__/ server/__pycache__ 