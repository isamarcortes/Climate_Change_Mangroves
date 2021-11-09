#code used to convert KML to geopackages for area calculations
import subprocess
import glob

Files = sorted(glob.glob('/Users/isamarcortes/Desktop/Islands_in_Database/*.kml'))

def ConvertToKML(input): #function to convert kml to
    subprocess.call('ogr2ogr -f GPKG'+' '+input+'.gpkg'+' '+input+'.kml',shell=True)
    
for i in Files:
    input_list1 = i.split('.')[0]
    ConvertToKML(input_list1)
