function [fPPFDsu,fPPFDsh]=radiation_scalar(PARsu, PARsh, para)
fPPFD_a=para(2);  % parameter a for PPFD scalar
fPPFD_b=1;        % parameter b for PPFD scalar, 1 mol m-2 hh-1

PPFDsu=(4.55.*PARsu/0.5)/(2);
PPFDsh=(4.55.*PARsh/0.5)/(2);
fPPFDsu=fPPFD_b./(fPPFD_a*PPFDsu+fPPFD_b);
fPPFDsh=fPPFD_b./(fPPFD_a*PPFDsh+fPPFD_b);
end
