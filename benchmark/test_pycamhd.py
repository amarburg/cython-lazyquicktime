#!/usr/bin/env python

import pycamhd
import math

def get_frame( path ):
    moov_atom = pycamhd.get_moov_atom(path)
    frame_count = pycamhd.get_frame_count(filename, moov_atom)
    return info

def test_benchmark_get_frame(benchmark):
    info = benchmark(get_frame,b"test_data/CamHD_Vent_Short.mov")

    # assert math.isclose( info['duration'], 1.0343666076660156, rel_tol=1e-3 ) # Allow 0.1% error...
    # assert info['num_frames'] == 31
    # assert info['valid']
