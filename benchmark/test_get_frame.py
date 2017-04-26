#!/usr/bin/env python

import lazyqt
import math

def get_frame( path, frameNum ):
    img = lazyqt.get_frame(b"test_data/CamHD_Vent_Short.mov", frameNum )

    return img

def test_benchmark_movie_info(benchmark):
    img = benchmark(lazyqt.get_frame,b"test_data/CamHD_Vent_Short.mov",1)

    ## Movie size is known apriori
    assert( img.shape[0] == 1080 )
    assert( img.shape[1] == 1920 )
    assert( img.shape[2] == 4 )
