#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Mon Apr 18 17:35:31 2022

@author: isamarcortes
"""
import pandas as pd
import numpy as np
import seaborn as sns
import matplotlib.pyplot as plt

EvaporationData = '/Users/isamarcortes/Dropbox/Isamar/Papers_In_Prep/Paper_1/SupplementaryMaterial/TimeSeriesData.xlsx'


AllEvapData = pd.read_excel(EvaporationData,sheet_name='AllEvaporationData')
AllPrecipData = pd.read_excel(EvaporationData,sheet_name='AllPrecipitationData')
Names = ['PuertoRico','Cuba','Belize','Mexico','Venezuela','Florida','Bahamas']


for i in Names:
    sns.scatterplot(data=AllEvapData,x='Time',y=i,label=i)
plt.ylabel('Evaporation Rate (m/yr)')
plt.legend(bbox_to_anchor=(1.02, 1),loc='upper left')
plt.show()

for j in Names:
    sns.scatterplot(data=AllPrecipData,x='Time',y=j,label=j)
plt.ylabel('Precipitation Rate (m/yr)')
plt.legend(bbox_to_anchor=(1.02, 1),loc='upper left')
plt.show()


ETandECubaBZ = '/Users/isamarcortes/Dropbox/Isamar/Papers_In_Prep/Paper_1/SupplementaryMaterial/ETandECubaAndBelize.xlsx'
CubaData = pd.read_excel(ETandECubaBZ,sheet_name='CubaDataAnalysis')
BelizeData = pd.read_excel(ETandECubaBZ,sheet_name='BelizeDataAnalysis')

sns.scatterplot(data=CubaData,x='Year',y='ResidualEvap',label='Evaporation Residual')
sns.scatterplot(data=CubaData,x='Year',y='ResidualET',label='ET Residual')
plt.legend(loc='lower center')
plt.ylabel('')
plt.title('Cuba Evaporation and ET Residuals')
plt.show()

sns.scatterplot(data=BelizeData,x='Year',y='ResidualEvap',label='Evaporation Residual')
sns.scatterplot(data=BelizeData,x='Year',y='ResidualET',label='ET Residual')
plt.legend(loc='lower left')
plt.ylabel('')
plt.title('Belize Evaporation and ET Residuals')
plt.show()




