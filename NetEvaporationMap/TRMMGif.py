#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Tue Mar 29 14:31:09 2022

@author: isamarcortes
"""

from array2gif import write_gif
import rasterio as rio
from rasterio.enums import Resampling
import glob
import rasterio as rio
from rasterio.enums import Resampling
import glob
import numpy as np
import matplotlib.pyplot as plt
from matplotlib.animation import FuncAnimation
from rasterio.transform import Affine
import matplotlib.cm as cm
import matplotlib.animation as animation

'''
Code Documentation:
 
    This code takes all of the TRMM data and puts it as 1 tif file with bands
'''


TRMM_Files = sorted(glob.glob('/Users/isamarcortes/Desktop/TRMM_GeoTIFF/*.tif')) #change this to working directory
downscale_factor = 1/4 #downscale to 1 degree resolution
files = [] 

for j in TRMM_Files:
    files.append(j)

NPArrays = []
for i in files: 
        with rio.open(i) as dataset:
            data = dataset.read(
            out_shape=(
                dataset.count,
                int(dataset.height * downscale_factor),
                int(dataset.width * downscale_factor)
            ),
            resampling=Resampling.average
        )    
        NPArrays.append(data)


RemovingIndex = []
test = []
for m in NPArrays:
    test2=m[0][:,0:180]
    #test2 = test1[:,0:180]
    RemovingIndex.append(test2)

filename=[]
fig= plt.figure()

for l in RemovingIndex:
    filename.append([plt.imshow(l[:,:],cmap='hot',animated=True)])
    #fig.colorbar(mappable=filename[l[:,:]])###FIX THIS 
    #plt.show()

ani = animation.ArtistAnimation(fig, filename, interval=500, blit=True,repeat_delay=1)
ani.save('/Users/isamarcortes/Dropbox/Isamar/Satellite_Imagery_Analysis/Preciptest.mp4')
plt.show()