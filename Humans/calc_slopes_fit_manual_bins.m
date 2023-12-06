function [slope_struct] = calc_slopes_fit_manual_bins(slope_struct,map1,map2)
% fit the linear relationship between two input images (relaxivity)
% for the different ROIs in the segmentation

range = prctile(map2(:),[10,98]);
Bin = linspace(range(1),range(2),40); % Create bins for R2* values
map1_path = slope_struct.map1_path;
map2_path = slope_struct.map2_path;

Binmap2m=[];
Binmap1m=[];
STDm=[];

C = slope_struct.C;
NUMm=zeros(length(Bin)-1,size(C,1));

fit=nan(size(C,1),size(C,2));
ind1 = strfind(map1_path,'/');
map1_path = map1_path(ind1(end)+1:end-7);
ind2 = strfind(map2_path,'/');
map2_path = map2_path(ind2(end)+1:end-7);

    for i=1:size(C,2) % for each ROI
        for j=1:size(C,1)
            Binmap2=[]; Binmap1=[]; std_c=[]; num=[];
            % divide to bins
            [Binmap2,Binmap1,std_c,num]=slope_bin(Bin,map2,slope_struct.seg,map1,C(j,i));
            NUMm(:,i)=num;

            % take only bins with enough voxels
            y=Binmap1;
            y(isnan(Binmap1) | isnan(Binmap2) | num<0.04*sum(num) ) = [];
            x=Binmap2;
            x(isnan(Binmap1) | isnan(Binmap2) | num<0.04*sum(num) ) = [];
            Binmap2m{i}=x;
            Binmap1m{i}=y;
            std_c(isnan(Binmap1) | isnan(Binmap2) | num<0.04*sum(num) ) = [];
            STDm{i}=std_c;

            % linear fit
            if ~isempty(x)
                mdl=fitlm(x,y);
                fit(j,i,1)=mdl.Coefficients{2,1};
                fit(j,i,2)=mdl.Coefficients{1,1};
            end
        end
    end

slope_struct.fit=fit; % slope and intersection of the linear relationship between an image and PD or PDw
slope_struct.Binmap2m=Binmap2m; %  median values of PD or PDw within each bin
slope_struct.Binmap1m=Binmap1m; % median values of the image within each bin
slope_struct.STD=STDm; % STD of the image within each bin
end