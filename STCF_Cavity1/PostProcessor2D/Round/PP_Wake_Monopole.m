%Kick Calculation
clear;close all
path('D:\Program Files (x86)\ECHO2D_v3.5\ECHO2D_v3_5\MatLib4ECHO',path);
PhysConsts;
c = 299792458;
% dir='../../ECHO2D/round/';
% dir='../../ECHO2D/STCF_Cavity_网格0.1mm/';
dir='../../ECHO2D/STCF_Cavity_网格0.2mm/';
% dir='../../ECHO2D/STCF_Cavity_网格0.05mm/';
% dir='../../ECHO2D/STCF_Cavity_网格0.15mm/';
% dir='../../ECHO2D/STCF_Cavity_网格0.075mm/';
disp(['处理',dir])
filename='wakeL_00.txt';
w=load([dir filename]);
Iz=load([dir 'Iz0.txt']); % Iz/c
hr=w(1,1);
offset=w(1,2);
dy=(offset+0.5)*hr;
sigma=w(2,2);

W=w(3:end,2)*1e-3;             %V/nC->V/pC
s=w(3:end,1);ns=length(s);
bunch(:,1)=Iz(:,1);
bunch(:,2)=Iz(:,offset+3)*1e9; 
B=interp1(bunch(:,1),bunch(:,2),s,'linear',0);
[loss,spread]=LossShape([s B],[s W]);

out(1:ns,1:2)=0; hs=s(2)-s(1); shift=5*sigma-0.5*hs;
out(:,1)=(s-shift)*100; out(:,2)=W;
filename=[dir 'wakeL_monopole.dat'];
save(filename,'out','-ascii');
K=max(abs(W))/max(abs(bunch(:,2)));
plot(bunch(:,1)-shift,bunch(:,2)*K,s-shift,W);
title(['Longitudinal wake, Loss=' num2str(loss) 'V/pC, Spread=' num2str(spread) 'V/pC']);
xlabel('s[m]');ylabel('W_|_|[V/pC]');
