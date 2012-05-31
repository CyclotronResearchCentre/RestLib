% COMA Science Group - University of Liege
% Katherine Baquero - 2011
% Computes the GoF of a component using a template and a mask
%
% template: data of the template
% dataCompo: spatial data of the component
% mask: masking
% fit: GoF Value
function [fit] = computeGodFit(template,dataCompo,mask)
    data=dataCompo(logical(mask));
    template_f=template(logical(mask));

    data_out=data(template_f == 0);
    data_in=data(template_f > 0);

    n_data_out=size(data_out,1);
    n_data_in=size(data_in,1);

    sdata_out=sum(data_out);
    sdata_in=sum(data_in);

    fit = sdata_in/n_data_in - sdata_out/n_data_out;
