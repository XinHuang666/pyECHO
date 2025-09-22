% figure(1)
% subplot(3,2,1)
% load dipole_网格0.1mm.mat
% plot(s1,WT1,s2,WT2);
% units=['V/pC/m^' int2str(1)];
% disp(['0.1mm网格','Trans. wake, Kick=' num2str(kick) units ', Spread=' num2str(rms_kick) units]);
% title('0.1mm WT dipole')
% xlabel('s[m]');ylabel(['W_T[' units ']']);
% 
% subplot(3,2,2)
% load monpole_网格0.1mm.mat
% plot(s1,WZ1,s2,WZ2);
% disp(['0.1mm网格','Longitudinal wake, Loss=' num2str(loss) 'V/pC, Spread=' num2str(spread) 'V/pC']);
% title('0.1mm WZ monopole')
% xlabel('s[m]');ylabel('W_|_|[V/pC]');
% 
% subplot(3,2,3)
% load dipole_网格0.2mm.mat
% plot(s1,WT1,s2,WT2);
% units=['V/pC/m^' int2str(1)];
% disp(['0.2mm网格','Trans. wake, Kick=' num2str(kick) units ', Spread=' num2str(rms_kick) units]);
% title('0.2mm WT dipole')
% xlabel('s[m]');ylabel(['W_T[' units ']']);
% 
% subplot(3,2,4)
% load monpole_网格0.2mm.mat
% plot(s1,WZ1,s2,WZ2);
% disp(['0.2mm网格','Longitudinal wake, Loss=' num2str(loss) 'V/pC, Spread=' num2str(spread) 'V/pC']);
% title('0.2mm WZ monopole')
% xlabel('s[m]');ylabel('W_|_|[V/pC]');
% 
% subplot(3,2,5)
% load dipole_网格0.05mm.mat
% plot(s1,WT1,s2,WT2);
% units=['V/pC/m^' int2str(1)];
% disp(['0.05mm网格','Trans. wake, Kick=' num2str(kick) units ', Spread=' num2str(rms_kick) units]);
% title('0.05mm WT dipole')
% xlabel('s[m]');ylabel(['W_T[' units ']']);
% 
% subplot(3,2,6)
% load monpole_网格0.05mm.mat
% plot(s1,WZ1,s2,WZ2);
% disp(['0.05mm网格','Longitudinal wake, Loss=' num2str(loss) 'V/pC, Spread=' num2str(spread) 'V/pC']);
% title('0.05mm WZ monopole')
% xlabel('s[m]');ylabel('W_|_|[V/pC]');
% 
% figure(2)
% subplot(2,1,1)
% hold on
% title('Trans Convergence curve')
% matname={'dipole_网格0.2mm.mat';'dipole_网格0.1mm.mat';'dipole_网格0.05mm.mat'};
% n=size(matname,1)-1;
% bcp1=zeros(n,1);% biggest change point
% bcp2=zeros(n,1);
% for i = 1:n
%     load(cell2mat(matname(i)))
%     s01=s1;WT01=WT1;s02=s2;WT02=WT2;
%     load(cell2mat(matname(i+1)))
%     WT01=interp1(s01,WT01,s1);
%     WT02=interp1(s02,WT02,s2);
%     bcp1(i)=max(abs(WT01-WT1));
%     bcp2(i)=max(abs(WT02-WT2));
% end
% plot(bcp1)
% plot(bcp2)
% hold off
% 
% subplot(2,1,2)
% hold on
% title('Longitudinal Convergence curve')
% matname={'monpole_网格0.2mm.mat';'monpole_网格0.1mm.mat';'monpole_网格0.05mm.mat'};
% n=size(matname,1)-1;
% bcp1=zeros(n,1);% biggest change point
% bcp2=zeros(n,1);
% for i = 1:n
%     load(cell2mat(matname(i)))
%     s01=s1;WZ01=WZ1;s02=s2;WZ02=WZ2;
%     load(cell2mat(matname(i+1)))
%     WZ01=interp1(s01,WZ01,s1);
%     WZ02=interp1(s02,WZ02,s2);
%     bcp1(i)=max(abs(WZ01-WZ1));
%     bcp2(i)=max(abs(WZ02-WZ2));
% end
% plot(bcp1)
% plot(bcp2)
% hold off

