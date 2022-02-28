import glob
import numpy as np
import netCDF4 as nc
import matplotlib.pyplot as plt
import geopandas as gpd
import rasterio as rio
from rasterio.transform import Affine
import pandas as pd


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



AverageMap_WHOI = np.mean(Months_append,axis=0)
AverageMap_WHOI_UC = ((AverageMap_WHOI*0.1)*12/100) ##conversion to meters per year (multiplied by scale_factor)
test = np.flip(AverageMap_WHOI_UC)
test1 = np.fliplr(test)
test2 = np.flip(test1)
lat_1 = np.flip(latitude)
lon, lat = np.meshgrid(longitude, lat_1)
plt.pcolor(lon,lat,test1)
plt.colorbar()

#####################Creating the tif file
res = (longitude[-1] - longitude[0]) / len(longitude)
transform = Affine.translation(longitude[0] - res / 2, latitude[0] - res / 2) * Affine.scale(res, res)

with rio.open(
    '/Users/isamarcortes/Desktop/TRMM_GeoTIFF/CopyOfDataInCaseIMessUpcopy/AverageWHOI.tif',
    'w',
    driver='GTiff',
    height=AverageMap_WHOI_UC.shape[0],
    width=AverageMap_WHOI_UC.shape[1],
    count=1,
    dtype=AverageMap_WHOI_UC.dtype,
    crs='+proj=latlong',
    transform=transform,
)as dst:
    dst.write(AverageMap_WHOI_UC, 1)





