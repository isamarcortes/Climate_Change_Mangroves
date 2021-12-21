I1999 = imread('/Users/isamarcortes/Downloads/Classification_Through_Time/1999.tif');
I2000 = imread('/Users/isamarcortes/Downloads/Classification_Through_Time/2000.tif');
I2001 = imread('/Users/isamarcortes/Downloads/Classification_Through_Time/2001.tif');
I2002 = imread('/Users/isamarcortes/Downloads/Classification_Through_Time/2002.tif');
I2003 = imread('/Users/isamarcortes/Downloads/Classification_Through_Time/2003.tif');
I2004 = imread('/Users/isamarcortes/Downloads/Classification_Through_Time/2004.tif');
I2005 = imread('/Users/isamarcortes/Downloads/Classification_Through_Time/2005.tif');
I2006 = imread('/Users/isamarcortes/Downloads/Classification_Through_Time/2006.tif');
I2007 = imread('/Users/isamarcortes/Downloads/Classification_Through_Time/2007.tif');
I2008 = imread('/Users/isamarcortes/Downloads/Classification_Through_Time/2008.tif');
I2009 = imread('/Users/isamarcortes/Downloads/Classification_Through_Time/2009.tif');
I2010 = imread('/Users/isamarcortes/Downloads/Classification_Through_Time/2010.tif');
I2011 = imread('/Users/isamarcortes/Downloads/Classification_Through_Time/2011.tif');
I2012 = imread('/Users/isamarcortes/Downloads/Classification_Through_Time/2012.tif');
I2013 = imread('/Users/isamarcortes/Downloads/Classification_Through_Time/2013.tif');
I2014 = imread('/Users/isamarcortes/Downloads/Classification_Through_Time/2014.tif');
I2015 = imread('/Users/isamarcortes/Downloads/Classification_Through_Time/2015.tif');
I2016 = imread('/Users/isamarcortes/Downloads/Classification_Through_Time/2016.tif');
I2017 = imread('/Users/isamarcortes/Downloads/Classification_Through_Time/2017.tif');


 figure (1)
 h = pcolor(I1999);
 set(h, 'EdgeColor', 'none');
 colorbar();
 PCI1999 = sum(I1999(:) == 1); %pixel count 
 area1999 = PCI1999 * 900; 
 BPCI1999 = sum(I1999(:) == 2); %pixel count 
 Barea1999 = BPCI1999 * 900; 
 
 
figure (2)
h = pcolor(I2000);
set(h, 'EdgeColor', 'none');
colorbar();
PCI2000 = sum(I2000(:) == 1); %pixel count 
area2000 = PCI2000 * 900; 
BPCI2000 = sum(I2000(:) == 2); %pixel count 
Barea2000 = BPCI2000 * 900; 



figure (3)
h = pcolor(I2001);
set(h, 'EdgeColor', 'none');
colorbar();
PCI2001 = sum(I2001(:) == 1);
area2001 = PCI2001 * 900; 
 BPCI2001 = sum(I2001(:) == 2); %pixel count 
 Barea2001 = BPCI2001 * 900; 

figure (4)
h = pcolor(I2002);
set(h, 'EdgeColor', 'none');
colorbar();
PCI2002 = sum(I2002(:) == 1);
area2002 = PCI2002 * 900; 
 BPCI2002 = sum(I2002(:) == 2); %pixel count 
 Barea2002 = BPCI2002 * 900; 

figure (5)
h = pcolor(I2003);
set(h, 'EdgeColor', 'none');
colorbar();
PCI2003 = sum(I2003(:) == 1);
area2003 = PCI2003 * 900; 
 BPCI2003 = sum(I2003(:) == 2); %pixel count 
 Barea2003 = BPCI2003 * 900; 

figure (6)
h = pcolor(I2004);
set(h, 'EdgeColor', 'none');
colorbar();
PCI2004 = sum(I2004(:) == 1);
area2004 = PCI2004 * 900; 
 BPCI2004 = sum(I2004(:) == 2); %pixel count 
 Barea2004 = BPCI2004 * 900; 

figure (7)
h = pcolor(I2005);
set(h, 'EdgeColor', 'none');
colorbar();
PCI2005 = sum(I2005(:) == 1);
area2005 = PCI2005 * 900; 
 BPCI2005 = sum(I2005(:) == 2); %pixel count 
 Barea2005 = BPCI2005 * 900; 

figure (8)
h = pcolor(I2006);
set(h, 'EdgeColor', 'none');
colorbar();
PCI2006 = sum(I2006(:) == 1);
area2006 = PCI2006 * 900; 
 BPCI2006 = sum(I2006(:) == 2); %pixel count 
 Barea2006 = BPCI2006 * 900; 

