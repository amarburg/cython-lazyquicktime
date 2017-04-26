# file: lazyqt.pyx

cimport cgo_lazyqt as clazyqt

def movie_info( bytes path ):
  return clazyqt.MovInfo( path )

def get_frmae( bytes path, int frame ):
  return clazyqt.GetFrame( path, frame )
