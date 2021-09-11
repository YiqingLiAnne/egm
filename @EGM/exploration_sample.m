function [sampleInput,sampleCost] = exploration_sample(EGM)
    % exploration_sample    EGM method for exploration.
    % egm.exploration_sample calls the object Esample to study a furthest 
    % LHS sample away from all previous vertices studied by exploit and exploration.
    %
    % Yiqing Li, 10/20/2020
    %
    % See also EGM, Esample, gradient_simplex, update_footprint.

    % Copyright: 2020 Yiqing Li(anne.yiqing.li@outlook.com)
    % CC-BY-SA
    
    %% Parameter
    exploration_Nstep = EGM.param.exploration_Nstep;
    upperLimit = EGM.param.upperLimit;
    lowerLimit = EGM.param.lowerLimit;
    sampleSize = EGM.param.sampleSetSize;

    %% Explore  
    E_sample = Esample(upperLimit,lowerLimit,sampleSize);
    E_sample.oldSet = EGM.footprints;
    E_sample.Esample_run(exploration_Nstep);
    sampleInput = E_sample.newSample;
    
    %% Evaluate the exploration
    sampleCost = evaluate_group(EGM,sampleInput);
    
    %% Update the footprints
    newVertices = sampleInput;
    update_footprint(EGM,newVertices);
    
end