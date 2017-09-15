clc 
clear all
N=64;
err_cnt=zeros(1,16);
currentframe=randsrc(1,64);

nextframe=randsrc(1,64);
cfft=ifft(currentframe);
nfft=ifft(nextframe);
indercnt=0;
for snr= 0:2:30
    indercnt=indercnt+1;
     for nn=1:10000
     previousframe=randsrc(1,64);   
     pfft=ifft(previousframe);
     tran_seq=[pfft(61:64) pfft cfft(61:64) cfft nfft(61:64) nfft]; 
     chcoeff=(1/sqrt(8))*[randn(1,4)+i*randn(1,4)];
     rec_seq1=chcoeff(1)*tran_seq;
     rec_seq2=chcoeff(2)*[0 tran_seq(1:203)];
     rec_seq3=chcoeff(3)*[0 0 tran_seq(1:202)];
     rec_seq4=chcoeff(4)*[0 0 0 tran_seq(1:201)];
     rec_seq=rec_seq1+rec_seq2+rec_seq3+rec_seq4;
     win_seq=rec_seq(73:136)+wgn(1,64,-18-snr,'complex');
     fft_rec=fft(win_seq); 
    
     fft_chn=fft(chcoeff,64);
     mrc=fft_rec.*conj(fft_chn);
     for jj=1:64
         if mrc(jj)>=0
             rec_dat(jj)=1;
         else
            rec_dat(jj)=-1;
         end
     end
     for kk=1:64
         if rec_dat(kk)~=currentframe(kk)
         err_cnt(indercnt)=err_cnt(indercnt)+1;
         end
     end
     
     nextframe=currentframe;
     currentframe=previousframe;
     nfft=cfft;
     cfft=pfft;
    end
    ber(indercnt)=err_cnt(indercnt)/640000
    
end

err_cnt=zeros(1,16);
currentframe=randsrc(1,64);

nextframe=randsrc(1,64);
cfft=ifft(currentframe);
nfft=ifft(nextframe);
indercnt=0;

for snr= 0:2:30
    indercnt=indercnt+1;
     for nn=1:10000
     previousframe=randsrc(1,64);   
     pfft=ifft(previousframe);
     tran_seq=[pfft(61:64) pfft cfft(61:64) cfft nfft(61:64) nfft]; 
     chcoeff=(1/sqrt(8))*[randn(1,4)+i*randn(1,4)];
     rec_seq1=chcoeff(1)*tran_seq;
     rec_seq2=chcoeff(2)*[0 tran_seq(1:203)];
     rec_seq3=chcoeff(3)*[0 0 tran_seq(1:202)];
     rec_seq4=chcoeff(4)*[0 0 0 tran_seq(1:201)];
     rec_seq=rec_seq1+rec_seq2+rec_seq3+rec_seq4;
     win_seq=rec_seq(73-1:136-1)+wgn(1,64,-18-snr,'complex');
     fft_rec=fft(win_seq); 
    
     fft_chn=fft(chcoeff,64);
     mrc=fft_rec.*conj(fft_chn);
     for jj=1:64
         if mrc(jj)>=0
             rec_dat(jj)=1;
         else
            rec_dat(jj)=-1;
         end
     end
     for kk=1:64
         if rec_dat(kk)~=currentframe(kk)
         err_cnt(indercnt)=err_cnt(indercnt)+1;
         end
     end
     
     nextframe=currentframe;
     currentframe=previousframe;
     nfft=cfft;
     cfft=pfft;
    end
    ber1(indercnt)=err_cnt(indercnt)/640000
    
end

err_cnt=zeros(1,16);
currentframe=randsrc(1,64);

nextframe=randsrc(1,64);
cfft=ifft(currentframe);
nfft=ifft(nextframe);
indercnt=0;

for snr= 0:2:30
    indercnt=indercnt+1;
     for nn=1:10000
     previousframe=randsrc(1,64);   
     pfft=ifft(previousframe);
     tran_seq=[pfft(61:64) pfft cfft(61:64) cfft nfft(61:64) nfft]; 
     chcoeff=(1/sqrt(8))*[randn(1,4)+i*randn(1,4)];
     rec_seq1=chcoeff(1)*tran_seq;
     rec_seq2=chcoeff(2)*[0 tran_seq(1:203)];
     rec_seq3=chcoeff(3)*[0 0 tran_seq(1:202)];
     rec_seq4=chcoeff(4)*[0 0 0 tran_seq(1:201)];
     rec_seq=rec_seq1+rec_seq2+rec_seq3+rec_seq4;
     win_seq=rec_seq(73+1:136+1)+wgn(1,64,-18-snr,'complex');
     fft_rec=fft(win_seq); 
    
     fft_chn=fft(chcoeff,64);
     mrc=fft_rec.*conj(fft_chn);
     for jj=1:64
         if mrc(jj)>=0
             rec_dat(jj)=1;
         else
            rec_dat(jj)=-1;
         end
     end
     for kk=1:64
         if rec_dat(kk)~=currentframe(kk)
         err_cnt(indercnt)=err_cnt(indercnt)+1;
         end
     end
     
     nextframe=currentframe;
     currentframe=previousframe;
     nfft=cfft;
     cfft=pfft;
    end
    ber2(indercnt)=err_cnt(indercnt)/640000
    
end
lx=0:2:30;

semilogy(lx,ber,'-.b*',lx,ber1,'--r*',lx,ber2,'-c*');
axis ([0 30 0.00 0.6])
grid on