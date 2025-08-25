function [gTa]=temperature_scalar(data,para)

Tem=data(:,3);   % daily minimum temperature

Tmax=para(5);     % Tmax for temperature scalar
Tmin=para(6);      % Tmin for temperature scalar

gTa=(Tem-Tmin)/(Tmax-Tmin);
gTa(Tem<=Tmin)=0;
gTa(Tem>=Tmax)=1;

end