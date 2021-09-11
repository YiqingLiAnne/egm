function Esample = Esample_run(Esample,roundSet)
    % Esample_run   Esample method for running the furthest exploration steps.
    % Esample.Esample_run(N) explores the N furthest samples one by one.
    %
    % The object Esample should be created first.
    %
    % Yiqing Li, 05/16/202
    %
    % See also Esample, generate_first_sample, sample_lhs,
    % select_furthest_sample, compute_set_distance.

    % Copyright: 2020 Yiqing Li(anne.yiqing.li@outlook.com)
    % CC-BY-SA
    
    %% Parameters
    input_upperLimit = Esample.param.upperLimit;
    input_lowerLimit = Esample.param.lowerLimit;    
    
    %% Initialize the old set
    round = 0;
    if isempty(Esample.oldSet) 
        sampleSize = 1;
        unitSample = generate_first_sample(Esample,sampleSize);
        % Project the unit sample to the real space
        Esample.newSample = return_real_domain(unitSample,input_lowerLimit,input_upperLimit);
        Esample.oldSet = Esample.newSample;
    end
    
    %% Explorative sample    
    while round < roundSet
        round  = round+1;
    % LHS sample set
        unitSet = sample_lhs(Esample);    
    % Project the unit set to the real space
        Esample.newSet = return_real_domain(unitSet,input_lowerLimit,input_upperLimit);
    % Compute the distance between new set and existed set
        compute_set_distance(Esample)
    % Select the furthest sample away the old set from the new set
        select_furthest_sample(Esample)        
    % Add the new sample into old set
        Esample.oldSet = [Esample.oldSet;Esample.newSample];    
    end
    
end
