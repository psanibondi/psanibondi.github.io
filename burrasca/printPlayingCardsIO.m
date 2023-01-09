clc
close all
clear

fileID = fopen("burrasca_CSVfile.csv",'w');

N = 60;
title = "burrasca";
fprintf(fileID,"master\n");

for i = 1:N
    tmp = sprintf("burrasca_Page_%02d.png\n",i)
    text = strcat("https://psanibondi.github.io/burrasca/",tmp);
    fprintf(fileID,text);
end
fclose(fileID);