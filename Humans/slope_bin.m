function [Binmap2,Binmap1,std_c,num]=slope_bin(Bin,map2,seg,map1,roi)
% This function pools the image's values into bins.
% seg is the segmentation matrix.

Binmap2=nan(length(Bin)-1,1);
Binmap1=nan(length(Bin)-1,1);
num=zeros(length(Bin)-1,1);
std_c=nan(length(Bin)-1,1);

for ii=1:length(Bin)-1
    clear ind
    ind=find(map2>=Bin(ii) & map2<Bin(ii+1) & seg==roi);
    if ~isempty(ind)
        start_ind=length(ind);
        ind(map1(ind)==0)=[];
        Binmap2(ii)=median(map2(ind)); % median values of PD or PDw within each bin
        Binmap1(ii)=median(map1(ind)); % median values of the image within each bin
        std_c(ii)=mad(map1(ind),1); % the STD of the image within each bin
    end
    num(ii)=length(ind);
end

end