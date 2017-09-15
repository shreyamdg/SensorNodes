clc
clear all
close all
lx=640;
lcyp=4;
lsym=64;
lwal=8;
x=randsrc(1,lx);
wal=10*eye(lwal);
ntap=4;
j=1;
k=1;
for ii=1:lsym:lx
    y(j+lwal+lcyp:j+lwal+lcyp+lsym-1)=ifft(x(ii:ii+lsym-1));
    y(j+lwal:j+lwal+lcyp-1)=y(j+lwal+lsym:j+lwal+lcyp+lsym-1);
    y(j:j+lwal-1)=wal(4,1:lwal);
    j=j+lwal+lcyp+lsym;
    
end

w1=wal(4,1:lwal);
ly=length(y);
lsym1=lsym+lcyp+lwal;
h=randn(1,ntap)+i*randn(1,ntap)
y0=[zeros(1,10),y]*h(1);
y1=[zeros(1,11),y(1,1:ly-1)]*h(2);
y2=[zeros(1,12),y(1,1:ly-2)]*h(3);
y3=[zeros(1,13),y(1,1:ly-3)]*h(4);
y01=y0+y1+y2+y3;
r=[wal(4,1:lwal),zeros(1,lsym+lcyp)];
ly01=length(y01);
y01n=wgn(1,ly01,-48,'complex')+y01;
ii=1;
y011=[y01n,zeros(1,ly)];
lw=zeros(1,lsym1);
for jj=1:lsym1:ly01
    for kk=1:1:lsym1
        cr(ii)=(((y011(1,jj+kk-1:jj+kk+lsym1-2)*r(1:lsym1).')));
        ii=ii+1;
    end
    ii=1;
    lw=lw+(cr);
end
f=lw/1000;
f1=abs(lw);
lnw=length(f1);
xx=1:1:lnw;
stem(xx,f1);
timing_offset=0;
for jj=1:1:lsym1
    if(f1(jj)>=50)
        timing_offset=jj-1;
        break;
    end
end
disp('timing offset=');
disp(timing_offset);
h_est=f(timing_offset+1:timing_offset+ntap);
disp('h_est');
disp(h_est);
