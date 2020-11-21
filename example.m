clear all
close all
clc

    %micrphones position
    mics=[
    0,0.20,0.34;
    -0.32, 0,0;
    0.32, 0,0;
    0,0.62, 0;
        ];
    
    fs=41000;% sampling frequency [Hz]
    
    t=1;%time [s] -     
    
    %volume limit[x, y, z] 
    V_Min=[-5; 5; 5]; %[m]
    V_Max=[5; 5; 5];
        
%genereate a random source    
    source=V_Min + (V_Max - V_Min).*rand(3,1);  
    
    [signal]=generateSignal(fs, mics, t, source);
    
    
    
%number of points
n=4000000;
    
[sourceDeterminated]=SRP_PHAT_SRC(mics, fs, signal, n, V_Min, V_Max);


figure
plot3(source(1),source(2),source(3), 'd','MarkerSize',6,'MarkerFaceColor','blue')
hold on
plot3(sourceDeterminated(1),sourceDeterminated(2),sourceDeterminated(3), 'o','MarkerSize',6,'MarkerFaceColor','red')   
plot3(mics(:,1),mics(:,2),mics(:,3), 'x','MarkerSize',6,'Color','blue')
grid on    

[TH,PHI,d] = cart2sph(source(1),source(2),source(3));
az_source=TH*180/pi;
el_source=PHI*180/pi;


[TH,PHI] = cart2sph(sourceDeterminated(1),sourceDeterminated(2),sourceDeterminated(3));
az_SRC=TH*180/pi;
el_SRC=PHI*180/pi;
