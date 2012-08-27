%ERROR%
clear all
T = 40;
err = zeros(T,1);
err(1)=1;
figure, plot(err);
title ('shock in the error term');
xlabel ('quarter');
%PRODUCTIVITY%
pro = zeros(T,1);
pro(1)=err(1);
for t=2:T;
pro(t)=0.9*pro(t-1);
end
figure, plot(pro);
title ('IRF of productivity');
xlabel ('quarter');
ylabel ('% deviation from steady state');
%CAPITAL%
kh1 = zeros(T,1);
for t=2:T;
kh1(t) = 0.81*kh1(t-1)+0.07*pro(t-1);
end;
figure, plot(kh1);
title ('IRF of capital for the next period');
xlabel ('quarter');
ylabel ('% deviation from steady state');
%CONSUMPTION%
ch = zeros(T,1);
for t =2:T;
ch(t)= 0.069*kh1(t-1)+0.23*pro(t-1);
end;
figure, plot(ch);
title ('IRF of consumption');
xlabel ('quarter');
ylabel ('% deviation from steady state');
%INVESTMENT%
ih = zeros(T,1);
for t=2:T;
ih(t)= (1/0.1)*(kh1(t-1)*(0.81-1+0.1)+0.007*pro(t-1));
end;
figure, plot(ih);
title ('IRF of investment');
xlabel ('quarter');
ylabel ('% deviation from steady state');
%LABOR%
lh = zeros(T,1);
for t=2:T;
lh(t) = ((1-0.39)/0.39)*(kh1(t-1)*(0.31-0.5*0.69))+pro(t-1)*(0.37-0.5*0.23);
end;
figure, plot(lh);
title ('IRF of labour');
xlabel ('quarter');
ylabel ('% deviation from steady state');
%OUTPUT%
yh = zeros(T,1);
for t=2:T;
yh(t) = 0.3*kh1(t-1)+(1.09487*(kh1(t-1)*(0.31-0.5*0.69)+pro(t-1)*(0.37-0.5*0.23)));
end;
figure, plot(yh);
title ('IRF of general output');
xlabel ('quarter');
ylabel ('% deviation from steady state');
%WAGE%
wh = zeros(T,1);
for t=2:T;
wh(t) =0.31*kh1(t-1)+0.37*pro(t-1);
end;
figure, plot(wh);
title ('IRF of wage');
xlabel ('quarter');
ylabel ('% deviation from steady state');
finalplot = [kh1, ch, ih, lh, yh, wh];
figure, plot(finalplot);
title ('IRF functions: overview');
xlabel ('quarter');
ylabel ('% deviation from steady state');
hleg = legend ('Capital accum.','Consumption','Investment','Labour','General Output','Wage','Location','NorthEastOutside');