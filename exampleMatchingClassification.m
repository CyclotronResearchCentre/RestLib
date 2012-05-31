restlib_path = '/media/Mobsol/Dropbox/Code/COMARestLibV0.1';

namesTemplate = {'rAuditory_corr','rCerebellum_corr','rDMN_corr','rECN_L_corr','rECN_R_corr','rSalience_corr','rSensorimotor_corr','rVisual_lateral_corr','rVisual_medial_corr','rVisual_occipital_corr'};
indexNeuronal = 1:30;
nCompo = 30;
Tr = 2.4;
[dataAssig maxGoF] = selectionMatchClassification('/home/erik/Dropbox/Code/COMARestLibV0.1/data/subj_1/',...
                             '/home/erik/Dropbox/Code/COMARestLibV0.1/data/subj_1/icaAnaMask',...
                             namesTemplate,indexNeuronal,nCompo,Tr, restlib_path)
                         
for i=1:size(dataAssig,1)                         
    disp(sprintf('Template %d to component %d with GoF %f is neuronal %d prob=%f',dataAssig(i,1),dataAssig(i,2),dataAssig(i,3),dataAssig(i,4),dataAssig(i,5)));
end
maxGoF
