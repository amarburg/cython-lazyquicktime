#!/usr/bin/env python

import lazyqt
import math

from scipy.misc import imsave

def test_get_frame():
    frameNum = 1
    img = lazyqt.get_frame(b"test_data/CamHD_Vent_Short.mov", frameNum )

    ## Movie size is known apriori
    assert( img.shape[0] == 1080 )
    assert( img.shape[1] == 1920 )
    assert( img.shape[2] == 4 )
