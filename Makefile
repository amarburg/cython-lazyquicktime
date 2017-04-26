
CFLAGS="-I/Users/aaron/workspace/go/src/github.com/amarburg/cgo-lazyquicktime"
LDFLAGS="-L/Users/aaron/workspace/go/src/github.com/amarburg/cgo-lazyquicktime"

all: lazyqt_so

lazyqt_so: lazyqt.pyx cgo_lazyqt.pxd
	python setup.py build_ext -i


test: test_data
	python -m pytest test/

bench: test_data
	python -m pytest benchmark/

test_data: test_data/CamHD_Vent_Short.mov

test_data/CamHD_Vent_Short.mov:
	curl -L -o test_data/CamHD_Vent_Short.mov https://github.com/amarburg/go-lazyfs-testfiles/blob/master/CamHD_Vent_Short.mov?raw=true
	touch test_data/CamHD_Vent_Short.mov

test_deps:
	pip install -U pytest pytest-benchmark


.PHONY: test
