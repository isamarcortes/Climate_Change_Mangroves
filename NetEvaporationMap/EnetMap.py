import rasterio as rio
import numpy as np
import matplotlib.pyplot as plt
from rasterio.windows import Window
import rasterio
import netCDF4 as nc


AverageTRMMData = '/Users/isamarcortes/Desktop/TRMM_GeoTIFF/CopyOfDataInCaseIMessUpcopy/AverageTRMM.tif'
AverageWHOIData = '/Users/isamarcortes/Desktop/TRMM_GeoTIFF/CopyOfDataInCaseIMessUpcopy/AverageWHOI.tif'



with rio.open(AverageTRMMData) as src:
     TRMM = src.read(1)

with rio.open(AverageWHOIData) as data:
    WHOI = data.read(1)
        
########################TRMM
sub_TRMM = TRMM[:,0:180]
plt.imshow(sub_TRMM)

############################WHOI
test2 = np.flip(WHOI)
test3 = np.fliplr(test2)
subsection = test3[40:140,180:360]
plt.imshow(subsection)



Enet = subsection - sub_TRMM

an_array = np.where(Enet > 2, np.nan, Enet)

ana = an_array[10:50,75:125]
plt.imshow(ana,cmap = 'seismic')
plt.colorbar()

