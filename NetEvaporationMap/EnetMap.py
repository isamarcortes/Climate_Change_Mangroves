import rasterio as rio
import numpy as np
import matplotlib.pyplot as plt


AverageTRMMData = '/Users/isamarcortes/Desktop/TRMM_GeoTIFF/CopyOfDataInCaseIMessUpcopy/AverageTRMM.tif'
AverageWHOIData = '/Users/isamarcortes/Desktop/TRMM_GeoTIFF/CopyOfDataInCaseIMessUpcopy/AverageWHOI.tif'



with rio.open(AverageTRMMData) as src:
     TRMM = src.read(1)
     Tform = src.transform
     
     
with rio.open(AverageWHOIData) as data:
    WHOI = data.read(1)
        
########################TRMM
sub_TRMM = TRMM[:,0:180]
plt.imshow(sub_TRMM)

############################WHOI
Flip1 = np.flip(WHOI)
Flip2 = np.fliplr(Flip1)
Evaporation = Flip2[40:140,180:360]

###############Net Evaporation Raster
Enet = Evaporation - sub_TRMM

###############Formating to get read to appropriately export map
test1 = np.flip(Enet)
test2 = np.fliplr(test1)
test3 = np.where(test2<4,test2,np.nan)#removing erroneous values
test4 = np.where(test3>-3,test3,np.nan)#removing erroneous values
plt.imshow(test3)
plt.colorbar()


with rio.open(
    '/Users/isamarcortes/Desktop/TRMM_GeoTIFF/CopyOfDataInCaseIMessUpcopy/Enet.tif',
    'w',
    driver='GTiff',
    width=test4.shape[1],
    height=test4.shape[0],
    count=1,
    dtype=Enet.dtype,
    crs='+proj=latlong',
    transform=Tform,
)as dst:
    dst.write(test4,indexes=1)

