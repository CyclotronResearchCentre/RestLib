% COMA Science Group - University of Liege
% Francisco Gomez J - 2011
% Denoising of an image comming using the classifier
%
% dirData: Directory with the ICA components
% nameMask: Mask name
% nCompo: number of components of the ICA decomposition
% Tr: Repetition time
function [compoNeuronal compoNonNeuronal] = denoiseImage(dirData,nameMask,nCompo,Tr,nameNeuronal,nameNonNeuronal,restlib_path)
    typeProcessing = 'GIFT';
    
    [assignedMarks] = IC_selection(dirData,nCompo,nameMask,Tr,restlib_path);    
    %dataCompTemporal = load_nii(sprintf('%s/components/icaAna_sub01_timecourses_ica_s1_',dirData));    
    dataCompTemporal = getTemporalData(dirData,nCompo,typeProcessing);

    neuLabel = find(assignedMarks~=0);    
    [acum dataCompSpatial] = getComposite(dirData,dataCompTemporal,neuLabel,typeProcessing);
    compoNeuronal = acum;
    non_neuLabel = find(assignedMarks~=1);    
    [acum dataCompSpatial] = getComposite(dirData,dataCompTemporal,non_neuLabel,typeProcessing);
    compoNonNeuronal = acum;

    niiNeuronal = make_nii(compoNeuronal,dataCompSpatial.hdr.dime.pixdim(2:4),dataCompSpatial.hdr.hist.originator(1:3));    
    save_nii(niiNeuronal,nameNeuronal);
    niiNonNeuronal = make_nii(compoNonNeuronal,dataCompSpatial.hdr.dime.pixdim(2:4),dataCompSpatial.hdr.hist.originator(1:3));    
    save_nii(niiNonNeuronal,nameNonNeuronal);

    
function [acum dataCompSpatial]= getComposite(dirData,dataCompTemporal,indexLabel,typeProcessing)
    fristVol = 0;
    for i=indexLabel(1,:)
        dataCompSpatial = getSpatialData(dirData,i,typeProcessing);

        if fristVol==0
            acum = zeros([size(dataCompSpatial.img,1) size(dataCompSpatial.img,2) size(dataCompSpatial.img,3) size(dataCompTemporal.img(:,i),1)]);
            fristVol=1;
        end

        for ii=1:(size(dataCompSpatial.img,1))
            for jj=1:(size(dataCompSpatial.img,2))
                for ll=1:(size(dataCompSpatial.img,3))
                    tacum = acum(ii,jj,ll,:); 
                    acum(ii,jj,ll,:) = tacum(:)' + dataCompSpatial.img(ii,jj,ll)*dataCompTemporal.img(:,i)';
                end
            end
        end                            
    end
