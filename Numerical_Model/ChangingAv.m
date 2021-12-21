I1999 = imread('/Users/isamarcortes/Downloads/drive-download-20210202T155613Z-001/1999Classification.tif');
I2000 = imread('/Users/isamarcortes/Downloads/drive-download-20210202T155613Z-001/2000Classification.tif');
I2001 = imread('/Users/isamarcortes/Downloads/drive-download-20210202T155613Z-001/2001 Classification.tif');
I2002 = imread('/Users/isamarcortes/Downloads/drive-download-20210202T155613Z-001/2002 Classification.tif');
I2003 = imread('/Users/isamarcortes/Downloads/drive-download-20210202T155613Z-001/2003 Classification.tif');
I2004 = imread('/Users/isamarcortes/Downloads/drive-download-20210202T155613Z-001/2004 Classification.tif');
I2005 = imread('/Users/isamarcortes/Downloads/drive-download-20210202T155613Z-001/2005 Classification.tif');
I2006 = imread('/Users/isamarcortes/Downloads/drive-download-20210202T155613Z-001/2006 Classification.tif');
I2007 = imread('/Users/isamarcortes/Downloads/drive-download-20210202T155613Z-001/2007 Classification.tif');
I2008 = imread('/Users/isamarcortes/Downloads/drive-download-20210202T155613Z-001/2008 Classification.tif');
I2009 = imread('/Users/isamarcortes/Downloads/drive-download-20210202T155613Z-001/2009 Classification.tif');
I2010 = imread('/Users/isamarcortes/Downloads/drive-download-20210202T155613Z-001/2010 Classification.tif');
I2011 = imread('/Users/isamarcortes/Downloads/drive-download-20210202T155613Z-001/2011 Classification.tif');
I2012 = imread('/Users/isamarcortes/Downloads/drive-download-20210202T155613Z-001/2012 Classification.tif');
I2013 = imread('/Users/isamarcortes/Downloads/drive-download-20210202T155613Z-001/2013 Classification.tif');
I2014 = imread('/Users/isamarcortes/Downloads/drive-download-20210202T155613Z-001/2014 Classification.tif');
I2015 = imread('/Users/isamarcortes/Downloads/drive-download-20210202T155613Z-001/2015 Classification.tif');
I2016 = imread('/Users/isamarcortes/Downloads/drive-download-20210202T155613Z-001/2016 Classification.tif');
I2017 = imread('/Users/isamarcortes/Downloads/drive-download-20210202T155613Z-001/2017 Classification.tif');



figure (1)
h = pcolor(I1999);
set(h, 'EdgeColor', 'none');
colorbar();
PCI1999 = sum(I1999(:) == 1); %pixel count 
area1999 = PCI1999 * 900; 

figure (2)
h = pcolor(I2000);
set(h, 'EdgeColor', 'none');
colorbar();
PCI2000 = sum(I2000(:) == 1); %pixel count 
area2000 = PCI2000 * 900; 

figure (3)
h = pcolor(I2001);
set(h, 'EdgeColor', 'none');
colorbar();
PCI2001 = sum(I2001(:) == 1);
area2001 = PCI2001 * 900; 

figure (4)
h = pcolor(I2002);
set(h, 'EdgeColor', 'none');
colorbar();
PCI2002 = sum(I2002(:) == 1);
area2002 = PCI2002 * 900; 

figure (5)
h = pcolor(I2003);
set(h, 'EdgeColor', 'none');
colorbar();
PCI2003 = sum(I2003(:) == 1);
area2003 = PCI2003 * 900; 

figure (6)
h = pcolor(I2004);
set(h, 'EdgeColor', 'none');
colorbar();
PCI2004 = sum(I2004(:) == 1);
area2004 = PCI2004 * 900; 

figure (7)
h = pcolor(I2005);
set(h, 'EdgeColor', 'none');
colorbar();
PCI2005 = sum(I2005(:) == 1);
area2005 = PCI2005 * 900; 

figure (8)
h = pcolor(I2006);
set(h, 'EdgeColor', 'none');
colorbar();
PCI2006 = sum(I2006(:) == 1);
area2006 = PCI2006 * 900; 

figure (9)
h = pcolor(I2007);
set(h, 'EdgeColor', 'none');
colorbar();
PCI2007 = sum(I2007(:) == 1);
area2007 = PCI2007 * 900; 

figure (10)
h = pcolor(I2008);
set(h, 'EdgeColor', 'none');
colorbar();
PCI2008 = sum(I2008(:) == 1);
area2008 = PCI2008 * 900; 

figure (11)
h = pcolor(I2009);
set(h, 'EdgeColor', 'none');
colorbar();
PCI2009 = sum(I2009(:) == 1);
area2009 = PCI2009 * 900; 

figure (12)
h = pcolor(I2010);
set(h, 'EdgeColor', 'none');
colorbar();
PCI2010 = sum(I2010(:) == 1);
area2010 = PCI2010 * 900; 

figure (13)
h = pcolor(I2011);
set(h, 'EdgeColor', 'none');
colorbar();
PCI2011 = sum(I2011(:) == 1);
area2011 = PCI2011 * 900; 

figure (14)
h = pcolor(I2012);
set(h, 'EdgeColor', 'none');
colorbar();
PCI2012 = sum(I2012(:) == 1);
area2012 = PCI2012 * 900; 

figure (15)
h = pcolor(I2013);
set(h, 'EdgeColor', 'none');
colorbar();
PCI2013 = sum(I2013(:) == 1);
area2013 = PCI2013 * 900; 

figure (16)
h = pcolor(I2014);
set(h, 'EdgeColor', 'none');
colorbar();
PCI2014 = sum(I2014(:) == 1);
area2014 = PCI2014 * 900; 

figure (17)
h = pcolor(I2015);
set(h, 'EdgeColor', 'none');
colorbar();
PCI2015 = sum(I2015(:) == 1);
area2015 = PCI2015 * 900; 

figure (18)
h = pcolor(I2016);
set(h, 'EdgeColor', 'none');
colorbar();
PCI2016 = sum(I2016(:) == 1);
area2016 = PCI2016 * 900; 

figure (19)
h = pcolor(I2017);
set(h, 'EdgeColor', 'none');
colorbar();
PCI2017 = sum(I2017(:) == 1);
area2017 = PCI2017 * 900; 

figure (1)
time = [1999 2000 2001 2002 2003 2004 2005 2006 2007 2008 2009 2010 2011 2012 2013 2014 2015 2016 2017];
Av = [area1999 area2000 area2001 area2002 area2003 area2004 area2005 area2006 area2007 area2008 area2009 area2010 area2011 area2012 area2013 area2014 area2015 area2016 area2017];
plot(time, Av,'linewidth',4);
xlabel('Time');
ylabel('Vegetated Area (m^2)');
title('Cuba Vegetation Change');