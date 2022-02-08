import rasterio as rio
from rasterio.enums import Resampling
import os
import glob
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

TRMM_Files = sorted(glob.glob('/Users/isamarcortes/Desktop/TRMM_GeoTIFF/*.tif'))
downscale_factor = 1/16
files = []

for j in TRMM_Files:
    files.append(j)

test = []

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
        test.append(data)

test1 = np.mean(test,axis = 0)


#test1 = np.add(test)/len(test)
