import glob
import numpy as np
import netCDF4 as nc
import matplotlib.pyplot as plt
import geopandas as gpd
import rasterio as rio
from rasterio.transform import Affine


WHOI_data = sorted(glob.glob('/Users/isamarcortes/Dropbox/Isamar/Satellite_Imagery_Analysis/WHOI_Data/Whoi_Data_1stChapter/*.nc'))
WHOI_data_append = []




Months_append = []
for i in WHOI_data:
    WHOI_data_append.append(i)
    dataset = nc.Dataset(i,'r')
    
    for j in np.arange(1,12):
        Months_append.append(dataset['evapr'][j,:,:])
        latitude = dataset['lat'][:]
        longitude = dataset['lon'][:]


AverageMap_WHOI = np.mean(Months_append,axis=0)
test = np.flip(AverageMap_WHOI)
test1 = np.fliplr(test)
test2 = np.flip(test1)
lat_1 = np.flip(latitude)
lon, lat = np.meshgrid(longitude, lat_1)
#plt.pcolor(lon,lat,test1)

#####################Creating the tif file
res = (longitude[-1] - longitude[0]) / len(longitude)
transform = Affine.translation(longitude[0] - res / 2, latitude[0] - res / 2) * Affine.scale(res, res)

with rio.open(
    '/Users/isamarcortes/Desktop/TRMM_GeoTIFF/CopyOfDataInCaseIMessUpcopy/AverageWHOI.tif',
    'w',
    driver='GTiff',
    height=AverageMap_WHOI.shape[0],
    width=AverageMap_WHOI.shape[1],
    count=1,
    dtype=AverageMap_WHOI.dtype,
    crs='+proj=latlong',
    transform=transform,
)as dst:
    dst.write(AverageMap_WHOI, 1)



plt.imshow(AverageMap_WHOI)
