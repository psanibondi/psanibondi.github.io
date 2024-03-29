clc
clear
close all

vname = 'DinoFarm1';

data = importfile3('DinoFarm-sheet3.csv');

ID = cell2mat(data(:,1));
Dnames = data(:,2);
Dresources = cell2mat(data(:,[3:7 9:13 15:19]));
Daction = data(:,[8 14 20]);

color = [90 40 127
         69  112 180
         77 125 42
         220 187 34
         255,136,7 %143,72,28
         203 79 36
         ]/255;

zoom = 1;


% Stampo carte opera
Ncards = 16;

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
            
             %NAME
             cx = 31;
             cy = 7;
             text(cx,cy,Dnames{ii},'FontSize',65, 'HorizontalAlignment','center',...
                 'VerticalAlignment','middle','Rotation',0,'Color','black','FontName','Brizel') 
                 
 
                         
             %FIGURA
              title = sprintf('./Dinosaurs.png');
              [C,map,alpha]  = imread(title);
              stepx = 230;
              stepy = 192;
              Lx = 180;
              Ly = 130;
              
              xc = (mod(ii-1,4))*stepx + 15; 
              yc = floor((ii-1)/4)*stepy +10; 
              C2 = imcrop(C,[xc yc Lx Ly]);
              alpha2 = imcrop(alpha,[xc yc Lx Ly]);
              zoom = 2;
              zoomy = zoom*Lx/Ly; 
              D = 14;
              cx = 30;
              cy = 25;
              image('XData',[cx-D/2*zoomy cx+D/2*zoomy],'YData',[cy-D/2*zoom cy+D/2*zoom],'CData',C2,'AlphaData',alpha2);
             
                   icons = { 'HuntingIcons_75_t.png';
                           'HuntingIcons_119_t.png';
                           'PrehistoricIcon_67_t.png';
                           'PrehistoricIcon_86_t.png';
                           'HuntingIcons_42_t.png'};
                   
              %LEVEL1
              for lev = 1:3
                  pos = 1;
                  for res = 1:5
                        if ~isnan(Dresources(ii,res+(lev-1)*5))
                            
                            title = icons{res};
                            [C,map,alpha]  = imread(title);
                            zoom = 0.8;
                            D = 14;
                            cx = 7+7 + (pos-1)*20;
                            cy = 81 - (lev - 1)*16;
                            image('XData',[cx-D/2*zoom cx+D/2*zoom],'YData',[cy-D/2*zoom cy+D/2*zoom],'CData',C,'AlphaData',alpha);

                            cx = 7+7 + (pos-1)*20;
                            cy = 72 - (lev - 1)*16
                            text(cx-9,cy+7,strcat(num2str(Dresources(ii,res+(lev-1)*5)),'x'),'FontSize',50, 'HorizontalAlignment','center',...
                             'VerticalAlignment','middle','Rotation',0,'Color','black','FontName','Arial') 
                         
                            pos = pos +1;
                        end
                  end
                  rectangle('Position',[0,88-lev*16,63,1],'FaceColor',[0 0 0],'LineStyle','none','Curvature',[0 0])
                 cx = 60;
                 cy = 72 - (lev - 1)*16
                 text(cx,cy+13,Daction{ii,lev},'FontSize',50, 'HorizontalAlignment','right',...
                      'VerticalAlignment','middle','Rotation',0,'Color','black','FontName','Brizel')    
              end      
   
                
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


%% Stampo carte score
clc
clear
close all

vname = 'DinoFarm1';
score = importfile4('DinoFarm-sheet4.csv');

Dscore = score(:,2:25);

color = [69  112 180 %blue
        90 40 127  %violet
         220 187 34 %yello
         77 125 42  %green
        255,136,7 %143,72,28
         203 79 36
         ]/255;

zoom = 1;


Ncards = 4;

i=17;
for ii = 1:Ncards
        
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

            thick = 10;
            
            rectangle('Position',[0,0,thick*2,88],'FaceColor',color(4,:),'LineStyle','none','Curvature',[0 0]) %left
            rectangle('Position',[63-thick*2,0,thick*2,88],'FaceColor',color(2,:),'LineStyle','none','Curvature',[0 0]) %right
            rectangle('Position',[0,0,63,thick*2],'FaceColor',color(3,:),'LineStyle','none','Curvature',[0 0]) %top
            rectangle('Position',[0,88-thick*2,63,thick*2],'FaceColor',color(1,:),'LineStyle','none','Curvature',[0 0]) %bottom
             
            %ELEMENTI DELLA CARTA
            icons = { 'HuntingIcons_75_t.png';
                       'HuntingIcons_119_t.png';
                       'PrehistoricIcon_67_t.png';
                       'PrehistoricIcon_86_t.png';
                       'HuntingIcons_42_t.png'};
                   
              c = [63-20 13;
                   50 88-30;
                   20 88-13;
                   13   30];
              
              %scores
              for season = 1:4
                   for line = 1:2
                         pos = 1;
                         for res = 1:5
                            if (Dscore((ii-1)*2+line,res+(season-1)*6)) > 0
           
                                title = icons{res};
                                [C,map,alpha]  = imread(title);
                                zoom = 0.5;
                                D = 14;
                                if season == 1 
                                    cx = c(season,1) - (pos-1)*12;
                                    cy = c(season,2) - (line - 1)*7;
                                    lx = 6;
                                    ly = 0;
                                    sx = -15;
                                    sy = 0;
                                    rot = 180;
                                elseif season == 2
                                    cx = c(season,1) + (line - 1)*7;
                                    cy = c(season,2) - (pos - 1)*12;
                                    lx = 0;
                                    ly = 6;
                                    sx = 0;
                                    sy = -15;
                                    rot = 90;
                                elseif season == 3
                                    cx = c(season,1) + (pos-1)*12;
                                    cy = c(season,2) + (line - 1)*7;
                                    lx = -6;
                                    ly = 0;
                                    sx = +15;
                                    sy = 0;
                                    rot = 0;
                                else
                                    cx = c(season,1) - (line - 1)*7;
                                    cy = c(season,2) + (pos - 1)*12;
                                    lx = 0;
                                    ly = -6;
                                    sx = 0;
                                    sy = 15;
                                    rot = -90;
                                end
                                image('XData',[cx-D/2*zoom cx+D/2*zoom],'YData',[cy-D/2*zoom cy+D/2*zoom],'CData',C,'AlphaData',alpha);

                                text(cx+lx,cy+ly,num2str((Dscore((ii-1)*2+line,res+(season-1)*6))),'FontSize',70, 'HorizontalAlignment','center',...
                                 'VerticalAlignment','middle','Rotation',rot,'Color','black','FontName','Brizel') 
                                
                                 pos = pos+1;
                                 
                                
                            end
                            if res == 5 && ~isnan(Dscore((ii-1)*2+line,6+(season-1)*6))
                             text(cx+sx,cy+sy,strcat('>> ',num2str((Dscore((ii-1)*2+line,6+(season-1)*6))),' PV'),'FontSize',70, 'HorizontalAlignment','center',...
                                 'VerticalAlignment','middle','Rotation',rot,'Color','black','FontName','Brizel')
                            end
                      end
                      %rectangle('Position',[0,88-se*18,63,1],'FaceColor',[0 0 0],'LineStyle','none','Curvature',[0 0])

                  end      
              end
                
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


