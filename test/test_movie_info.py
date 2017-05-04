#!/usr/bin/env python

import pylazyqt
import math

def test_local_movie_info():
    info = pylazyqt.movie_info(b"test_data/CamHD_Vent_Short.mov")

    assert math.isclose( info['duration'], 1.0343666076660156, rel_tol=1e-3 ) # Allow 0.1% error...
    assert info['num_frames'] == 31
    assert info['valid']

def test_http_movie_info():
    info = pylazyqt.movie_info(b"https://github.com/amarburg/go-lazyfs-testfiles/raw/master/CamHD_Vent_Short.mov")

    assert info['valid']
    assert math.isclose( info['duration'], 1.0343666076660156, rel_tol=1e-3 ) # Allow 0.1% error...
    assert info['num_frames'] == 31
