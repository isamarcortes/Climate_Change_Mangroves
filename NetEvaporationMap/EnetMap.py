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
sub_TRMM = TRMM[:,0:180] #This subindexes the Caribbean
plt.imshow(sub_TRMM)
plt.show()
############################WHOI
'''
This piece of code is needed to flip the WHOI matrix as it imports
incorrectly.  
'''
Flip1 = np.flip(WHOI) 
#plt.imshow(WHOI)
#plt.show()
Flip2 = np.fliplr(Flip1)
#plt.imshow(Flip2)
#plt.show()
'''
Have to index Enet both in x and y axis as I want to overlap with TRMM data
'''
Evaporation = Flip2[40:140,180:360] ##40:140 to cover same region as TRMM data of 50 north 50 south
plt.imshow(Evaporation)
plt.show()

###############Net Evaporation Raster
Enet = Evaporation - sub_TRMM
plt.imshow(Enet)
plt.show()
###############Formating to get read to appropriately export map
'''
This is used to create Nan values in place for values that 
WHOI deems as NaN
'''
test1 = np.flip(Enet)
test2 = np.fliplr(test1)
test3 = np.where(test2<4,test2,np.nan)#removing erroneous values
test4 = np.where(test3>-3,test3,np.nan)#removing erroneous values
plt.imshow(test3)
plt.colorbar()


'''
Creating and exporting the tif files
'''

with rio.open(
    '/Users/isamarcortes/Dropbox/Isamar/Satellite_Imagery_Analysis/EnetAvg.tif',
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

