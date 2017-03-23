isource='000000';
dirobsname=['../',isource,'/DATA_obs']
dirsynname=['../',isource,'/DATA_syn']


% plot the seismogram from seisdd
% [obs,SuTraceHeaders1,SuHeader1]=ReadSu([dirobsname,'/Uz_file_single.su']);
% [syn,SuTraceHeaders2,SuHeader2]=ReadSu([dirsynname,'/Uz_file_single.su']);



syn1=load([dirsynname,'/syn1.txt']);
syn2=load([dirsynname,'/syn2.txt']);
syn3=load([dirsynname,'/syn3.txt']);
syn4=load([dirsynname,'/syn4.txt']);

adj1=load([dirsynname,'/adj1.txt']);
adj2=load([dirsynname,'/adj2.txt']);
adj3=load([dirsynname,'/adj3.txt']);
adj4=load([dirsynname,'/adj4.txt']);

adj1=load([dirsynname,'/adj1_before.txt']);
adj2=load([dirsynname,'/adj2.txt']);
adj3=load([dirsynname,'/adj3.txt']);
adj4=load([dirsynname,'/adj4.txt']);


adj1_before=load([dirsynname,'/adj1_before.txt']);
adj2_before=load([dirsynname,'/adj2_before.txt']);
adj3_before=load([dirsynname,'/adj3_before.txt']);
adj4_before=load([dirsynname,'/adj4_before.txt']);


obs1=load([dirobsname,'/obs1.txt']);
obs2=load([dirobsname,'/obs2.txt']);
obs3=load([dirobsname,'/obs3.txt']);
obs4=load([dirobsname,'/obs4.txt']);



nr=1;
np=12000;



s1=reshape(syn1,np,nr);
s2=reshape(syn2,np,nr);
s3=reshape(syn3,np,nr);
s4=reshape(syn4,np,nr);


d1=reshape(obs1,np,nr);
d2=reshape(obs2,np,nr);
d3=reshape(obs3,np,nr);
d4=reshape(obs4,np,nr);

adj1=reshape(adj1,np,nr);
adj2=reshape(adj2,np,nr);
adj3=reshape(adj3,np,nr);
adj4=reshape(adj4,np,nr);

%%
t=[1:np]*0.02;
b=1;

fig=figure(7)
for i=b:b
 
    
    subplot(5,1,1)
    plot(t,adj1(:,i),'LineWidth',1) 
    hold on
 Ts=20;
Te=40;
fs=1/dt;
[t1, t2] = butter(2, [(1/Te)/(fs/2) (1/Ts)/(fs/2)]);  
CFtemp=adj1(:,i);
CFbpfilt =filtfilt(t1,t2,CFtemp); 
adj11(:,i)=CFbpfilt; 
     plot(t,adj11(:,i),'r','LineWidth',1) 
    hold on   
    
    nametitle=['Adjoint source:20-40s']    
    title(nametitle)
     subplot(5,1,2)
    plot(t,adj2(:,i),'LineWidth',1)
    
    hold on 
 Ts=15;
Te=30;
fs=1/dt;
[t1, t2] = butter(2, [(1/Te)/(fs/2) (1/Ts)/(fs/2)]);  
CFtemp=adj2(:,i);
CFbpfilt =filtfilt(t1,t2,CFtemp); 
adj22(:,i)=CFbpfilt; 
        plot(t,adj22(:,i),'r','LineWidth',1) 
    hold on    
    nametitle=['Adjoint source:15-30s']    
    title(nametitle)
    subplot(5,1,3)
    plot(t,adj3(:,i),'LineWidth',1)
    hold on 
     Ts=10;
Te=20;
fs=1/dt;
[t1, t2] = butter(2, [(1/Te)/(fs/2) (1/Ts)/(fs/2)]);  
CFtemp=adj3(:,i);
CFbpfilt =filtfilt(t1,t2,CFtemp); 
adj33(:,i)=CFbpfilt; 
        plot(t,adj33(:,i),'r','LineWidth',1) 
    hold on 
    
    nametitle=['Adjoint source:10-20s']    
    title(nametitle)
    subplot(5,1,4)
    plot(t,adj4(:,i),'LineWidth',1)
    hold on
         Ts=5;
Te=10;
fs=1/dt;
[t1, t2] = butter(2, [(1/Te)/(fs/2) (1/Ts)/(fs/2)]);  
CFtemp=adj4(:,i);
CFbpfilt =filtfilt(t1,t2,CFtemp); 
adj44(:,i)=CFbpfilt; 
        plot(t,adj44(:,i),'r','LineWidth',1) 
    hold on
    
    nametitle=['Adjoint source:5-10s']    
    title(nametitle)
    subplot(5,1,5)
    adjall(:,i)=(adj1(:,i)+adj2(:,i)+adj3(:,i)+adj4(:,i))/4;           
    plot(t,adjall(:,i),'LineWidth',1)
    hold on   
    nametitle=['Adjoint source:ALL']    
    title(nametitle)
end
nametitle=['Adjoint source_after']    
title(nametitle)
set(gca,'XTick',[0 40 80 120 160 200 240] )
xlim([0 250])
xlabel('time/s','Position',[220,-3])
saveas(fig,[isource,'-',nametitle],'pdf')

