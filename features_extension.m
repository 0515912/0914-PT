%% The extension of the features of gas %%
%   data : 45-by-6 with 
%	  labels
%	  z : Total hydrocarbon
%	  p(1-4) : CH4/Total hydrocarbon, C2H6/Total hydrocarbon, C2H4/Total hydrocarbon, C2H2/Total hydrocarbon.
% 	p(5-10) : H2/(Total hydrocarbon + H2), C2H2/C2H4, C2H4/C2H6, C2H2/C2H6, C2H2/CH4, C2H4/H2

function [p, labels] = features_extension(data)

labels = data(:,6);

z = zeros(size(data,1), 1); 

for i = 1:5

	z = z + data(:,i);% Total hydrocarbon

end

p = zeros(size(data,1), 1);

for j = 1:4

	p(:,j) = data(:,j + 1)./z;%p(1-4)

end

p(:,5) = data(:,1)./(data(:,1) + z);% H2/总烃+H2

p(:,6) = data(:,5)./data(:,4);%C2H2/C2H4

p(:,7) = data(:,4)./data(:,3);%C2H4/C2H6

p(:,8) = data(:,5)./data(:,3);%C2H2/C2H6

p(:,9) = data(:,5)./data(:,2);%C2H2/CH4

p(:,10) = data(:,4)./data(:,1);%C2H4/H2

end
