clear all
%values and parameters%
N = 150;
T = 1000;
ro = 0.9;
g1 = 0.69; g2 = 0.23 ; g3 = 0.81 ; g4 = 0.007 ; g5 = 0.31 ; g6 = 0.37;
css = 0.43; lss = 0.39; yss = 0.59;
%random error term creation%
err = randn(T,N);
%define productivity%
pro = zeros(T,N);
for i=2:T;
pro(i,:) = pro(i-1,:)*ro+err(i,:);
end
%define Khat policy rule%
kh1 = zeros(T,N);
for i=2:T;
kh1(i,:)= g3*kh1(i-1,:)+g4*pro(i-1,:);
end
%define policy rules%
     %ch for consumption%
ch = zeros(T,N);
ih = zeros(T,N);
lh = zeros(T,N);
yh = zeros(T,N);
wh = zeros(T,N);
for i=2:T;
ch(i,:)=g1*kh1(i-1,:)+g2*pro(i-1,:);
end
for i=2:T;
ih(i,:)=10*(kh1(i-1,:)*(g3-1+0.1)+g4*pro(i-1,:));
end
for i=2:T;
lh(i,:)=((1-lss)/lss)*(kh1(i-1,:)*(g5-0.5*g1)+(pro(i-1,:)*(g6-0.5*g2)));
end
for i=2:T;
yh(i,:)=0.3*kh1(i-1,:)+(0.7*(1-lss)/lss)*(kh1(i-1,:)*(g5-0.5*g1)+(pro(i-1,:)*(g6-0.5*g2)));
end
for i=2:T;
wh(i,:)=g5*kh1(i-1,:)+g6*pro(i-1,:);
end
%Mean and standard deviation of Monte Carlo simulations%
%for consumption; cb%
cb=mean(ch);
wb=mean(wh);
ib=mean(ih);
yb=mean(yh);
lb=mean(lh);
%HP filter consumption%
w=1600;
if size(cb,1)<size(cb,2)
   cb=cb';
end
tc=size(cb,1);
a=6*w+1;
b=-4*w;
c=w;
d=[c,b,a];
d=ones(tc,1)*d;
m=diag(d(:,3))+diag(d(1:tc-1,2),1)+diag(d(1:tc-1,2),-1);
m=m+diag(d(1:tc-2,1),2)+diag(d(1:tc-2,1),-2);
%
m(1,1)=1+w;       m(1,2)=-2*w;
m(2,1)=-2*w;      m(2,2)=5*w+1;
m(tc-1,tc-1)=5*w+1; m(tc-1,tc)=-2*w;
m(tc,tc-1)=-2*w;    m(tc,tc)=1+w;
%
sc=inv(m)*cb;
%create a matrix with both vectors to plot%
cbplot = [sc,cb];
plot(cbplot)
%HP filter investment%
w=1600;
if size(ib,1)<size(ib,2)
   ib=ib';
end
ti=size(ib,1);
a=6*w+1;
b=-4*w;
c=w;
d=[c,b,a];
d=ones(ti,1)*d;
m=diag(d(:,3))+diag(d(1:ti-1,2),1)+diag(d(1:ti-1,2),-1);
m=m+diag(d(1:ti-2,1),2)+diag(d(1:ti-2,1),-2);
%
m(1,1)=1+w;       m(1,2)=-2*w;
m(2,1)=-2*w;      m(2,2)=5*w+1;
m(ti-1,ti-1)=5*w+1; m(ti-1,ti)=-2*w;
m(ti,ti-1)=-2*w;    m(ti,ti)=1+w;
%
si=inv(m)*ib;
%create a matrix with both vectors to plot%
ibplot = [si,ib];
figure, plot(ibplot)
%HP filter labour%
w=1600;
if size(lb,1)<size(lb,2)
   lb=lb';
end
tl=size(lb,1);
a=6*w+1;
b=-4*w;
c=w;
d=[c,b,a];
d=ones(tl,1)*d;
m=diag(d(:,3))+diag(d(1:tl-1,2),1)+diag(d(1:tl-1,2),-1);
m=m+diag(d(1:tl-2,1),2)+diag(d(1:tl-2,1),-2);
%
m(1,1)=1+w;       m(1,2)=-2*w;
m(2,1)=-2*w;      m(2,2)=5*w+1;
m(tl-1,tl-1)=5*w+1; m(tl-1,tl)=-2*w;
m(tl,tl-1)=-2*w;    m(tl,tl)=1+w;
%
sl=inv(m)*lb;
%create a matrix with both vectors to plot%
lbplot = [sl,lb];
figure, plot(lbplot)
%HP filter general output%
w=1600;
if size(yb,1)<size(yb,2)
   yb=yb';
end
ty=size(yb,1);
a=6*w+1;
b=-4*w;
c=w;
d=[c,b,a];
d=ones(ty,1)*d;
m=diag(d(:,3))+diag(d(1:ty-1,2),1)+diag(d(1:ty-1,2),-1);
m=m+diag(d(1:ty-2,1),2)+diag(d(1:ty-2,1),-2);
%
m(1,1)=1+w;       m(1,2)=-2*w;
m(2,1)=-2*w;      m(2,2)=5*w+1;
m(ty-1,ty-1)=5*w+1; m(ty-1,ty)=-2*w;
m(ty,ty-1)=-2*w;    m(ty,ty)=1+w;
%
sy=inv(m)*yb;
%create a matrix with both vectors to plot%
ybplot = [sy,yb];
figure, plot(ybplot)
%HP filter wage%
w=1600;
if size(wb,1)<size(wb,2)
   wb=wb';
end
tw=size(wb,1);
a=6*w+1;
b=-4*w;
c=w;
d=[c,b,a];
d=ones(tw,1)*d;
m=diag(d(:,3))+diag(d(1:tw-1,2),1)+diag(d(1:tw-1,2),-1);
m=m+diag(d(1:tw-2,1),2)+diag(d(1:tw-2,1),-2);
%
m(1,1)=1+w;       m(1,2)=-2*w;
m(2,1)=-2*w;      m(2,2)=5*w+1;
m(tw-1,tw-1)=5*w+1; m(tw-1,tw)=-2*w;
m(tw,tw-1)=-2*w;    m(tw,tw)=1+w;
%
sw=inv(m)*wb;
%create a matrix with both vectors to plot%
wbplot = [sw,wb];
figure, plot(wbplot)
%Computing standard deviations%
stdy = std(yh);
stdc = std(ch);
stdi = std(ih);
stdl = std(lh);
stdw = std(wh);
stdry = stdy/stdy
stdrc = stdc/stdy
stdri = stdi/stdy
stdrl = stdl/stdy
stdrw = stdw/stdy
corr = corrcoef(sy,sc)
corr2 = corrcoef(sy,si)
corr3 = corrcoef(sy,sl)
corr4 = corrcoef(sy,sw)