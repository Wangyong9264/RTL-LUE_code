function [Cs]=co2_fertilization(data)
vpd=data(:,4);   % VPD
t=data(:,5);     % temperature
Ca=data(:,6);    % Atmospheric CO2 concentration

Rgas=8.314;
ita=0.8903;
P=21;
fi=43*exp((37830*(t-298.15))./(298.15*t*8.314));   %here is 43ppm, or 4.22Pa. Select by different unit .
Kc=39.97*exp(79.43*(t-298.15)/(298.15*Rgas*t));    %T:unit:K
Ko=27480*exp(36.38*(t-298.15)/(298.15*Rgas*t));
K=Kc*(1+P/Ko);
kesi=sqrt(356.51*K/(1.6*ita));
gamma=kesi/(kesi+sqrt(vpd));
Ci=Ca*gamma;
Cs=(Ci-fi)/(Ci+2*fi);
end

