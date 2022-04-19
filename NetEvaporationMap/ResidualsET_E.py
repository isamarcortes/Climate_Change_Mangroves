#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Wed Apr  6 16:47:49 2022

@author: isamarcortes
"""

import pandas as pd
import numpy as np
import matplotlib.pyplot as plt


Data = '/Users/isamarcortes/Dropbox/Isamar/Papers_In_Prep/Paper_1/SupplementaryMaterial/TimeSeriesData.xlsx'
ETData = '/Users/isamarcortes/Dropbox/Isamar/Papers_In_Prep/Paper_1/SupplementaryMaterial/ETandECubaAndBelize.xlsx'
#######

def Residuals(Data,DataET,Name,NameET):
    Dataset = pd.read_excel(Data,sheet_name=Name)
    Time = Dataset['Time']
    EvapAvg = np.mean(Dataset['Evaporation'])
    ResidualEvap = Dataset['Evaporation']-EvapAvg
    ###ET
    DatasetET = pd.read_excel(DataET,sheet_name=NameET)
    ETtime = DatasetET['Date']
    ETAvg = np.mean(DatasetET['ETperMonth'])
    ResidualET = DatasetET['ETperMonth']-ETAvg 
    return ResidualET, ResidualEvap, Time, ETtime


ResidualETBZ, ResidualEvapBZ, EvapTime, ETtime = Residuals(Data,ETData,'Belize','BELIZEETMONTHLY')
plt.plot(ETtime,ResidualETBZ,label='ET')
plt.plot(EvapTime,ResidualEvapBZ,label='Evap')
plt.xlabel('Time')
plt.ylabel('Climate Condition')
plt.title('Belize')
plt.legend()
plt.show()


ResidualETCB, ResidualEvapCB, EvapTime, ETtime = Residuals(Data,ETData,'Cuba','CUBAETMONTHLY')
plt.plot(ETtime,ResidualETCB,label='ET')
plt.plot(EvapTime,ResidualEvapCB,label='Evap')
plt.xlabel('Time')
plt.ylabel('Climate Condition')
plt.title('Cuba')
plt.legend()
plt.show()





'''

Belize = pd.read_excel(Data,sheet_name='Belize')
EvapAvgBZ = np.mean(Belize['Evaporation']) #average evaporation rate
ResidualEvapBZ = Belize['Evaporation']-EvapAvgBZ

BelizeET = pd.read_excel(ETData,sheet_name='BelizeET')





Cuba = pd.read_excel(Data,sheet_name='Cuba')
CubaET = pd.read_excel(ETData,sheet_name='CubaET')
EvapAvgCB = np.mean(Cuba['Evaporation']) #average evaporation rate
ResidualEvapCB = Cuba['Evaporation']-EvapAvgCB


plt.plot(Cuba['Time'],Cuba['Evaporation'],label='Evaporation')
plt.plot(Cuba['Time'],Cuba['Precipitation'],label='Precipitation')
plt.plot(CubaET['ET time'],CubaET['ET units corrected'],label='ET')
plt.legend()
plt.xlabel('Year')
plt.ylabel('Climate Condition m/month')
plt.title('Cuba')
plt.show()

plt.plot(Belize['Time'],Belize['Evaporation'],label='Evaporation')
plt.plot(Belize['Time'],Belize['Precipitation'],label='Precipitation')
plt.plot(BelizeET['Date'],BelizeET['ETunitsCorrected'],label='ET')
plt.legend()
plt.xlabel('Year')
plt.ylabel('Climate Condition m/month')
plt.title('Belize')
plt.show()
'''