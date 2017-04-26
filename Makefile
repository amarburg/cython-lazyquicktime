
all: lazyqt_so

lazyqt_so: lazyqt/lazyqt.pyx cgo_lazyqt.pxd
	python setup.py build_ext -i

test: test_data lazyqt_so
	python -m pytest -s test/

bench: test_data
	python -m pytest benchmark/

test_data: test_data/CamHD_Vent_Short.mov

test_data/CamHD_Vent_Short.mov:
	mkdir test_data/
	curl -L -o test_data/CamHD_Vent_Short.mov https://github.com/amarburg/go-lazyfs-testfiles/blob/master/CamHD_Vent_Short.mov?raw=true
	touch test_data/CamHD_Vent_Short.mov

test_deps:
	pip install -U pytest pytest-benchmark


clean:
	rm -f *.so

.PHONY: test clean lazyqt/lazyqt.c
