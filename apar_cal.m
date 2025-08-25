function [APARsu, APARsh]=apar_cal(cosza, para, data, PARsh, PARsu)

abledo=para(4);        % albedo

[LAIsu, LAIsh]=two_leaf_separate(cosza, para, data);    

APARsh=(1-abledo)*PARsh.*LAIsh;
APARsu=(1-abledo)*PARsu.*LAIsu;

APARsu(isnan(APARsu))=0;
APARsh(isnan(APARsh))=0;

end