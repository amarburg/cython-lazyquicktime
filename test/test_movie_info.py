#!/usr/bin/env python

import lazyqt
import math

def test_movie_info():
    info = lazyqt.movie_info(b"test_data/CamHD_Vent_Short.mov")
    print(info)

    assert math.isclose( info['duration'], 1.0343666076660156, rel_tol=1e-3 ) # Allow 0.1% error...
    assert info['num_frames'] == 31
    assert info['valid']
