function [PARsh, PARsu]=par_separate(cosza, para, data)

hhS0=2.4606*2;    % 1-hour solar constant

omiga=para(3);    % clumping index

PAR=data(:,1);    % photosynthetically active radiation, approximately*SWR
LAI=data(:,2);    % filtered LAI

R=(2*PAR)./(hhS0*cosza);
PARdif=PAR.*(0.943+0.734*R-4.9*R.^2+1.796*R.^3+2.058*R.^4);
PARdif(R>0.8)=PAR(R>0.8)*0.13;
PARdir=PAR-PARdif;

PARdifu=PARdif.*exp(-0.5*omiga*LAI./(0.537+0.025*LAI));

Cpar=0.07*omiga*PARdir.*(1.1-0.1*LAI).*exp(-cosza);

PARsh=(PARdif-PARdifu)./LAI+Cpar;
PARsu=PARdir*cos(pi/3)./cosza+PARsh;

PARsu(isnan(PARsu))=0;
PARsh(isnan(PARsh))=0;
end