%%
fig=figure(8)
for i=b:b
  
    subplot(5,1,1)
    plot(t,adj1_before(:,i),'LineWidth',1) 
    hold on
         plot(t,adj11(:,i),'r','LineWidth',1) 
    hold on 
    nametitle=['Adjoint source:20-40s']    
    title(nametitle)
     subplot(5,1,2)
    plot(t,adj2_before(:,i),'LineWidth',1)
    hold on 
         plot(t,adj22(:,i),'r','LineWidth',1) 
    hold on 
    nametitle=['Adjoint source:15-30s']    
    title(nametitle)
    subplot(5,1,3)
    plot(t,adj3_before(:,i),'LineWidth',1)
    hold on  
         plot(t,adj33(:,i),'r','LineWidth',1) 
    hold on 
    nametitle=['Adjoint source:10-20s']    
    title(nametitle)
    subplot(5,1,4)
    plot(t,adj4_before(:,i),'LineWidth',1)
    hold on
         plot(t,adj44(:,i),'r','LineWidth',1) 
    hold on 
    nametitle=['Adjoint source:5-10s']    
    title(nametitle)
    subplot(5,1,5)
    adjall(:,i)=(adj1_before(:,i)+adj2_before(:,i)+adj3_before(:,i)+adj4_before(:,i))/4;           
    plot(t,adjall(:,i),'LineWidth',1)
    hold on   
    nametitle=['Adjoint source:ALL']    
    title(nametitle)
end
nametitle=['Adjoint source-before']    
title(nametitle)
set(gca,'XTick',[0 40 80 120 160 200 240] )
xlim([0 250])
xlabel('time/s','Position',[220,-3])
saveas(fig,[isource,'-',nametitle],'pdf')

%%





#!/bin/bash
#scp -r  zhang18@login.scinet.utoronto.ca:/scratch/l/liuqy/zhang18/seisDD/GJI2016/FwiSYN/submit_job/FwiSYN/000000/DATA_* ./000000

for isource in `cat list`;

do

#mkdir -p ./$isource/DATA_out

#scp -r  zhang18@login.scinet.utoronto.ca:/scratch/l/liuqy/zhang18/seisDD/GJI2016/FwiEGF_fang_smooth/submit_job/FwiEGF_fang_smooth/$isource/DATA_out/win* ./$isource/DATA_out 


echo $isource

cp plot2d.py $isource
cd $isource
#
python plot2d.py  DATA_obs/z_processed1.bin
mv dat.txt obs1.txt

python plot2d.py  DATA_obs/z_processed2.bin
mv dat.txt obs2.txt

python plot2d.py  DATA_obs/z_processed3.bin
mv dat.txt obs3.txt

python plot2d.py  DATA_obs/z_processed4.bin
mv dat.txt obs4.txt

#python plot2d.py  DATA_obs/z_processed5.bin
#mv dat.txt obs5.txt
#
#python plot2d.py  DATA_obs/z_processed6.bin
#mv dat.txt obs6.txt
#
#python plot2d.py  DATA_obs/z_processed7.bin
#mv dat.txt obs7.txt


python plot2d.py  DATA_syn/z_adj1.bin
mv dat.txt adj1.txt

python plot2d.py  DATA_syn/z_adj2.bin
mv dat.txt adj2.txt

python plot2d.py  DATA_syn/z_adj3.bin
mv dat.txt adj3.txt

python plot2d.py  DATA_syn/z_adj4.bin
mv dat.txt adj4.txt

python plot2d.py  DATA_syn/z_adj1_before.bin
mv dat.txt adj1_before.txt

python plot2d.py  DATA_syn/z_adj2_before.bin
mv dat.txt adj2_before.txt

python plot2d.py  DATA_syn/z_adj3_before.bin
mv dat.txt adj3_before.txt

python plot2d.py  DATA_syn/z_adj4_before.bin
mv dat.txt adj4_before.txt



python plot2d.py  DATA_syn/z_processed1.bin
mv dat.txt syn1.txt

python plot2d.py  DATA_syn/z_processed2.bin
mv dat.txt syn2.txt

python plot2d.py  DATA_syn/z_processed3.bin
mv dat.txt syn3.txt

python plot2d.py  DATA_syn/z_processed4.bin
mv dat.txt syn4.txt

#python plot2d.py  DATA_syn/z_processed5.bin
#mv dat.txt syn5.txt





#!/usr/bin/env python

import sys
from os.path import exists

import numpy as np
import pylab as plt
from mpl_toolkits.axes_grid1 import make_axes_locatable

def read_fortran(filename):
    """ Reads Fortran style binary data and returns a numpy array.
    """
    with open(filename, 'rb') as file:
        # read size of record
        file.seek(0)
        n = np.fromfile(file, dtype='int32', count=1)[0]

        # read contents of record
        file.seek(4)
        v = np.fromfile(file, dtype='float32')

    return v[:-1]




if __name__ == '__main__':
    """ Plots data on 2-D unstructured mesh

      Can be used to plot models or kernels created by SPECFEM2D

      SYNTAX
          plot2d  x_coords_file  z_coords_file  database_file
    """

    # parse command line arguments
    database_file = sys.argv[1]
    v = read_fortran(database_file)

    np.savetxt('dat.txt',v)

#
#python plot2d.py  DATA_syn/z_processed6.bin
#mv dat.txt syn6.txt
#
#python plot2d.py  DATA_syn/z_processed7.bin
#mv dat.txt syn7.txt

mv syn*.txt ./DATA_syn
mv adj*.txt ./DATA_syn
mv obs*.txt ./DATA_obs

rm  ./DATA_obs/*bin
rm  ./DATA_syn/*bin
cd ../


done

