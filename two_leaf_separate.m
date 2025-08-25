function [LAIsu, LAIsh]=two_leaf_separate(cosza, para, data)

omiga=para(3);    % clumping index
LAI=data(:,2);   % filtered LAI

LAIsu=2*cosza.*(1-exp(-0.5*omiga*(LAI./cosza)));
LAIsh=LAI-LAIsu;

end
