#!/usr/bin/env python

import lazyqt
import math

from scipy.misc import imsave

def test_get_local_frame():
    frameNum = 1
    img = lazyqt.get_frame(b"test_data/CamHD_Vent_Short.mov", frameNum )

    ## Movie size is known apriori
    assert( img.shape[0] == 1080 )
    assert( img.shape[1] == 1920 )
    assert( img.shape[2] == 4 )


def test_get_http_frame():
    frameNum = 1
    img = lazyqt.get_frame(b"https://rawdata.oceanobservatories.org/files/RS03ASHS/PN03B/06-CAMHDA301/2016/01/01/CAMHDA301-20160101T000000Z.mov", frameNum)

    ## Movie size is known apriori
    assert( img.shape[0] == 1080 )
    assert( img.shape[1] == 1920 )
    assert( img.shape[2] == 4 )
