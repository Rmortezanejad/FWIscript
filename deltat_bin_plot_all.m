
%len=length(data)


for j=1:48
    

numshot=j-1

isource=num2str(numshot,'%06d');

dirdt01name= ['../deltat/deltat_01/',isource];
dirdt09name= ['../deltat/deltat_15/',isource];



nr=49;
np=12000;

taper=load([dirdt01name,'/window_env']);
%dt1=reshape(taper(:,2),nr,4);
dt1=taper(:,1);
taper=load([dirdt09name,'/window_env']);
%dt2=reshape(taper(:,2),nr,4);
dt2=taper(:,1);




[a b]=size(dt1)




% k=0
% misfit1=0
% 
% for i=1:a
%     k=k+1;
%     if abs(dt1(i))>0.001
%         dt1(i)=0;
%         k=k-1;
%     end        
%     misfit1=misfit1+dt1(i)^2;      
% end
% misinit(j,1)=misfit1/k;
% 
% 
% 
% k=0
% misfit1=0
% for i=1:a
%     k=k+1;
%     if abs(dt2(i))>0.001
%         dt2(i)=0;
%         k=k-1;
%     end        
%     misfit1=misfit1+dt2(i)^2;      
% end
% misfinal(j,1)=misfit1/k;


dtinit=reshape(dt1,nr,7);
dtbin1(j,:)=dtinit(:,2);
dtbin2(j,:)=dtinit(:,3);
dtbin3(j,:)=dtinit(:,4);
dtbin4(j,:)=dtinit(:,5);
dtbin5(j,:)=dtinit(:,6);
dtbin6(j,:)=dtinit(:,7);
dtbin7(j,:)=dt1(nr+1:end);


dttrue=reshape(dt2,nr,7);
dtbin11(j,:)=dttrue(:,2);
dtbin22(j,:)=dttrue(:,3);
dtbin33(j,:)=dttrue(:,4);
dtbin44(j,:)=dttrue(:,5);
dtbin55(j,:)=dttrue(:,6);
dtbin66(j,:)=dttrue(:,7);
dtbin77(j,:)=dt2(nr+1:end);

end
xbin=[-4:0.2:4];



titlename='Period:25-32s';
fig=figure(1)
data=dtbin1;
[a b]=size(data);
deltat=reshape(data,a*b,1);
s1=deltat;
k=0; 
for i=1:length(s1)
    
   if abs(s1(i))>0.001       
       k=k+1;
       snew(k)=s1(i);
   end
end
H1=snew;

hist(snew,xbin)
hold on
h = findobj(gca,'Type','patch');
set(get(gca,'child'),'FaceColor','none','EdgeColor','r','LineWidth',2);
dt_mean=mean(abs(H1));
dt_delta=std(abs(H1));
text(-4,190,'Init:');
text(-4,180,['dt=',num2str(dt_mean),'+',num2str(dt_delta),'s']);
xlim([-4,4])


data=dtbin11;
[a b]=size(data);
deltat=reshape(data,a*b,1);
s1=deltat;
k=0; 
for i=1:length(s1)
    
   if abs(s1(i))>0.001       
       k=k+1;
       snew(k)=s1(i);
   end
end

H2=snew;

%%
hist(snew,xbin)

h = findobj(gca,'Type','patch');

set(h,'facealpha',0.25);

dt_mean=mean(abs(H2));
dt_delta=std(abs(H2));
text(3,190,'target:');
text(2,180,['dt=',num2str(dt_mean),'+',num2str(dt_delta),'s']);
xlim([-4,4])



title(titlename)
xlabel('DT')
ylabel('Num. of windows') 
saveas(fig,titlename,'pdf')
clear h
%%
titlename='Period:20-25s';
fig=figure(2)
data=dtbin2;
[a b]=size(data);
deltat=reshape(data,a*b,1);
s1=deltat;
k=0; 
for i=1:length(s1)
    
   if abs(s1(i))>0.001       
       k=k+1;
       snew(k)=s1(i);
   end
end
H1=snew;
hold on
%%
hist(snew,xbin)

h = findobj(gca,'Type','patch');
set(get(gca,'child'),'FaceColor','none','EdgeColor','r','LineWidth',2);
dt_mean=mean(abs(H1));
dt_delta=std(abs(H1));
text(-4,190,'Init:');
text(-4,180,['dt=',num2str(dt_mean),'+',num2str(dt_delta),'s']);
xlim([-4,4])


%%
data=dtbin22;
[a b]=size(data);
deltat=reshape(data,a*b,1);
s1=deltat;
k=0; 
for i=1:length(s1)
    
   if abs(s1(i))>0.001       
       k=k+1;
       snew(k)=s1(i);
   end
