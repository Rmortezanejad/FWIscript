#!/bin/bash
#sh renew_parameter.sh 
#mpif90 -DUSE_MPI -o bin/seismo_parameters.o -g -O3 -xSSSE3 -no-ip -fno-fnalias -fno-alias -vec-report1 -assume byterecl -sox -cpp  -traceback -w -ftz -I cons
tants.mod  -c ./bin/seismo_parameters.f90 
#mpif90 -DUSE_MPI -o ./bin/misfit_adjoint.exe -g -O3 -xSSSE3 -no-ip -fno-fnalias -fno-alias -vec-report1 -assume byterecl -sox -cpp  -traceback -w -ftz /scrat
ch/l/liuqy/zhang18/seisDD/seisDD/SRC/misfit_adjoint.f90 /scratch/l/liuqy/zhang18/seisDD/seisDD/SRC/../lib/seismo.a   /home/l/liuqy/zhang18/usr/local/sac/lib/l
ibsac.a /home/l/liuqy/zhang18/usr/local/sac/lib/libsacio.a -I./bin -J./bin ./bin/seismo_parameters.o
##
##
for shot in `cat list`;
do
echo $shot
model=01
echo "calculate the deltat for inital model"
mpirun -np 4 ./bin/misfit_adjoint.exe true z CC AD /sgfs1/scratch3/l/liuqy/zhang18/seisDD/GJI2016/FwiEGF_fang/submit_job/FwiEGF_fang_$model/$shot
#mpirun -np 4 ./bin/misfit_adjoint.exe true z CC AD /oldscratch/l/liuqy/zhang18/seisDD/GJI2016/FwiEGF_fang/submit_job/FwiEGF_fang_15/$shot
echo "mkdir -p ./deltat_$model/$shot"
mkdir -p ./deltat/deltat_$model/$shot
cp -r window_env ./deltat/deltat_$model/$shot
#
done
#

#
for shot in `cat list`;
do
echo $shot
model=13
echo "calculate the deltat for 13th  model"
mpirun -np 4 ./bin/misfit_adjoint.exe true z CC AD /sgfs1/scratch3/l/liuqy/zhang18/seisDD/GJI2016/FwiEGF_fang/submit_job/FwiEGF_fang_$model/$shot
echo "mkdir -p ./deltat_$model/$shot"
mkdir -p ./deltat/deltat_$model/$shot
cp -r window_env ./deltat/deltat_$model/$shot
#
done
