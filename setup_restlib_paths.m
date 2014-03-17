function setup_restlib_paths(restlib_path)
    weka_path = [restlib_path '/lib/weka.jar'];
    disp(sprintf('Adding %s to Matlab Java path',weka_path))
    javaaddpath(weka_path);
    
    svm_path = [restlib_path '/lib/libsvm.jar'];
    disp(sprintf('Adding %s to Matlab Java path',svm_path))
    javaaddpath(svm_path);

    nifti_lib_path = [restlib_path '/lib/NIfTI_20140122'];
    disp(sprintf('Adding %s to Matlab path',nifti_lib_path))
    addpath(nifti_lib_path)