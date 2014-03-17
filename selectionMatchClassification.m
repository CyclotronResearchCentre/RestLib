% COMA Science Group - University of Liege
% Francisco Gomez J - 2001
% Performs a matching and classification procedures
% 
% dirData: dir name with data comming from groupICA
% nameMask: Mask name
% namesTemplate: Names of the templates
% indexNeuronal: Index of neuronal data
% nCompo: Number of components
% Tr: Repetition time
function [assignation maxGoF] = selectionMatchClassification(dirData,nameMask,time_course_name,namesTemplate,indexNeuronal,nCompo,Tr, restlib_path)
    dataAllFeature = computeGOF(dirData,namesTemplate,nameMask,indexNeuronal,restlib_path);    
    [x As f] = matchingComponents(dataAllFeature);
    A = dataAllFeature;
    [assignedMarks assignedProbs] = IC_selection(dirData,nCompo,nameMask,time_course_name,Tr, restlib_path);
    assignation = zeros(size(namesTemplate,2),5);
    for i=1:size(namesTemplate,2)
        assignation(i,:) = [i,find(As(:,i)==1),A(find(As(:,i)==1),i),assignedMarks(find(As(:,i)==1)),assignedProbs(find(As(:,i)==1))];
        %disp(sprintf('Template %d to component %d with GoF %f is neuronal prob=%f',i,find(As(:,i)==1),A(find(As(:,i)==1),i),assignedMarks(find(As(:,i)==1)),assignedProbs(find(As(:,i)==1))))
    end
    disp(sprintf('Total GoF %f',f*x))
    maxGoF = f*x;