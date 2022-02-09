import rasterio as rio
from rasterio.enums import Resampling
import glob
import numpy as np
import matplotlib.pyplot as plt
from rasterio.transform import Affine

'''
Code Documentation:
    This code takes any number of 0.25 by 0.25 degree TRMM data and 
    aggregates to a 1 by 1 degree using the resampling average function.
    It then takes the average of all of the files and creates one average
    precipitation map.
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

AverageMap_TRMM = np.mean(NPArrays,axis = 0)
AverageMap_TRMM_UC = (AverageMap_TRMM*24*365)/1000 #units correction

plt.imshow(AverageMap_TRMM_UC[0,:,:])
plt.colorbar()

longitude = np.arange(-180,180,1)
latitude = np.arange(-50,50,1)

res = (longitude[-1] - longitude[0]) / len(longitude)
transform = Affine.translation(longitude[0] - res / 2, latitude[0] - res / 2) * Affine.scale(res, res)

with rio.open(
    '/Users/isamarcortes/Desktop/TRMM_GeoTIFF/CopyOfDataInCaseIMessUpcopy/AverageTRMM.tif',
    'w',
    driver='GTiff',
    height=len(latitude),
    width=len(longitude),
    count=1,
    dtype=AverageMap_TRMM_UC.dtype,
    crs='+proj=latlong',
    transform=transform,
)as dst:
    dst.write(AverageMap_TRMM_UC)
