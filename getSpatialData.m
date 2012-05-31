function [dataCompSpatial] = getSpatialData(dirData,nComponent,typeProcessing)
    if strcmp(typeProcessing,'FSL')
        dataCompSpatial = load_nii(sprintf('%s/filtered_func_data/icaAna_sub01_component_ica_s1_%s',dirData,nCompo));
    elseif strcmp(typeProcessing,'GIFT')        
        if exist(sprintf('%s/components',dirData))== 0
            unzip(sprintf('%s/icaAna_sub01_component_ica_s1_.zip',dirData),sprintf('%s/components',dirData))                        
        end
        if nComponent<10
            cc = sprintf('00%d',nComponent);
        else
            cc = sprintf('0%d',nComponent);
        end
        dataCompSpatial = load_nii(sprintf('%s/components/icaAna_sub01_component_ica_s1_%s',dirData,cc));
    end
