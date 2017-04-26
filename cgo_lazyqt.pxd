# file: lazyquicktime.pxd

cdef extern from "liblazyquicktime.h":
  ctypedef struct MovieInfo:
    float duration
    int num_frames
    bint valid

  ctypedef enum ImageDepth:
    IMG_8U = 0
    IMG_16U = 1
    IMG_32F = 2

  ctypedef struct ImageBuffer:
    void *data
    int width
    int height
    int channels
    ImageDepth depth
    bint valid

  ImageBuffer GetFrame(char* p0, int p1);
  MovieInfo MovInfo(char* p0);
