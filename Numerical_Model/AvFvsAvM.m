clear all;
x=0:0.1:7;

n=length(x);
y=zeros(1,n);
ya=zeros(1,n);

y=0.9195*x;
ya=x;


prx = [3.928754202   3.855761372	4.230806428	4.374748346	4.830595084	4.929480234];	
pry = [3.92595287   3.800772792	4.377675359	4.303668811	4.657508061	5.259551265];	

bzx =    [6.474153739];	
bzy =    [6.570011943];	

mxx=[6.078319403];
mxy=[5.656011391];

flx =[5.471081849	4.464221198	5.382132359	5.050453228	4.890113494	4.553118092 5.134655142	5.735831153	5.402096233	4.877348306	5.081527326	5.025756315	4.869489872	5.867645412	5.291728393	4.796248143];	
fly = [5.197300679	4.140134179	5.09066501	4.932017593	4.83193978	4.508134643 5.141904212	4.559126646	5.366999614	4.310291347	4.688584551	4.755001889	4.674463913	5.976299592	5.345850131	4.013719504];    

bhx = [5.763029458];
bhy = [5.718789425];

vzx = [5.207437773	5.564233922];
vzy = [5.034271194	5.607650028];

cbx = [6.111606922	4.629440182];
cby = [6.304730688	4.516506788];


hold on
plot(x,ya,'k',prx,pry,'bo',flx,fly,'kx',bzx,bzy,'m<',mxx,mxy,'r*',vzx,vzy,'bv',cbx,cby,'rs',bhx,bhy,'cd','markersize',12,'linewidth',2)
%plot(x,ya,'b',pO,Po,'bo',pB,Pb,'r+')
xlabel('\itA_{v, field} (m^2)')
ylabel('\itA_{v, model} (m^2)')
%title('Model versus Field Vegetated Area values')
legend('y=x','Puerto Rico','Florida','Belize','Mexico','Venezuela','Cuba','Bahamas')
 %legend('y=x','Oceanic Islands','Islands in Bays')
 legend boxoff
 set(gca,'Fontsize',15)
 %box on

axis([2 7 2 7])
