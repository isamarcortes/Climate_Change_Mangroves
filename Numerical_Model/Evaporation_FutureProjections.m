ncfile = 'FutureEvap.nc' ;
lon = ncread(ncfile,'lon') ; nx = length(lon) ; 
lat = ncread(ncfile,'lat') ; ny = length(lat) ; 
c=transpose(lon);
time = ncread(ncfile,'time') ;
for i = 1:length(time)
    z = ncread(ncfile,'evs',[1 1 i],[nx ny 1]) ;
    pcolor(c,lat,z) ; 
    shading interp 
    drawnow
end