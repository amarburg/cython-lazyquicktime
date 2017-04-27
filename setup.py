from distutils.core import setup
from distutils.extension import Extension
from Cython.Build import cythonize
import numpy

import os

setup(
    ext_modules = cythonize([
            Extension("lazyqt", ["lazyqt/lazyqt.pyx"],
                        libraries=["lazyquicktime"],
                        include_dirs=['.', os.environ['GOPATH'] + "/src/github.com/amarburg/cgo-lazyquicktime/", numpy.get_include()],
                        library_dirs=['.', os.environ['GOPATH'] + "/src/github.com/amarburg/cgo-lazyquicktime/"],
                        runtime_library_dirs=['.', os.environ['GOPATH'] + "/src/github.com/amarburg/cgo-lazyquicktime/"])
        ])
)
