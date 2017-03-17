clear all
% function VsModel_Fang
% figure
[sta,lon0,lat0]=textread('StationList2.txt','%s %f %f');
% plot(lon0,lat0,'^','markersize',8,'MarkerFaceColor','b');
% hold on;

files=textread('list','%s');

for i=1:length(files)
    filename=files{i};
    dep(i)=str2num(filename(10:end-6));
    [lon,lat,vs,grid]=textread(filename,'%f %f %f %s');
    for j=1:length(lon)
        vs_new(j).name=grid(j);
        vs_new(j).lon=lon(j);
        vs_new(j).lat=lat(j);
        vs_new(j).vs(i)=vs(j);
        vs_new(j).dep(i)=dep(i);
    end        
end

for i=1:446
    x(i)=vs_new(i).lon;
    y(i)=vs_new(i).lat;
    name(i)=vs_new(i).name;
end

% plot(x,y,'rX');hold on;
% text(x,y,name);
% xlabel('Longitude \circ');
% ylabel('Latitude \circ');
% saveas(gca,'raw','png');
%% output grids and stations lon & lat
% fid=fopen('list.txt','w');
% for ii=1:446
%     fprintf(fid,'%f %f\n',vs_new(ii).lat,vs_new(ii).lon);
% end
% fclose(fid)
% fid=fopen('stationlist.txt','w');
% for ii=1:length(lat0)
%     fprintf(fid,'%f %f\n',lat0(ii),lon0(ii));
% end
% fclose(fid);
%%
[lat00,lon00,dx0,dy0]=textread('Cartesian.txt','%f %f %f %f');
figure;plot(dy0,dx0,'kx');
hold on;
[lat000,lon000,dx00,dy00]=textread('Cartesian1.txt','%f %f %f %f');
plot(dy00,dx00,'^','markersize',8,'MarkerFaceColor','b')


%% interpolation;
% the grid number i need to revise
x_grid_num=101
z_grid_num=101
% 
% by zhang chao
%  1.8717369e+02  -1.5608893e+02
%  -7.6993661e+01   3.2235945e+02
inter_dx=linspace( 187.17369,-76.99366,x_grid_num);
inter_dy=linspace(-156.08893,322.35945,x_grid_num);

% by zhang ping
% inter_dx=linspace(184.442535,-76.7445145,x_grid_num);
% inter_dy=linspace(-157.596893,322.497009,x_grid_num);


% interplate the 2d array to generate vs_crust (50km)
for i=1:length(files)
    filename=files{i};
    dep(i)=str2num(filename(10:end-6));
    [lon,lat,vs,grid]=textread(filename,'%f %f %f %s');
    vs_crust(i,:)=griddata(dx0,dy0,vs,inter_dx,inter_dy);
end


%% create the mantle velocity
    mantle_grid_num= z_grid_num-length(files)

    vs_mantle_start= vs_crust(end,:);
    vs_mantle= ones(mantle_grid_num,x_grid_num)*4.408;

    for i=1:x_grid_num
       for j=1:(mantle_grid_num-23)
        vs_mantle(j,i)= vs_mantle_start(i)+(4.408-vs_mantle_start(i))/(mantle_grid_num-23)*j;
       end
    end

    vs_mantle(end-8:end,:)= ones(9,x_grid_num)*4.411;




%8 1  3374.7  7959.1 4408.8  0 0   9999 9999 0 0 0 0 0 0 15km 8n
%9 1  3373.6  7947.7 4411.1  0 0   9999 9999 0 0 0 0 0 0 8km  4n



    
%% creat the whole earth model
vs_org(1:length(files),:)           =vs_crust;
vs_org(length(files)+1:z_grid_num,:)=vs_mantle;
     
vs_after= load('yang.txt');

% 03 by model yang and zhang
vs_inter=vs_org;
% vs_inter(1:40,:)=vs_after(1:40,:);
% vs_inter(41:end,:)=vs_org(41:end,:);
% 02 by model_yang 
% vs_inter=vs_after;
% 01 by model zhang
% vs_inter=vs_org;


