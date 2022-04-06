#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Mon Mar 21 13:51:43 2022

@author: isamarcortes
"""

import pandas as pd 
import numpy as np 
import matplotlib.pyplot as plt


ETCuba = pd.read_excel('/Users/isamarcortes/Dropbox/Isamar/Papers_In_Prep/Paper_1/ETandECubaAndBelize.xlsx',sheet_name='CubaDataAnalysis')
ETBelize = pd.read_excel('/Users/isamarcortes/Dropbox/Isamar/Papers_In_Prep/Paper_1/ETandECubaAndBelize.xlsx',sheet_name='BelizeDataAnalysis')

#this function is specifically for E and ET data
def figures(Data,Year,ET,E,label,title):
    fig, axes = plt.subplots(1,1)
    ax = Data.plot.scatter(x=Year,y=ET,color='blue',label=label[0])
    Data.plot.scatter(x=Year,y=E,ax=ax,color='red',label=label[1])
    plt.legend()
    plt.ylabel('')
    plt.title(title)
    plt.show()
    

figures(ETCuba,'Year','ETPerYear','EvapPerYear',title= 'Cuba',label=['ET','E'])
figures(ETBelize,'Year','ETPerYear','EvapPerYear',title= 'Belize',label=['ET','E'])    