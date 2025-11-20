function [Fvpd]=vpd_scalar(data,para)
VPD=data(:,4);   %VPD
VPDmax=para(7);        % VPDmax for temperature scalar
VPDmin=para(8);       % VPDmin for temperature scalar

Fvpd=(VPDmax-VPD)/(VPDmax-VPDmin);
Fvpd(VPD>=VPDmax)=0;
Fvpd(VPD<=VPDmin)=1;
end
