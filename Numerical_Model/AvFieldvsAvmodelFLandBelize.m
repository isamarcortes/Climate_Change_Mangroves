clear all;
x=0:0.1:7;

n=length(x);
y=zeros(1,n);
ya=zeros(1,n);

y=0.9195*x;
ya=x;
    
px= [6.474153739	5.471081849	4.464221198	5.382132359	5.050453228	4.890113494	4.553118092	5.134655142	5.735831153	5.402096233	4.877348306	5.081527326	5.025756315	4.869489872	5.867645412	5.291728393	4.796248143]
py= [6.427138124	4.946804784	3.833222944	4.949849512	4.609602196	4.407243412	4.367319145	5.001088713	4.418311147	5.226184115	4.169475849	4.547769053	4.614186391	4.533648414	5.801995809	5.17659811	3.872904005]

hold on
plot(x,y,'-.r',x,ya,'b',px,py,'ro')
xlabel('Log (Av) field')
ylabel('Log (Av) model')
title('Model versus Actual Av values')
legend('Regression Line','y=x')
legend boxoff

axis([2 7 2 7])