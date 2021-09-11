function unitSet = sample_lhs(Esample)
    % sample_lhs   Esample method for generating the sample set by LHS.
    %
    % Yiqing Li, 10/20/2020
    %
    % See also Esample, select_furthest_sample, Esample_run.

    % Copyright: 2020 Yiqing Li(anne.yiqing.li@outlook.com)
    % CC-BY-SA
    
    %% Parameters
    setSize  = Esample.param.sampleSetSize;
    dim = Esample.param.inputDimen;
    
    %% LHS sample
    unitSet = lhsdesign(setSize,dim)-0.5;

end