%%%%%% by chao zhang %%%%%%%%
FP= [1.50,2.00,2.60,3.00,3.50,4.00,5.00,5.50,6.00,6.25,6.40,6.70,7.10,7.50,8.00,8.15,8.50,8.75,9.25,10.00]*1000;
FR= [1.50,1.86,2.06,2.20,2.30,2.40,2.56,2.64,2.71,2.82,2.90,3.00,3.10,3.20,3.30,3.38,3.49,3.57,3.73, 3.97]*1000;
x1=0;
x51=5.4573606e+02;
k=0;
for i=1:2:z_grid_num
   for j=1:x_grid_num
        k=k+1;
        model(k,1)= (x1+(x51-x1)/(x_grid_num-1)*(j-1))*1000;
        %model(k,1)= (x1+(x51-x1)/(x_grid_num-1)*(j-1))*1000+20000;
        model(k,2)= (z_grid_num-i)*1000;
        model(k,3)= 2600;
        % For vp, we use empire function
        model(k,4)= (0.9409+2.0947*vs_inter(i,j)-0.8206*vs_inter(i,j)^2+0.2683*vs_inter(i,j)^3-0.0251*vs_inter(i,j)^4)*1000;
        model(k,5)= vs_inter(i,j)*1000;
        Vp=0.9409+2.0947*vs_inter(i,j)-0.8206*vs_inter(i,j)^2+0.2683*vs_inter(i,j)^3-0.0251*vs_inter(i,j)^4
        model(k,3)= (1.6612*Vp-0.4721*Vp^2+0.0671*Vp^3-0.0043*Vp^4+0.000106*Vp^5)*1000;
        
%         if model(k,5)>4.0
%         model(k,4)= vs_inter(i,j)*1.8*1000; 
%         end
%         if abs(model(k,5)-4408)<1.0
%         model(k,4)=7959.1;
%         model(k,3)= 3374.7;
%         end
%         
%         if abs(model(k,5)-4411)<1.0
%         model(k,4)=7947.7; 
%         model(k,3)= 3374.7;
%         end
        
        
  if model(k,4)> FP(14)
        model(k,3)= (model(k,4)-FP(14))/(FP(15)-FP(14))*(FR(15)-FR(14))+FR(14);
  else if model(k,4)> FP(13)
        model(k,3)= (model(k,4)-FP(13))/(FP(14)-FP(13))*(FR(14)-FR(13))+FR(13);     
   else if model(k,4)> FP(12)
        model(k,3)= (model(k,4)-FP(12))/(FP(13)-FP(12))*(FR(13)-FR(12))+FR(12); 
   else if model(k,4)> FP(11)
        model(k,3)= (model(k,4)-FP(11))/(FP(12)-FP(11))*(FR(12)-FR(11))+FR(11); 
   else if model(k,4)> FP(10)
        model(k,3)= (model(k,4)-FP(10))/(FP(11)-FP(10))*(FR(11)-FR(10))+FR(10);clc
   else if model(k,4)> FP(9)
        model(k,3)= (model(k,4)-FP(9))/ (FP(10)-FP(9))* (FR(10)-FR(9))+FR(9);
   else if model(k,4)> FP(8)
        model(k,3)= (model(k,4)-FP(8))/  (FP(9)-FP(8))* (FR(9)-FR(8))+FR(8);
   else if model(k,4)> FP(7)
        model(k,3)= (model(k,4)-FP(7))/  (FP(8)-FP(7))* (FR(8)-FR(7))+FR(7);

       end
       end
       end
       end
       end
       end     
       end
       end
       
        
    end
end

% vs_inter=vs_inter(1:2:51,:);
% save model_input_matrix  vs_inter -ascii
save model_input  model -ascii 

http://email.91dizhi.at.gmail.com.7h1.space/index.php
