function [GPP]=RTL_LUE_Hour(data,para,latlon_time)
cosza=cosza_cal(latlon_time);   % solar zenith angle calculation
[PARsh, PARsu]=par_separate(cosza, para, data);  % PAR calculation for sunlit and shaded leaves
[APARsu, APARsh]=apar_cal(cosza, para, data, PARsh, PARsu);  % APAR calculation for sunlit and shaded leaves  
gTa=temperature_scalar(data,para);   % temperature scalar calculation
Fvpd=vpd_scalar(data,para);      % VPD scalar calculation
[fPPFDsu,fPPFDsh]=radiation_scalar(PARsu, PARsh, para);      % radiation scalar calculation
Emax=para(1);     % maximum LUE
Cs=co2_fertilization(data);  %CO2 fertilization effect
GPP=Emax.*(fPPFDsu.*APARsu+fPPFDsh.*APARsh).*Fvpd.*gTa.*Cs;  % GPP calculation
end



