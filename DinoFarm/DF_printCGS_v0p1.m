clc; clear; close all;

%richiede file Card_back.jpg
vname = 'DinoFarm1';
save tmp;

mkdir(vname);
mkdir(strcat(vname,'/decks'));
mkdir(strcat(vname,'/sets'));
mkdir(strcat(vname,'/sets/',vname));



%% name.json

foldername = strcat("./",vname,"/");
filename = strcat(vname,".json");
filepath = strcat(foldername,filename);

jsonStruct.name = vname;
jsonStruct.allCardsUrl = strcat("https://psanibondi.github.io/",vname,"/AllCards.json");
jsonStruct.allSetsUrl  = strcat("https://psanibondi.github.io/",vname,"/AllSets.json");
jsonStruct.autoUpdateUrl = strcat("https://psanibondi.github.io/",vname,"/",vname,"/.json");
jsonStruct.bannerImageUrl = strcat("https://psanibondi.github.io/",vname,"Banner.png");
jsonStruct.cardBackImageUrl = strcat("https://psanibondi.github.io/",vname,"CardBack.png");
jsonStruct.cardImageProperty = "image";
jsonStruct.cardPrimaryProperty = "color";
name = {"color"; "image"};
type = {"string";"string"};
jsonStruct.cardProperties = table(name,type);
jsonStruct.rulesUrl = "https://psanibondi.github.io/index.html";
name = {"FullDeck";};
url = {strcat("https://psanibondi.github.io/",vname,"/decks/FullDeck.txt");};
jsonStruct.deckUrls = table(name,url);

text = jsonencode(jsonStruct);

fileID = fopen(filepath,'w');
fprintf(fileID,text);
fclose(fileID);

%% AllSets.json

foldername = strcat("./",vname,"/");
filename = "AllSets.json";
filepath = strcat(foldername,filename);

code = {vname;};
name = {"FullDeck";};
jsonStruct = table(code,name);

text = jsonencode(jsonStruct);

fileID = fopen(filepath,'w');
fprintf(fileID,text);
fclose(fileID);


%% Figura back
close all; clear;
load tmp;

titolo = (sprintf('./CardBack63x88mm.png'));
    
    A = imread(titolo);
    Adim = size(A);
    Ares = Adim(1)*Adim(2);
     
    Acolor = A; 
    
    fig = figure(1);
    xx = linspace(0,1,50); 
    yy = linspace(0,1,50); 
    imagesc(xx,yy,uint8(Acolor));
    
% A = ones(339,226,3);
% fig = figure(1);
% xx = linspace(0,1,50); 
% yy = linspace(0,1,50); 
% imagesc(xx,yy,A); %colormap summer
%     
% text(xx(25),yy(25),vname,'FontSize',40, 'HorizontalAlignment','center','VerticalAlignment','middle')
titolo = sprintf(strcat('./',vname,'/CardBack.png'));
fig.Color = [1 1 1];
fig.InnerPosition = [100 100 630 880];

xticks([]);
yticks([]);
set(gca,'position',[0 0 1 1],'units','normalized')
saveas(gcf,titolo); 


 %% Figura Banner
% %clear;
% 
% A = ones(100,100,3);
% fig = figure(1);
% xx = linspace(0,1,50); 
% yy = linspace(0,1,50); 
% imagesc(xx,yy,A); %colormap summer
%     
% text(xx(25),yy(25),vname,'FontSize',14, 'HorizontalAlignment','center','VerticalAlignment','middle')
% titolo = sprintf('./Banner_tmp.png')
% fig.Color = [1 1 1];
% fig.InnerPosition = [100 100 100 100];
% 
% xticks([]);
% yticks([]);
% set(gca,'position',[0 0 1 1],'units','normalized')
% saveas(gcf,titolo); 
% 
% B = imread('./Banner_tmp.png');
% im = uint8(mean(B,3));
% alpha = double(im<10); 
% imwrite(im,strcat('./',vname,'/Banner.png'),'fmt','png','Alpha',alpha)