% dipole_matname={'dipole_网格0.2mm.mat';'dipole_网格0.15mm.mat';'dipole_网格0.1mm.mat';'dipole_网格0.075mm.mat';'dipole_网格0.05mm.mat'};
% monpole_matname={'monpole_网格0.2mm.mat';'monpole_网格0.15mm.mat';'monpole_网格0.1mm.mat';'monpole_网格0.075mm.mat';'monpole_网格0.05mm.mat'};
% linestyles = {'-', '--', '-.', ':', ':'};
% labels={'0.2mm','0.15mm','0.1mm','0.075mm','0.05mm'};
dipole_matname={'dipole_网格0.2mm.mat';'dipole_网格0.15mm.mat';'dipole_网格0.1mm.mat';'dipole_网格0.05mm.mat'};
monpole_matname={'monpole_网格0.2mm.mat';'monpole_网格0.15mm.mat';'monpole_网格0.1mm.mat';'monpole_网格0.05mm.mat'};
linestyles = {'-', '--', '-.', ':'};
labels={'0.2mm','0.15mm','0.1mm','0.05mm'};
mesh_size=[0.2,0.15,0.1,0.05];
n=size(dipole_matname,1);
% colors=[]
rgbTriplet = 0.01*round(100*[092 158 173;...
    210 204 161;...
    206 190 190;...
    237 177 131;...
    239 111 108]/255);
linwidth = 2;


figure(1)
%纵向
load monpole_网格0.05mm.mat
% yyaxis right
% h=plot(s1,WZ1/0.0035,'b:','LineWidth',3,'DisplayName','Bunch Profile');
% set(h, 'EdgeAlpha', 0.5);
% ylabel('Value', 'FontSize', 12, 'FontName', 'Times New Roman');
% yyaxis left
h=plot(s1,-WZ1,'k-','LineWidth',linwidth,'DisplayName','Bunch Profile');
hold on
for i=1:n
    load(monpole_matname{i})
    plot(s2,WZ2,'Color',rgbTriplet(i, :),'LineStyle',linestyles{i},'Marker','none','LineWidth',linwidth,'DisplayName',labels{i})
end
ylabel('W_|_|[V/pC]', 'FontSize', 12, 'FontName', 'Times New Roman');
xlabel('s[m]', 'FontSize', 12, 'FontName', 'Times New Roman');
legend('FontSize', 12, 'FontName', 'Times New Roman','Color','None')
set(gca, 'FontName', 'Times New Roman', 'FontSize', 11);
hold off


figure(2)
%横向
load dipole_网格0.05mm.mat
% yyaxis right
% plot(s1,WT1/0.0084,'b:','LineWidth',3,'DisplayName','Bunch Profile')
% ylabel('Value', 'FontSize', 12, 'FontName', 'Times New Roman');
% yyaxis left
plot(s1,WT1,'k-','LineWidth',linwidth,'DisplayName','Bunch Profile')
hold on
for i=1:n
    load(cell2mat(dipole_matname(i)))
    plot(s2,WT2,'Color',rgbTriplet(i, :),'LineStyle',linestyles{i},'Marker','none','LineWidth',linwidth,'DisplayName',labels{i})
end
ylabel('W_T[V/pC/m]', 'FontSize', 12, 'FontName', 'Times New Roman');
xlabel('s[m]', 'FontSize', 12, 'FontName', 'Times New Roman');
legend('FontSize', 12, 'FontName', 'Times New Roman','Color','None')
set(gca, 'FontName', 'Times New Roman', 'FontSize', 11);
hold off

figure(3)
%收敛曲线
bcp=zeros(2,n);%第一行纵向，第二行横向
load dipole_网格0.05mm.mat
load monpole_网格0.05mm.mat
s02 = s2;WT02=WT2;WZ02=WZ2;
for i = 1:n
    load(dipole_matname{i})
    load(monpole_matname{i})
    WZ2=interp1(s2,WZ2,s02);
    WT2=interp1(s2,WT2,s02);
    % bcp(1,i)=max(abs(WZ2-WZ02)./WZ02*100);
    % bcp(2,i)=max(abs(WT2-WT02)./WT02*100);
    bcp(1,i)=max(abs(WZ2-WZ02));
    bcp(2,i)=max(abs(WT2-WT02));
end
hold on
plot(mesh_size,bcp(1,:),'-*','DisplayName','Longe Monpole','LineWidth',linwidth)
plot(mesh_size,bcp(2,:),'-o','DisplayName','Trans Dipole','LineWidth',linwidth)
ylabel('\Delta_{max}', 'FontSize', 12, 'FontName', 'Times New Roman');
xlabel('Mesh Size[mm]', 'FontSize', 12, 'FontName', 'Times New Roman');
legend('FontSize', 12, 'FontName', 'Times New Roman','Color','None')
set(gca, 'FontName', 'Times New Roman', 'FontSize', 11);
set(gca, 'XDir', 'reverse'); % 将Y轴方向设置为反向
hold off

% s1=bunch(:,1)-shift;
% WT1=bunch(:,2)*K;
% s2=s-shift;
% WT2=-Wt;
% 
% s1=bunch(:,1)-shift;
% WZ1=bunch(:,2)*K;
% s2=s-shift;
% WZ2=W;
