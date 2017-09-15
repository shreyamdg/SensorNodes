clc
clear all
close all
lx=1120;
lcyp=16;
lsym=56;
lwal=8;
intr=lsym/lwal;
x=randsrc(1,lx);
wal=hadamard(lwal);
wc=10*wal(7,:);
N=lsym+lwal;
ntap=5;
for k=1:1:N
    for n=1:1:N
mtrx1(k,n)= exp(i*2*pi*(k-1)*(n-1)/N);
    end
end
%%interleaving

mm=0;
for ii=1:lsym:lx
    mm=mm+1;
    kk=0;
for jj=1:lwal:(lsym+lwal)
    kk=kk+1;
    unk=mtrx1(jj,1:lsym)*x(ii:ii+lsym-1).';
    un(kk)=N*wc(kk)-unk;
    hcon(kk,:)=mtrx1(jj,(lsym+1):N);
end
lst=(un)*(inv(hcon));
x2(mm,:)=[x(ii:ii+lsym-1),lst];
end
%%ifft

for jj=1:1:(lx/lsym)
    x_ift(jj,:)=ifft(x2(jj,:),N);
end
%%cyclic prefix addition
for jj=1:1:(lx/lsym)
    x_ift1(jj,:)=[x_ift(jj,N-lcyp+1:N),x_ift(jj,:)];
end
for kk=1:1:lx/lsym
for jj=1:lwal:(lwal+lsym)
    element=10*x_ift1(kk,jj+lcyp);
    x_ift1(kk,jj+lcyp)=element;
end
end
N_cyp=N+lcyp;

%%parallel to serial conversion
ii=0;
for jj=1:(N+lcyp):(N+lcyp)*(lx/lsym)
    ii=ii+1;
    x_ser(jj:jj+N+lcyp-1)=x_ift1(ii,:);
end
%%timing offset introduction
del=10;
lser=length(x_ser);
h=randn(1,ntap)+i*randn(1,ntap);
y=zeros(1,lser+del+ntap-1);
for ik=1:1:ntap
x_ser1=[zeros(1,del+ik-1),x_ser(1:lser),zeros(1,ntap-ik)];
y=y+x_ser1*h(ik);
end
l_y=length(y);
ni=wgn(1,l_y,-10,'complex');
y_ni=y+ni;
y_ni1=[y_ni,zeros(1,N_cyp)];
for kk=1:1:(lsym+lwal)
    z(kk)=y_ni1(kk).*conj(y_ni1(kk+lsym+lwal+1));
end
ntap1=0;
for kk=1:1:lsym+lwal
    if( z(kk)>0 && isreal(z(kk)))
        ntap1=ntap1+1;
    end
end
%%correlation
ii=0;
for jj=1:lwal:(lwal+lsym)
    ii=1+ii;
    w_c(jj)=0.1*wc(ii);
end
w_c1=0.1*[w_c,zeros(1,lwal-1)];

lw=zeros(1,N_cyp);
for jj=1:N_cyp:N_cyp*(lx/lsym)
    ii=0;
    for kk=1:1:N_cyp
        ii=ii+1;
        cr(ii)=(y_ni1(jj+kk-1:jj+kk+N-2)*w_c1');
    end
    lw=lw+(cr);
end
lw1=abs(lw);
l_lw1=length(lw1);
value=lw1(1);
for jj=2:1:l_lw1
    if value<=lw1(jj)
        value=lw1(jj);
       end
end
for jj=1:l_lw1
    if lw1(jj)==value
        timing_offset=jj-(lcyp+1);
    end
end
ll=1:1:l_lw1;
stem(ll,lw1);

