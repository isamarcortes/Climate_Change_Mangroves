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
    
    for j in np.arange(0,12):
        Months_append.append(dataset['evapr'][j,:,:])
        time = dataset['time']
        print(time)
        

AverageMap_WHOI_UC = []
for k in Months_append:
    AverageMap_WHOI_UC.append((k*0.1) / 100) ###multiplying by scale factor and converting to meters

OnlyCaribbean = []
for l in AverageMap_WHOI_UC:
    #OnlyCaribbean.append(l[40:140,180:360])
    test1 = l[40:140,180:360]
    test3= np.flip(test1) 
    test4 = np.fliplr(test3)
    test5 = np.flipud(test4)
    OnlyCaribbean.append(test5)
    

plt.imshow(test5)
plt.show()

AverageMap_WHOI = np.mean(Months_append,axis=0)
plt.imshow(AverageMap_WHOI[40:140,180:360])
plt.colorbar()
plt.show()


########Getting transformation from TRMM
AverageTRMMData = '/Users/isamarcortes/Desktop/TRMM_GeoTIFF/CopyOfDataInCaseIMessUpcopy/AverageTRMM.tif'
with rio.open(AverageTRMMData) as src:
     TRMM = src.read(1)
     Tform = src.transform
 
latforraster = np.arange(0,100)
lonforraster = np.arange(0,180)
with rio.open(
    '/Users/isamarcortes/Dropbox/Isamar/Satellite_Imagery_Analysis/AverageWHOI_allbands.tif',
    'w',
    driver='GTiff',
    height=len(latforraster),
    width=len(lonforraster),
    count=264,
    dtype=AverageMap_WHOI.dtype,
    crs='+proj=latlong',
    transform=Tform,
)as dst:
    for band_nr, src in enumerate(OnlyCaribbean, start=1):
        dst.write(src, band_nr)

