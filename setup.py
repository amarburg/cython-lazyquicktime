from distutils.core import setup
from distutils.extension import Extension
from Cython.Build import cythonize
import numpy

import os

setup(
  name='pylazyqt',
  version='0.1',
  description='The funniest joke in the world',
  url='https://github.com/amarburg/cython-lazyquicktime',
  author='Aaron Marburg',
  author_email='amarburg@apl.washington.edu',
  license='MIT',
  packages=['pylazyqt'],
    ext_modules = cythonize([
            Extension("pylazyqt", ["pylazyqt/pylazyqt.pyx"],
                        libraries=["lazyquicktime"],
                        include_dirs=['.', os.environ['GOPATH'] + "/src/github.com/amarburg/cgo-lazyquicktime/", numpy.get_include()],
                        library_dirs=['.', os.environ['GOPATH'] + "/src/github.com/amarburg/cgo-lazyquicktime/"],
                        runtime_library_dirs=['.', os.environ['GOPATH'] + "/src/github.com/amarburg/cgo-lazyquicktime/"])
        ]),
  setup_requires=['pytest-runner'],
  tests_require=['pytest', 'pytest-benchmark', 'numpy', 'pillow']
)
