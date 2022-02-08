import rasterio as rio
from rasterio.enums import Resampling
import glob
import numpy as np

'''
Code Documentation:
    This code takes any number of 0.25 by 0.25 degree TRMM data and 
    aggregates to a 1 by 1 degree using the resampling average function.
    It then takes the average of all of the files and creates one average
    precipitation map.
'''


TRMM_Files = sorted(glob.glob('/Users/isamarcortes/Desktop/TRMM_GeoTIFF/*.tif')) #change this to working directory
downscale_factor = 1/16 #downscale to 1 degree resolution
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

AverageMap = np.mean(NPArrays,axis = 0)


with rio.open(j) as src:
    raster_data = src.read()
    raster_meta = src.profile

# make any necessary changes to raster properties, e.g.:
raster_meta['dtype'] = "float32"
raster_meta['nodata'] = -99

with rio.open('/Users/isamarcortes/Desktop/TRMM_GeoTIFF/CopyOfDataInCaseIMessUp copy/AverageTRMM.tif', 'w', **raster_meta) as dst:
    dst.write(AverageMap)

     
        
