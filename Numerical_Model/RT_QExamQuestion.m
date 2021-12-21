%%%%%Qualifying Exam Code
clear all
LL = 12615.6 - 0385.6; %Low altitude, low tide
LH = 12615.6 - 2099.3;%Low altitude, high tide
HL = 12615.6 - 00045.1;%High altitude, low tide
HH = 12615.6 - 0019.2;%High altitude, High tide
R=HH*10^-3; %radius of island (meters)
%% initializing space vector
dx=1; %the space model goes from one side of island to other

x=-R:dx:R; %Island length going from one side to the other
n=length(x); %initializing vector


for i = 1:n
    %y(i)=-0.0000628*((x(i)+12.6156)*(x(i)-12.6156)); %Low Altitude
    y(i)=-0.00628*((x(i)+12.6156)*(x(i)-12.6156)); %High Altitude
end

hold on
plot(x,y,'linewidth',3)
xlabel('Island Distance (km)')
ylabel('Altitude (km)')
%legend('High Altitude','Low Altitude')
set(gca,'FontSize',13)
z = find(y==0.0030);