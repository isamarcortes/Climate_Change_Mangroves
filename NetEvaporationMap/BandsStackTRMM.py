import rasterio as rio
from rasterio.enums import Resampling
import glob
import rasterio as rio
from rasterio.enums import Resampling
import glob
import numpy as np
import matplotlib.pyplot as plt
from rasterio.transform import Affine

'''
Code Documentation:
 
    This code takes all of the TRMM data and puts it as 1 tif file with bands
'''


TRMM_Files = sorted(glob.glob('/Users/isamarcortes/Dropbox/Isamar/Satellite_Imagery_Analysis/TRMM_GeoTIFF/TRMM_GeoTIFF_OriginalFiles/*.tif')) #change this to working directory
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


RemovingIndex = []
for m in NPArrays:
    test1 = (m[0]*24*30)/1000 #conversion to m / month
    test2=test1[:,0:180]
    test3= np.flip(test2)
    test4 = np.fliplr(test3)
    #test2 = test1[:,0:180]
    RemovingIndex.append(test4)



###let's try this
plt.imshow(test4)
plt.show()

longitude = np.arange(-180,0,1)
latitude = np.arange(-50,50,1)


AverageTRMMData = '/Users/isamarcortes/Desktop/TRMM_GeoTIFF/CopyOfDataInCaseIMessUpcopy/AverageTRMM.tif'
with rio.open(AverageTRMMData) as src:
     TRMM = src.read(1)
     Tform = src.transform

with rio.open(
    '/Users/isamarcortes/Dropbox/Isamar/Satellite_Imagery_Analysis/AverageTRMM_allbandstest.tif',
    'w',
    driver='GTiff',
    height=len(latitude),
    width=len(longitude),
    count=264,
    dtype=AverageMap_TRMM_UC.dtype,
    crs='+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs',
    transform=Tform,
)as dst:
    for band_nr, src in enumerate(RemovingIndex, start=1):
        dst.write(src,band_nr)
        
