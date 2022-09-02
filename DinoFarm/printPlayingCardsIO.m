clc
close all
clear

fileID = fopen("DinoFarm1.csv",'w');

N = 20;
title = "DinoFarm";
fprintf(fileID,"master\n");

for i = 1:N
    tmp = sprintf("card%03d.png\n",i)
    text = strcat("https://psanibondi.github.io/DinoFarm/DinoFarm1/sets/DinoFarm1/",tmp);
    fprintf(fileID,text);
end
fclose(fileID);