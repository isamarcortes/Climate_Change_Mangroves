import glob
import numpy as np
import netCDF4 as nc
import rasterio as rio
from rasterio.transform import Affine
import matplotlib.pyplot as plt


WHOI_data = sorted(glob.glob('/Users/isamarcortes/Dropbox/Isamar/Satellite_Imagery_Analysis/WHOI_Data/Whoi_Data_1stChapter/*.nc'))
WHOI_data_append = []


Months_append = []
for i in WHOI_data:
    WHOI_data_append.append(i)
    dataset = nc.Dataset(i,'r')
    
    for j in np.arange(1,12):
        Months_append.append(dataset['evapr'][j,:,:])
        latitude = dataset['lat'][:]
        longitude = np.arange(-180,180)#dataset['lon'][:]

AverageMap_WHOI_UC = []
for k in Months_append:
    AverageMap_WHOI_UC.append(k / 100)

OnlyCaribbean = []
for l in AverageMap_WHOI_UC:
    OnlyCaribbean.append(l[40:140,180:360])

AverageMap_WHOI = np.mean(Months_append,axis=0)

#####################Creating the tif file
res = (longitude[-1] - longitude[0]) / len(longitude)
transform = Affine.translation(longitude[0] - res / 2, latitude[0] - res / 2) * Affine.scale(res, res)

########Getting transformation from TRMM
AverageTRMMData = '/Users/isamarcortes/Desktop/TRMM_GeoTIFF/CopyOfDataInCaseIMessUpcopy/AverageTRMM.tif'
with rio.open(AverageTRMMData) as src:
     TRMM = src.read(1)
     Tform = src.transform
 
latforraster = np.arange(0,100)
lonforraster = np.arange(0,180)
with rio.open(
    '/Users/isamarcortes/Desktop/TRMM_GeoTIFF/CopyOfDataInCaseIMessUpcopy/AverageWHOI_allbands.tif',
    'w',
    driver='GTiff',
    height=len(latforraster),
    width=len(lonforraster),
    count=198,
    dtype=AverageMap_WHOI.dtype,
    crs='+proj=latlong',
    transform=Tform,
)as dst:
    for band_nr, src in enumerate(OnlyCaribbean, start=1):
        dst.write(src, band_nr)
