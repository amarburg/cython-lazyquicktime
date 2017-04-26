
CGO_PATH=$(GOPATH)/src/github.com/amarburg/cgo-lazyquicktime

CFLAGS="-I$(CGO_PATH)"
LDFLAGS="-L$(CGO_PATH)"

all: lazyqt_so

lazyqt_so: lazyqt.pyx cgo_lazyqt.pxd
	echo $(CFLAGS)
	python setup.py build_ext -i
	cp $CGO_PATH/liblazyquicktime.so .

test: test_data
	python -m pytest test/

bench: test_data
	python -m pytest benchmark/

test_data: test_data/CamHD_Vent_Short.mov

test_data/CamHD_Vent_Short.mov:
	mkdir test_data/
	curl -L -o test_data/CamHD_Vent_Short.mov https://github.com/amarburg/go-lazyfs-testfiles/blob/master/CamHD_Vent_Short.mov?raw=true
	touch test_data/CamHD_Vent_Short.mov

test_deps:
	pip install -U pytest pytest-benchmark


.PHONY: test