end

H2=snew;

%%
hist(snew,xbin)

h = findobj(gca,'Type','patch');

set(h,'facealpha',0.25);

dt_mean=mean(abs(H2));
dt_delta=std(abs(H2));
text(3,190,'target:');
text(2,180,['dt=',num2str(dt_mean),'+',num2str(dt_delta),'s']);
xlim([-4,4])



title(titlename)
xlabel('DT')
ylabel('Num. of windows') 
saveas(fig,titlename,'pdf')
clear h
%%


%%
titlename='Period:15-20s';
fig=figure(3)
data=dtbin3;
[a b]=size(data);
deltat=reshape(data,a*b,1);
s1=deltat;
k=0; 
for i=1:length(s1)
    
   if abs(s1(i))>0.001       
       k=k+1;
       snew(k)=s1(i);
   end
end
H1=snew;

%%
hist(snew,xbin)
hold on
h = findobj(gca,'Type','patch');
set(get(gca,'child'),'FaceColor','none','EdgeColor','r','LineWidth',2);
dt_mean=mean(abs(H1));
dt_delta=std(abs(H1));
text(-4,190,'Init:');
text(-4,180,['dt=',num2str(dt_mean),'+',num2str(dt_delta),'s']);
xlim([-4,4])


%%
data=dtbin33;
[a b]=size(data);
deltat=reshape(data,a*b,1);
s1=deltat;
k=0; 
for i=1:length(s1)
    
   if abs(s1(i))>0.001       
       k=k+1;
       snew(k)=s1(i);
   end
end

H2=snew;

%%
hist(snew,xbin)

h = findobj(gca,'Type','patch');

set(h,'facealpha',0.25);

dt_mean=mean(abs(H2));
dt_delta=std(abs(H2));
text(3,190,'target:');
text(2,180,['dt=',num2str(dt_mean),'+',num2str(dt_delta),'s']);
xlim([-4,4])



title(titlename)
xlabel('DT')
ylabel('Num. of windows') 
saveas(fig,titlename,'pdf')
clear h



%%
titlename='Period:10-15s';
fig=figure(4)
data=dtbin4;
[a b]=size(data);
deltat=reshape(data,a*b,1);
s1=deltat;
k=0; 
for i=1:length(s1)
    
   if abs(s1(i))>0.001       
       k=k+1;
       snew(k)=s1(i);
   end
end
H1=snew;

%%
hist(snew,xbin)
hold on
h = findobj(gca,'Type','patch');
set(get(gca,'child'),'FaceColor','none','EdgeColor','r','LineWidth',2);
dt_mean=mean(abs(H1));
dt_delta=std(abs(H1));
text(-4,190,'Init:');
text(-4,180,['dt=',num2str(dt_mean),'+',num2str(dt_delta),'s']);
xlim([-4,4])


%%
data=dtbin44;
[a b]=size(data);
deltat=reshape(data,a*b,1);
s1=deltat;
k=0; 
for i=1:length(s1)
    
   if abs(s1(i))>0.001       
       k=k+1;
       snew(k)=s1(i);
   end
end

H2=snew;

%%
hist(snew,xbin)

h = findobj(gca,'Type','patch');

set(h,'facealpha',0.25);

dt_mean=mean(abs(H2));
dt_delta=std(abs(H2));
text(3,190,'target:');
text(2,180,['dt=',num2str(dt_mean),'+',num2str(dt_delta),'s']);
xlim([-4,4])



title(titlename)
xlabel('DT')
ylabel('Num. of windows') 
saveas(fig,titlename,'pdf')
clear h




%%
titlename='Period:7-10s';
fig=figure(5)
data=dtbin5;
[a b]=size(data);
deltat=reshape(data,a*b,1);
s1=deltat;
k=0; 
for i=1:length(s1)
    
   if abs(s1(i))>0.001       
       k=k+1;
       snew(k)=s1(i);
   end
end
H1=snew;

%%
hist(snew,xbin)
hold on
h = findobj(gca,'Type','patch');
set(get(gca,'child'),'FaceColor','none','EdgeColor','r','LineWidth',2);
dt_mean=mean(abs(H1));
dt_delta=std(abs(H1));
text(-4,190,'Init:');
text(-4,180,['dt=',num2str(dt_mean),'+',num2str(dt_delta),'s']);
xlim([-4,4])


%%
data=dtbin55;
[a b]=size(data);
deltat=reshape(data,a*b,1);
s1=deltat;
k=0; 
for i=1:length(s1)
    
   if abs(s1(i))>0.001       
       k=k+1;
       snew(k)=s1(i);
   end
end

H2=snew;

