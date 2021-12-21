hold on

%Puerto Rico
ax= [1.573	1.573	1.591	1.591	1.577	1.573];
ay= [46.27463446	46.23649078	59.74230044	59.74230044	45.72606214	46.23649078];


%Belize
bx= [1.68];
by= [91.51190476];

%Mexico
cx = [1.61];
cy=[68.49689441];

%Bahamas
dx= [0.7353];
dy=[-42.02366381];

%Venezuela
ex=[1.314	1.314];
ey=[-13.42465753	-13.42465753];


%Cuba
fx=[1.461	1.51];
fy=[50.48596851	58.77483444];


%Florida
gx=[1.403	1.403	1.3718	1.3718	1.3718	1.403	1.403	1.3718	1.3718	1.3718	1.3718	1.3718	1.3718	1.3718	1.3718	1.3718];
gy=[-0.263720599	-0.263720599	47.20804782	47.20804782	22.33561744	60.49180328	60.49180328	-2.544102639	26.53448024	26.53448024	47.20804782	47.20804782	47.20804782	47.20804782	47.20804782	47.20804782];

plot(ax,ay,'bo',bx,by,'g*',cx,cy,'+',dx,dy,'d',ex,ey,'s',fx,fy,'v',gx,gy,'v','MarkerSize',6)
xlabel('Net evaporation in 2100 (m yr^-^1)')
ylabel('Vegetated Area percent loss')
title('Year: 2100')
legend('Puerto Rico','Belize','Mexico','Bahamas','Venezuela','Cuba','Florida')
legend('boxoff')
set(gca,'FontSize',15)
box on