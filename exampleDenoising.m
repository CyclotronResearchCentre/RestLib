    % denoising example
    dataDir = './data/subj_1';
    maskName  = './data/subj_1/icaAnaMask';
    nCompo = 30;
    Tr = 2.4;
    nameNeuronalData = 'neu.nii';
    nameNonNeuronalData = 'nonneu.nii';
    denoiseImage(dataDir,maskName,nCompo,Tr,nameNeuronalData,nameNonNeuronalData);