%%
hist(snew,xbin)

h = findobj(gca,'Type','patch');

set(h,'facealpha',0.25);

dt_mean=mean(abs(H2));
dt_delta=std(abs(H2));
text(3,190,'target:');
text(2,180,['dt=',num2str(dt_mean),'+',num2str(dt_delta),'s']);
xlim([-4,4])



title(titlename)
xlabel('DT')
ylabel('Num. of windows') 
saveas(fig,titlename,'pdf')
clear h



%%
titlename='Period:5-7s';
fig=figure(6)
data=dtbin6;
[a b]=size(data);
deltat=reshape(data,a*b,1);
s1=deltat;
k=0; 
for i=1:length(s1)
    
   if abs(s1(i))>0.001       
       k=k+1;
       snew(k)=s1(i);
   end
end
H1=snew;
hold on
%%
hist(snew,xbin)

h = findobj(gca,'Type','patch');
set(get(gca,'child'),'FaceColor','none','EdgeColor','r','LineWidth',2);
dt_mean=mean(abs(H1));
dt_delta=std(abs(H1));
text(-4,190,'Init:');
text(-4,180,['dt=',num2str(dt_mean),'+',num2str(dt_delta),'s']);
xlim([-4,4])


%%
data=dtbin66;
[a b]=size(data);
deltat=reshape(data,a*b,1);
s1=deltat;
k=0; 
for i=1:length(s1)
    
   if abs(s1(i))>0.001       
       k=k+1;
       snew(k)=s1(i);
   end
end

H2=snew;

%%
hist(snew,xbin)

h = findobj(gca,'Type','patch');

set(h,'facealpha',0.25);

dt_mean=mean(abs(H2));
dt_delta=std(abs(H2));
text(3,190,'target:');
text(2,180,['dt=',num2str(dt_mean),'+',num2str(dt_delta),'s']);
xlim([-4,4])



title(titlename)
xlabel('DT')
ylabel('Num. of windows') 
saveas(fig,titlename,'pdf')
clear h



data=dtbin66;
[a b]=size(data);
deltat=reshape(data,a*b,1);
s1=deltat;
k=0; 
for i=1:length(s1)
    
   if abs(s1(i))>0.001       
       k=k+1;
       snew(k)=s1(i);
   end
end

H2=snew;

%%
hist(snew,xbin)

h = findobj(gca,'Type','patch');

set(h,'facealpha',0.25);

dt_mean=mean(abs(H2));
dt_delta=std(abs(H2));
text(3,190,'target:');
text(2,180,['dt=',num2str(dt_mean),'+',num2str(dt_delta),'s']);
xlim([-4,4])



title(titlename)
xlabel('DT')
ylabel('Num. of windows') 
saveas(fig,titlename,'pdf')
clear h


titlename='Period:All';
fig=figure(7)
data=dtbin7;
[a b]=size(data);
deltat=reshape(data,a*b,1);
s1=deltat;
k=0; 
for i=1:length(s1)
    
   if abs(s1(i))>0.001       
       k=k+1;
       snew(k)=s1(i);
   end
end
H1=snew;
hold on
%%
hist(snew,xbin)

h = findobj(gca,'Type','patch');
set(get(gca,'child'),'FaceColor','none','EdgeColor','r','LineWidth',2);
dt_mean=mean(abs(H1));
dt_delta=std(abs(H1));
text(-4,190,'Init:');
text(-4,180,['dt=',num2str(dt_mean),'+',num2str(dt_delta),'s']);
xlim([-4,4])


%%
data=dtbin77;
[a b]=size(data);
deltat=reshape(data,a*b,1);
s1=deltat;
k=0; 
for i=1:length(s1)
    
   if abs(s1(i))>0.001       
       k=k+1;
       snew(k)=s1(i);
   end
end

H2=snew;

%%
hist(snew,xbin)

h = findobj(gca,'Type','patch');

set(h,'facealpha',0.25);

dt_mean=mean(abs(H2));
dt_delta=std(abs(H2));
text(3,190,'target:');
text(2,180,['dt=',num2str(dt_mean),'+',num2str(dt_delta),'s']);
xlim([-4,4])



title(titlename)
xlabel('DT')
ylabel('Num. of windows') 
saveas(fig,titlename,'pdf')
clear h





close all



% fig=figure(1)
% plot(misinit(:,1),'r.','markersize',20)
% hold on
% plot(misfinal(:,1),'k.','markersize',20)
% hold on
% % plot(mis(:,3),'go')
% titlename='misfit for each virtual source';
% title(titlename)
% legend('m00','m13')
% xlabel('virtual source index')
% ylabel('misfit')
% saveas(fig,titlename,'pdf')



