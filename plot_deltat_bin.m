


% for i=['deltat1','deltat2','deltat3','deltat4']
for i=1:4
fig=figure(i)

folder = './deltat_init/';   % folder contains all the CFs      
name=['deltat',num2str(i)];

if i==1
titlename='20-40s';
end
if i==2
titlename='15-30s';
end
if i==3
titlename='10-20s';
end
if i==4
titlename='5-10s';
end

filename = dir(strcat(folder,['*',name,'*']));

%get the number of files
nfile = length(filename)

for mm = 1:nfile
% 
% read profile of CFs or EGF
dt=importdata((strcat(folder,filename(mm).name)));
data(mm,:)=dt(1:end-1);


end
[a b]=size(data);

deltat=reshape(data,a*b,1);

s1=deltat;

k=0; 
for i=1:length(s1)
    
   if s1(i)~=0.0000000E+00
       
       k=k+1;
       snew(k)=s1(i);
   end
end

s1=snew;

hist(snew,20)




% h = findobj(gca,'Type','patch');
% set(h,'FaceColor','r','EdgeColor','w')


dt_mean=mean(s1);
dt_delta=std(s1);


title(titlename)
xlabel('DT')
ylabel('Num. of windows') 
text(-1.9,100,'m00:');
text(-1.9,95,['dt=',num2str(dt_mean),'+',num2str(dt_delta),'s']);

saveas(fig,name,'pdf')
clear all
end
