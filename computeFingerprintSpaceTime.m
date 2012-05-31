% COMA Science Group - University of Liege
% Francisco Gomez J - 2011
% Katherine Baquero - 2011
% Computes a fingerprint for the ICA component
%
% ICComponent: Spatial data of the component
% temporalComponent: Temporal data of the component
% mask: Mask data
% Tr: Repetition Time
function [feature dataZ temporalData] = computeFingerprintSpaceTime(ICComponent,temporalComponent,mask,Tr)
    %Normalization of the temporal data
    mean_TC=mean(temporalComponent);
    std_TC=std(temporalComponent);
    temporalData = (temporalComponent-mean_TC)./std_TC;

    pearsonCoeffR = xcorr(temporalData,1,'coeff');
    pearsonCoeff = abs(pearsonCoeffR(1,1));
    
    % entropy
    p = hist(temporalData);
    p(p==0) = [];
    % normalize p so that sum(p) is one.    
    p = p ./ numel(temporalData);    
    %normalized entropy
    entropyTemporal = exp(abs(-sum(p.*log2(p))));
    
    % sampling frequency
    Fs = 1/Tr;
    [Pxx,w] = pwelch(temporalData,33,32,[],Fs,'onesided');    
    pxDbHxz = (Pxx);    
    spectrumBand1 = sum(pxDbHxz(find(w>=0 & w<=0.008)));
    spectrumBand2 = sum(pxDbHxz(find(w>=0.008 & w<=0.02)));
    spectrumBand3 = sum(pxDbHxz(find(w>=0.02 & w<=0.05)));
    spectrumBand4 = sum(pxDbHxz(find(w>=0.05 & w<=0.1)));
    spectrumBand5 = sum(pxDbHxz(find(w>=0.1 & w<=0.25)));
    
    %Normalized SpectrumBand:
    spectrumBand=[spectrumBand1 spectrumBand2 spectrumBand3 spectrumBand4 spectrumBand5];

    %% Spatial Features    
    dataZ = ICComponent(mask ~= 0);

    % characterization with only the RoI filtered
    meanData = mean(dataZ);
    % kurtosis
    kurt = kurtosis(dataZ);
    kurt =abs(log(kurt));
    % skewness
    skew = skewness(dataZ);    
    skew =abs(log(skew)); 
    % entropy
    p = hist(dataZ);
    p(p==0) = [];
    % normalize p so that sum(p) is one.    
    p = p ./ numel(dataZ);    
    entro = -sum(p.*log2(p));
    %normlizada
    entro = abs(log(entro));
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%
%     global labelD;
%     figure
% %     subplot(2,1,1);    
%     bar(p)    
%     title(sprintf('isneuronal = %d',labelD))
%     [kurt labelD]
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%
    options = optimset('display', 'off', 'TolX', 1e-6, 'MaxIter', 10);
    dataZ(:) = (dataZ(:)-mean(mean(dataZ(:))));
%    [ahat, bhat] = ggmle(dataZ(:), options);
    
    ratioVal = (spectrumBand2 + spectrumBand3)/(spectrumBand1 + spectrumBand4  + spectrumBand5);
    feature = [kurt skew entro pearsonCoeff entropyTemporal spectrumBand ratioVal];

    
