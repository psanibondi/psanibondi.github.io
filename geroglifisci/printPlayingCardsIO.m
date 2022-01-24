clc
close all
clear

fileID = fopen("segniGI2022_CSVfile.csv",'w');

N = 27;
title = "geroglifisci";
fprintf(fileID,"master\n");

for i = 1:N
    tmp = sprintf("Geroglifisci_Page_%02d.png\n",i)
    text = strcat("https://psanibondi.github.io/geroglifisci/",tmp);
    fprintf(fileID,text);
end
fclose(fileID);