import rasterio as rio
from rasterio.enums import Resampling
import os
import glob
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

TRMM_Files = sorted(glob.glob('/Users/isamarcortes/Desktop/TRMM_GeoTIFF/*.tif'))
downscale_factor = 1/16


for i in TRMM_Files:
    with rio.open(i) as dataset:
        data = dataset.read(
        out_shape=(
            dataset.count,
            int(dataset.height * downscale_factor),
            int(dataset.width * downscale_factor)
        ),
        resampling=Resampling.bilinear
    )

plt.imshow(data[0,:,:])
