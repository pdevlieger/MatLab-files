clear all
%question 2.b%
u=0.01; t=1; syms v;
while u < 0.100001
vs1(t)=solve(((0.034)/(0.034+0.677*(v/u)^(1-0.5)))-u,v);
u=u+0.001;
t=t+1;
end;
u=0.01;t=1;
while u < 0.100001
vs2(t)=solve(0.996*0.677*((u/v)^(-0.5))*(1 - ((1-0.5)*0.4+0.5*(v*0.237/u+1)))/(1-0.996*(1-0.034)),v);
u=u+0.001;
t=t+1;
end;
u=0.01:0.001:0.1;
figure, plot(u,vs1,'r',u,vs2,'b');
title ('Beveridge and Job Supply Curve (question 2.b)');
xlabel ('unemployment');
ylabel ('job vacancies');
hleg = legend ('Beverdige Curve','Job Supply Curve');
%question 2.c%
u=0.01; t=1; syms v;
%while u < 0.100001
%vb1(t)=solve(((0.034)/(0.034+0.677*(v/u)^(1-0.5)))-u,v);
%u=u+0.001;
%t=t+1;
%end;
%u=0.01;t=1;
while u < 0.100001
vb2(t)=solve(0.996*0.677*((u/v)^(-0.5))*(1 - ((1-0.5)*0.5+0.5*(v*0.237/u+1)))/(1-0.996*(1-0.034)),v);
u=u+0.001;
t=t+1;
end;
u=0.01:0.001:0.1;
figure, plot(u,vs1,'r',u,vs2,'b',u,vb2,'g')
title ('Beveridge and Job Supply Curve (question 2.c)');
xlabel ('unemployment');
ylabel ('job vacancies');
hleg = legend ('Beverdige Curve','Job Supply Curve (initial)','Job Supply Curve (with benefit shock)');
%question 2.d%
u=0.01; t=1; syms v;
%while u < 0.100001
%vA1(t)=solve(((0.034)/(0.034+0.677*(v/u)^(1-0.5)))-u,v);
%u=u+0.001;
%t=t+1;
%end;
%u=0.01;t=1;
while u < 0.100001
vA2(t)=solve(0.996*0.677*((u/v)^(-0.5))*(1.1 - ((1-0.5)*0.4+0.5*(v*0.237/u+1.1)))/(1-0.996*(1-0.034)),v);
u=u+0.001;
t=t+1;
end;
u=0.01:0.001:0.1;
figure, plot(u,vs1,'r',u,vs2,'b',u,vA2,'g')
title ('Beveridge and Job Supply Curve (question 2.d)');
xlabel ('unemployment');
ylabel ('job vacancies');
hleg = legend ('Beverdige Curve','Job Supply Curve (initial)','Job Supply Curve (with productivity shock)');

