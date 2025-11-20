function [cosza]=cosza_cal(latlon_time)

lat=latlon_time(:,1);     %latitude
lon=latlon_time(:,2);     %longitude
year=latlon_time(:,3);    % year
Jday=latlon_time(:,4);    % Julian day
hour=latlon_time(:,5);    % hour
min=latlon_time(:,6);     % minute

N0=79.6764+0.2422*(year-1985)-floor((year-1985)/4);
t=Jday-N0;
sun_angle=2*pi*t/365.2422;
dec=0.3723+23.2567*sin(sun_angle)+0.1149*sin(2*sun_angle)-0.1712*sin(3*sun_angle)-0.758*cos(sun_angle)+0.3656*cos(2*sun_angle)+0.0201*cos(3*sun_angle);
Eq = 0.0028-1.9857*sin(sun_angle)+9.9059*sin(2*sun_angle)-7.0924*cos(sun_angle)-0.6882*cos(2*sun_angle);
TimeZone=(lon./abs(lon)).*round(abs(lon)./15);
dlon = lon - TimeZone*15.0;
dlon(lon<0) = TimeZone*15.0- lon;
Local_Time = (hour+min/60+dlon/15+Eq/60);
hour_angle = (Local_Time-12)*15;
dec = deg2rad(dec);
hour_angle = deg2rad(hour_angle);
lat=deg2rad(lat);
cosza=sin(lat).*sin(dec)+cos(lat).*cos(dec).*cos(hour_angle);
cosza(cosza<0)=0;
end