figure (9)
h = pcolor(I2007);
set(h, 'EdgeColor', 'none');
colorbar();
PCI2007 = sum(I2007(:) == 1);
area2007 = PCI2007 * 900; 
 BPCI2007 = sum(I2007(:) == 2); %pixel count 
 Barea2007 = BPCI2007 * 900; 

figure (10)
h = pcolor(I2008);
set(h, 'EdgeColor', 'none');
colorbar();
PCI2008 = sum(I2008(:) == 1);
area2008 = PCI2008 * 900; 
 BPCI2008 = sum(I2008(:) == 2); %pixel count 
 Barea2008 = BPCI2008 * 900; 

figure (11)
h = pcolor(I2009);
set(h, 'EdgeColor', 'none');
colorbar();
PCI2009 = sum(I2009(:) == 1);
area2009 = PCI2009 * 900; 
 BPCI2009 = sum(I2009(:) == 2); %pixel count 
 Barea2009 = BPCI2009 * 900; 

figure (12)
h = pcolor(I2010);
set(h, 'EdgeColor', 'none');
colorbar();
PCI2010 = sum(I2010(:) == 1);
area2010 = PCI2010 * 900; 
 BPCI2010 = sum(I2010(:) == 2); %pixel count 
 Barea2010 = BPCI2010 * 900; 

figure (13)
h = pcolor(I2011);
set(h, 'EdgeColor', 'none');
colorbar();
PCI2011 = sum(I2011(:) == 1);
area2011 = PCI2011 * 900; 
 BPCI2011 = sum(I2011(:) == 2); %pixel count 
 Barea2011 = BPCI2011 * 900; 

figure (14)
h = pcolor(I2012);
set(h, 'EdgeColor', 'none');
colorbar();
PCI2012 = sum(I2012(:) == 1);
area2012 = PCI2012 * 900; 
 BPCI2012 = sum(I2012(:) == 2); %pixel count 
 Barea2012 = BPCI2012 * 900; 

figure (15)
h = pcolor(I2013);
set(h, 'EdgeColor', 'none');
colorbar();
PCI2013 = sum(I2013(:) == 1);
area2013 = PCI2013 * 900; 
 BPCI2013 = sum(I2013(:) == 2); %pixel count 
 Barea2013 = BPCI2013 * 900; 

figure (16)
h = pcolor(I2014);
set(h, 'EdgeColor', 'none');
colorbar();
PCI2014 = sum(I2014(:) == 1);
area2014 = PCI2014 * 900; 
 BPCI2014 = sum(I2014(:) == 2); %pixel count 
 Barea2014 = BPCI2014 * 900; 

figure (17)
h = pcolor(I2015);
set(h, 'EdgeColor', 'none');
colorbar();
PCI2015 = sum(I2015(:) == 1);
area2015 = PCI2015 * 900; 
 BPCI2015 = sum(I2015(:) == 2); %pixel count 
 Barea2015 = BPCI2015 * 900; 

figure (18)
h = pcolor(I2016);
set(h, 'EdgeColor', 'none');
colorbar();
PCI2016 = sum(I2016(:) == 1);
area2016 = PCI2016 * 900; 
 BPCI2016 = sum(I2016(:) == 2); %pixel count 
 Barea2016 = BPCI2016 * 900; 

figure (19)
h = pcolor(I2017);
set(h, 'EdgeColor', 'none');
colorbar();
PCI2017 = sum(I2017(:) == 1);
area2017 = PCI2017 * 900; 
 BPCI2017 = sum(I2017(:) == 2); %pixel count 
 Barea2017 = BPCI2017 * 900; 
hold on

figure (1)

time = [1999 2000 2001 2002 2003 2004 2005 2006 2007 2008 2009 2010 2011 2012 2013 2014 2015 2016 2017];
AvR = [area1999 area2000 area2001 area2002 area2003 area2004 area2005 area2006 area2007 area2008 area2009 area2010 area2011 area2012 area2013 area2014 area2015 area2016 area2017];
AvB = [Barea1999 Barea2000 Barea2001 Barea2002 Barea2003 Barea2004 Barea2005 Barea2006 Barea2007 Barea2008 Barea2009 Barea2010 Barea2011 Barea2012 Barea2013 Barea2014 Barea2015 Barea2016 Barea2017];


plot(time, AvR,'linewidth',4,'color','r');
plot(time, AvB,'linewidth',4,'color','k');
xlabel('Time');
ylabel('Vegetated Area (m^2)');
title('Mexico Vegetation Change');
legend('Red Mangrove','Black Mangrove');