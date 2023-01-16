clc
close all
clear

fileID = fopen("batamouse_CSVfile.csv",'w');

N = 48;
title = "batamouse";
fprintf(fileID,"master\n");

for i = 1:N
    tmp = sprintf("batamouse_Page_%02d.png\n",i)
    text = strcat("https://psanibondi.github.io/batamouse/",tmp);
    fprintf(fileID,text);
end
fclose(fileID);