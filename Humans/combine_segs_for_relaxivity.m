function seg = combine_segs_for_relaxivity(seg)
% This function combines segmentations to bigger ROIs, for relaxivity
% calculations.

    if ischar(seg)
        seg = readFileNifti(seg);
        seg = seg.data;
    end

    data_egde = seg;
    data_egde(data_egde==251 | data_egde==252 |data_egde==253 |data_egde==254 |data_egde==255)=251; %% CC seg
    data_egde(data_egde==10 | data_egde==9 )=10; %% Left-Thalamus seg
    data_egde(data_egde==48| data_egde==49 )=49; %% right-Thalamus seg
    lobe_vec{1}=[1028,1027,1003,1018,1019,1020,1012,1014,1024,1017,1032]; % frontal
    lobe_vec{2}=[1029,1008,1031,1022,1025]; % paraiatal
    lobe_vec{3}=[1030,1015,1009,1001,1007,1034,1006,1033,1016]; % temporal
    lobe_vec{4}=[1011,1013,1005,1021]; % occipital
    
    for ii=1:length(lobe_vec)
        vec_tmp=lobe_vec{ii};
        data_egde(ismember(data_egde,vec_tmp))=vec_tmp(1); %% frontal
        for jj=1:3
            vec_tmp=vec_tmp+1000;
            data_egde(ismember(data_egde,vec_tmp))=vec_tmp(1); %% frontal
        end
    end
    seg = data_egde;
end
