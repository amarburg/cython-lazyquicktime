# file: lazyqt.pyx

cimport cgo_lazyqt as clazyqt

from cython.view cimport array as cvarray
import numpy as np
cimport numpy as np

np.import_array()

def movie_info( bytes path ):
  info = clazyqt.MovInfo( path )
  if info.valid == 0:
    return None

  return info

def get_frame( bytes path, int frame ):
  img = clazyqt.GetFrame( path, frame )
  if img.valid == 0:
    return None


  nptype = parse_image_depth( img.depth )

  #buffer = PyMemoryView_FromMemory( img.data, img.height*img.width*img.channels*dt.itemsize, PyBUF_READ )

  cdef np.npy_intp shape[3]
  shape[0] = <np.npy_intp> img.height
  shape[1] = <np.npy_intp> img.width
  shape[2] = <np.npy_intp> img.channels

  return np.PyArray_SimpleNewFromData( 3, shape, nptype, img.data )


def parse_image_depth( depth ):
    if depth == clazyqt.IMG_8U:
        return np.NPY_UINT8   #np.dtype(np.uint8)
    elif  depth == clazyqt.IMG_16U:
        return np.NPY_UINT16  #np.dtype(np.uint16)
    elif depth == clazyqt.IMG_32F:
        return np.NPY_FLOAT32   #np.dtype(np.float32)
