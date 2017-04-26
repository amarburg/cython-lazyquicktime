
CGO_PATH=$(GOPATH)/src/github.com/amarburg/cgo-lazyquicktime

CFLAGS="-I$(CGO_PATH)"
LDFLAGS="-L$(CGO_PATH)"

all: lazyqt_so

lazyqt_so: lazyqt/lazyqt.pyx cgo_lazyqt.pxd
	CFLAGS=$(CFLAGS) LDFLAGS=$(LDFLAGS) python setup.py build_ext -i

test: test_data
	LD_LIBRARY_PATH=$(shell pwd)/lazyqt python -m pytest test/

bench: test_data
	LD_LIBRARY_PATH=$(shell pwd)/lazyqt python -m pytest benchmark/

test_data: test_data/CamHD_Vent_Short.mov

test_data/CamHD_Vent_Short.mov:
	mkdir test_data/
	curl -L -o test_data/CamHD_Vent_Short.mov https://github.com/amarburg/go-lazyfs-testfiles/blob/master/CamHD_Vent_Short.mov?raw=true
	touch test_data/CamHD_Vent_Short.mov

test_deps:
	pip install -U pytest pytest-benchmark


.PHONY: test
