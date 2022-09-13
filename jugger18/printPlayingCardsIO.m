clc
close all
clear

fileID = fopen("Jugger20_CSVfile.csv",'w');

N = 20;
title = "Jugger";
fprintf(fileID,"master\n");

for i = 1:N
    %tmp = sprintf("card%03d.png\n",i)
    tmp = sprintf("card%03d.png\n",i)
    text = strcat("https://psanibondi.github.io/jugger18/J18v1/sets/J18v1/",tmp);
    fprintf(fileID,text);
end
fclose(fileID);