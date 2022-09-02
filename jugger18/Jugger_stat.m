clc
clear
close all

data = importfile2('J20- data.csv');

ID = cell2mat(data(:,1));
names = data(:,2);
speed = cell2mat(data(:,3));
role  = data(:,4);
%SupNum = cell2mat(data(:,8));
%SupName = data(:,10);
power = zeros(20,1);

for ntest=1:10000
    squad1 = randi(20,1,5);
    squad2 = randi(20,1,5);
    win1 = 0;
    win2 = 0;
    
    for i=1:5
        for j =1:5
            ii = squad1(i);
            jj = squad2(j);
            
            if speed(ii) > speed(jj)
                win1 = win1+1;
            else
                if role{ii} == "Quick"
                        if role{jj} == "Blocker"
                            win1 = win1 +1;
                        end
                end
                if role{ii} == "Enforcer"
                        if role{jj} == "Quick"
                            win1 = win1 +1;
                        end
                end
                if role{ii} ==  "Chain"
                        if role{jj} == "Quick" 
                            win1 = win1 +1;
                        end
                end
                if role{ii} ==  "Blocker"
                        if role{jj} == "Enforcer" || role{jj} == "Chain"
                            win1 = win1 +1;
                        end  
                end
            end
            
            if speed(ii) < speed(jj)
                win2 = win2+1;
            else
                if role{jj} == "Quick"
                        if role{ii} == "Blocker"
                            win2 = win2 +1;
                        end
                end
                if role{jj} == "Enforcer"
                        if role{ii} == "Quick"
                            win2 = win2 +1;
                        end
                end
                if role{jj} ==  "Chain"
                        if role{ii} == "Quick" 
                            win2 = win2 +1;
                        end
                end
                if role{jj} ==  "Blocker"
                        if role{ii} == "Enforcer" || role{ii} == "Chain" 
                            win2 = win2 +1;
                        end  
                end
            end
               
        end
    end
    win_stat(ntest) = (win1 - win2);
    for i = squad1
        power(i) = power(i) + (win1 - win2)/mean(abs(win_stat));
    end
    
end

win_stat;
xbins = [0:0.5:5]
histogram(win_stat,'Normalization','pdf','FaceColor',[.9 .9 .9]);

m = mean(win_stat)
s = std(win_stat)
pd = fitdist(win_stat','Normal');
xgrid = linspace(0,5,100)';
pdfEst = pdf(pd,xgrid);
line(xgrid,pdfEst)

table(names,C)

plot(speed,power/ntest*100,'d')

stat = zeros(1,4);
for i = 1:20
    if role{i} == "Quick"
        stat(1) = stat(1) + power(i)/ntest*100;
    end
    if role{i} == "Enforcer"
        stat(2) = stat(2) + power(i)/ntest*100;
    end
    if role{i} == "Chain"
        stat(3) = stat(3) + power(i)/ntest*100;
    end
    if role{i} == "Blocker"
        stat(4) = stat(4) + power(i)/ntest*100;
    end
end
bar(stat/5)

