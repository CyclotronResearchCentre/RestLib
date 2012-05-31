function [timeData] = getTemporalData(dirData,numberComponents,typeProcessing)
    if strcmp(typeProcessing,'FSL')
       timeData = [];
        for i=1:numberComponents
            dataTempt = load('%s/filtered_func_data.ica/report/t%d.txt',dirData,nCompo);
            timeData = [timeData;dataTempt] ;                
        end
    elseif strcmp(typeProcessing,'GIFT')               
        if exist(sprintf('%s/components',dirData))== 0
            unzip(sprintf('%s/icaAna_sub01_component_ica_s1_.zip',dirData),sprintf('%s/components',dirData))                        
        end
        timeData = load_nii(sprintf('%s/components/icaAna_sub01_timecourses_ica_s1_',dirData));
    end
