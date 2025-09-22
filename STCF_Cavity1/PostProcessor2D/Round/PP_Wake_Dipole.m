%Kick Calculation
clear;close all;
% dir='../../ECHO2D/round/';
% dir='../../ECHO2D/STCF_Cavity_网格0.1mm/';
% dir='../../ECHO2D/STCF_Cavity_网格0.2mm/';
% dir='../../ECHO2D/STCF_Cavity_网格0.05mm/';
% dir='../../ECHO2D/STCF_Cavity_网格0.15mm/';
% dir='../../ECHO2D/STCF_Cavity_网格0.075mm/';
disp(['处理',dir])
filename='wakeL_01.txt';
path('D:\Program Files (x86)\ECHO2D_v3.5\ECHO2D_v3_5\MatLib4ECHO',path);
mode=1;
w=load([dir filename]);
Iz=load([dir 'Iz0.txt']); % Iz/c
hr=w(1,1);
offset=w(1,2);
sigma=w(2,2);
dy=(offset+0.5)*hr;

W=w(3:end,2)*1e-3/dy^2;
s=w(3:end,1);ns=length(s);

bunch(:,1)=Iz(:,1);
bunch(:,2)=Iz(:,offset+3)*1e9; % -> ro
B=interp1(bunch(:,1),bunch(:,2),s,'linear',0);

out(1:ns,1:2)=0;hs=s(2)-s(1); shift=5*sigma-0.5*hs;
out(:,1)=(s-shift)*100; out(:,2)=W;
[loss,spread]=LossShape([s B],[s W])
filename=[dir 'wakeL_dipole.dat'];
save(filename,'out','-ascii');

h=s(2)-s(1);
Wt=IntegrTr(h,W)';
out(:,2)=-Wt;
[kick,rms_kick]=LossShape([s B],[s Wt])
filename=[dir 'wakeT_dipole.dat'];
save(filename,'out', '-ascii');
subplot(2,1,1);
K=max(abs(W))/max(abs(bunch(:,2)));
plot(bunch(:,1)-shift,bunch(:,2)*K,s-shift,W);
units='V/pC';
if mode>0, units=['V/pC/m^' int2str(2*mode)]; end;
title(['Long. wake, Loss=' num2str(loss) units ', Spread=' num2str(spread) units]);
xlabel('s[m]');ylabel(['W_|_|[' units ']']);
subplot(2,1,2);
K=max(abs(Wt))/max(abs(bunch(:,2)));
plot(bunch(:,1)-shift,bunch(:,2)*K,s-shift,-Wt);
units='V/pC';
if mode>0, units=['V/pC/m^' int2str(2*mode-1)]; end;
title(['Trans. wake, Kick=' num2str(kick) units ', Spread=' num2str(rms_kick) units]);
xlabel('s[m]');ylabel(['W_T[' units ']']);

