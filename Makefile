
UNAME_S := $(shell uname -s)

all: lazyqt_so test

lazyqt_so: pylazyqt/pylazyqt.pyx cgo_lazyqt.pxd
	python setup.py build_ext -i

ifeq ($(UNAME_S),Darwin)
		## Only on OSX....
		install_name_tool -change liblazyquicktime.so $(env GOPATH)/src/github.com/amarburg/cgo-lazyquicktime/liblazyquicktime.so pylazyqt.cpython-36m-darwin.so
endif



test: test_data lazyqt_so
	python -m pytest test/

bench: test_data
	python -m pytest benchmark/





test_data: test_data/CamHD_Vent_Short.mov

test_data/CamHD_Vent_Short.mov:
	mkdir test_data/
	curl -L -o test_data/CamHD_Vent_Short.mov https://github.com/amarburg/go-lazyfs-testfiles/blob/master/CamHD_Vent_Short.mov?raw=true
	touch test_data/CamHD_Vent_Short.mov

## Builds and installs a test Jupyter kernel for the local user
kernel:
	python -m ipykernel install --user --name lazyqt_test --display-name "LazyQT Test"

clean:
	rm -f *.so

.PHONY: test clean kernel
