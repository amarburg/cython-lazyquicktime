#!/usr/bin/env python

import lazyqt
import math

def get_movie_info( path ):
    info = lazyqt.movie_info(path)
    return info

def test_benchmark_movie_info(benchmark):
    info = benchmark(lazyqt.movie_info,b"test_data/CamHD_Vent_Short.mov")

    assert math.isclose( info['duration'], 1.0343666076660156, rel_tol=1e-3 ) # Allow 0.1% error...
    assert info['num_frames'] == 31
    assert info['valid']
