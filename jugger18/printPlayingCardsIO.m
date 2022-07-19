clc
close all
clear

fileID = fopen("JuggerCardOrizzv1_CSVfile.csv",'w');

N = 20;
title = "Jugger";
fprintf(fileID,"master\n");

for i = 1:N
    %tmp = sprintf("card%03d.png\n",i)
    tmp = sprintf("CardOrizzv1_Page_%02d.png\n",i)
    text = strcat("https://psanibondi.github.io/jugger18/JuggerCardOrizzv1/",tmp);
    fprintf(fileID,text);
end
fclose(fileID);