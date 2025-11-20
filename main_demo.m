% Reference: 
% Guan X, Chen J M, Shen H, et al. A modified two-leaf light use efficiency model for improving the simulation of GPP using a radiation scalar[J]. Agricultural and Forest Meteorology, 2021, 307: 108546.

% para(1)=Emax;         % maximum LUE
% para(2)=fPPFD_a;      % parameter a for PPFD scalar
% para(3)=omiga;        % clumping index
% para(4)=albedo;       % albedo
% para(5)=PTmax;        % Tmax for temperature scalar
% para(6)=PTmin;        % Tmin for temperature scalar
% para(7)=PVPDmax;      % VPDmax for temperature scalar
% para(8)=PVPDmin;      % VPDmin for temperature scalar

% data(:,1)=PAR;     % photosynthetically active radiation, approximately*SWR
% data(:,2)=LAI;     % filtered LAI
% data(:,3)=Tmin;    % daily minimum temperature
% data(:,4)=VPD;     % VPD
% data(:,5)=TA;      % temperature
% data(:,6)=CO2;     % Atmospheric CO2 concentration

% latlon_time(:,1)=lat;      %latitude
% latlon_time(:,2)=lon;      %longitude
% latlon_time(:,3)=year;     % year
% latlon_time(:,4)=Jday;     % Julian day, 365 or 366 days.
% latlon_time(:,5)=hour;     % hour, 24 hours.
% latlon_time(:,6)=minute;   % minute, 60 minutes.


GPP=RTL_LUE_Hour(data,para,latlon_time);   % GPP calculation

