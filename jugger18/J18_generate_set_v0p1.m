clc
clear
close all

vname = 'J18v1';

data = importfile2('J20 - data.csv');

ID = cell2mat(data(:,1));
names = data(:,2);
speed = cell2mat(data(:,3));
role  = data(:,4);
SupNum = cell2mat(data(:,8));
SupName = data(:,10);

color = [90 40 127
         69  112 180
         77 125 42
         220 187 34
         255,136,7 %143,72,28
         203 79 36
         ]/255;

zoom = 1;


% Stampo carte opera
Ncards = 20;

i=1;
for ii = 1:length(ID)
        
            titolo = sprintf('./CardFront63x88mm.png')

            A = imread(titolo);
            Adim = size(A);
            Ares = Adim(1)*Adim(2);

            %for j = 1:3 Acolor(:,:,j) = A; end
            Acolor = A;

            fig = figure(1);
            xx = linspace(0,63,50); 
            yy = linspace(0,88,50); 
            image(xx,yy,uint8(Acolor));


            %ELEMENTI DELLA CARTA
            
            %SPEED
            cx = 3;
            cy = 3;
            rectangle('Position',[cx,cy,18,18],'FaceColor',[1 1 1],...
                         'LineWidth',3,'Curvature',[1 1]); 
            text(cx+9,cy+10,num2str(speed(ii)),'FontSize',200, 'HorizontalAlignment','center',...
                 'VerticalAlignment','middle','Rotation',0,'Color','black','FontName','Brizel')  
                     
            %FIGURA
              title = sprintf('./Jugger%d.png',ii-1);
              [C,map,alpha]  = imread(title);
              zoom = 4;
              D = 14;
              cx = 51;
              cy = 45;
              image('XData',[cx-D/2*zoom cx+D/2*zoom],'YData',[cy-D/2*zoom cy+D/2*zoom],'CData',C,'AlphaData',alpha);
             
                    
             %NAME
             cx = 60;
             cy = 3;
             text(cx,cy,names{ii},'FontSize',30, 'HorizontalAlignment','right',...
                 'VerticalAlignment','middle','Rotation',0,'Color','black','FontName','Brizel') 
                 
             %ROLE
             cx = 12;
             cy = 25;
             text(cx,cy,role{ii},'FontSize',50, 'HorizontalAlignment','center',...
                 'VerticalAlignment','top','Rotation',0,'Color','black','FontName','Brizel') 
            
             
             %SUPERMOVE NAME
             cx = 3;
             cy = 65;
             text(cx+9,cy,SupName{ii},'FontSize',50, 'HorizontalAlignment','center',...
                 'VerticalAlignment','middle','Rotation',0,'Color','black','FontName','Brizel')
             
            %SUPERMOVE NUMBER
            cx = 3;
            cy = 50;
            rectangle('Position',[cx,cy,18,10],'FaceColor',[1 1 1],...
                         'LineWidth',3,'Curvature',[.1 .1]); 
            text(cx+9,cy+5,num2str(SupNum(ii)),'FontSize',80, 'HorizontalAlignment','center',...
                 'VerticalAlignment','middle','Rotation',0,'Color','black','FontName','Brizel')  
      
   
            hold off
            
                     
            
            
            
            %SALVO CARTA
            titolo = strcat('./',vname,'/sets/',vname,sprintf('/card%03d.png',i))
            fig.Color = [1 1 1];
            fig.InnerPosition = [100 100 630 880];

            xticks([]);
            yticks([]);
            set(gca,'position',[0 0 1 1],'units','normalized')
            saveas(gcf,titolo); 

            i = i+1;
            
            %pause(50)
end


