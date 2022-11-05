#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Thu Sep  9 16:40:44 2021
@author: isamarcortes
"""

###preprocessing included removing band 4 using gdal_translate

from sklearn.ensemble import RandomForestClassifier
from sklearn.model_selection import train_test_split
from sklearn.metrics import accuracy_score, confusion_matrix, classification_report
import rasterio as rio
import matplotlib.pyplot as plt
import numpy as np
from sklearn.multioutput import MultiOutputClassifier



Tif_File = '/Users/isamarcortes/Dropbox/Isamar/Satellite_Imagery_Analysis/PlanetData/UpperArsnickerKey_psscene_analytic_sr_udm2/files/20170126_151457_0e3a_3B_AnalyticMS_SR_harmonized_clip.tif'


def read_band(file, band_num):
    with rio.open(file, 'r') as f:
        band = f.read(band_num)
    return band

###reading bands/ training bands
band1 = read_band(Tif_File,1)#b
band2 = read_band(Tif_File,2)#g
band3 = read_band(Tif_File,3)#r
band4 = read_band(Tif_File,4)#nir


########using NIR
####creating "polygons to define labeled data
RedMangrove = band4[125:160,160:200]
BlackMangrove = band4[60:90,75:110]
Water = band4[175:250,0:50]
Shadow = band4[50:100,25:30]
DieBack = band4[50:75,125:150]


#plt.imshow(BlackMangrove)
#plt.colorbar()



######labeling data
labeled_data = np.zeros(shape = band4.shape, dtype=np.str)



labeled_data[((band1 >= 161) & (band1 <= 255))]='Sand'


####grabbed values based on min and max of polygons
labeled_data[((band4>=1893) & (band4<=3000))]='RedMangrove'
labeled_data[((band4>=1488) & (band4<=1892))]='BlackMangrove'
labeled_data[((band4>=0) & (band4<=500))]='Water '
labeled_data[((band4>=450) & (band4<=800))]='Shadow'
labeled_data[((band4>=700) & (band4<=1500))]='DieBack'


X_train, X_test, y_train, y_test = train_test_split(band4, labeled_data, test_size=0.33,random_state=66)
rfc = RandomForestClassifier(random_state=66)
rfc_multiclass = MultiOutputClassifier(rfc)

rfc_multiclass.fit(X_train,y_train)

rfc_predict = rfc_multiclass.predict(X_test) #y_pred_test
testpredict = rfc_multiclass.predict(band4)

####creating the classification map
rfc_predict_img = np.zeros(shape = testpredict.shape, dtype=np.integer)

rfc_predict_img[((testpredict == 'R'))] = 0
rfc_predict_img[((testpredict == 'B'))] = 1
rfc_predict_img[((testpredict == 'W'))] = 2
rfc_predict_img[((testpredict == 'S'))] = 3
rfc_predict_img[((testpredict == 'D'))] = 4
plt.imshow(rfc_predict_img)

plt.colorbar()



















