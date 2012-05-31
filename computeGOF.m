% COMA Science Group - University of Liege
% Francisco Gomez J - 2011
% Computes the GoF for a set of components from multiple templates
%
% dirData: Directory with the ICA components
% namesTemplate: Names of the templates
% maskName: Mask name
% indexNeuronal: A vector with the index over which the GoF is computed
function [dataAllFeature] = computeGOF(dirData,namesTemplate,maskName,indexComponents)
    maskData = load_nii(maskName);
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   
    jFeature = 1;
    dataCompTemporal = load_nii(sprintf('%s/components/icaAna_sub01_timecourses_ica_s1_',dirData));    
    for i=indexComponents
        if i<10
            cc = sprintf('00%d',i);
        else
            cc = sprintf('0%d',i);  
        end

        dataCompSpatial = load_nii(sprintf('%s/components/icaAna_sub01_component_ica_s1_%s',dirData,cc));                        
        fgof = [];
        for iTemp = 1:size(namesTemplate,2)
            dataTemplate = load_nii(sprintf('templates/spatial_hypn_subj/%s',namesTemplate{1,iTemp}));                  
            gofk = computeGodFit(dataTemplate.img,dataCompSpatial.img,maskData.img);                                
            fgof = [fgof gofk];
        end

        feature = [fgof];                                    
        if jFeature == 1
            dataAllFeature = zeros(1,size(feature,2));                
        end
        dataAllFeature(jFeature,1:end) = feature;
        jFeature = jFeature + 1;

    end