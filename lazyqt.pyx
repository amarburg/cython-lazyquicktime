# file: lazyqt.pyx

cimport cgo_lazyqt as clazyqt
import numpy as np

def movie_info( bytes path ):
  return clazyqt.MovInfo( path )

def get_frame( bytes path, int frame ):
  img = clazyqt.GetFrame( path, frame )

  # Convert to nparray
  return np.frombuffer( img.data ).reshape( img.height, img.width )
