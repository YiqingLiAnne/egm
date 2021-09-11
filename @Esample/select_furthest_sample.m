function select_furthest_sample(Esample)
    % select_furthest_sample   Esample method for selecting the furthest
    % sample from LHS sample set away from the old set Esample.oldSet.
    %
    % Yiqing Li, 10/20/2020
    % See also Esample, sample_lhs, compute_set_distance.

    % Copyright: 2020 Yiqing Li(anne.yiqing.li@outlook.com)
    % CC-BY-SA
    

    %% Parameters
    distanceMap = Esample.distanceMap;    
    
    %% Compute the minimum distance of each new sample to the old set
    [minDist,~] = min(distanceMap,[],2);
    
    %% Select the sample with the maximum distance among the above set
    [~,loc] = max(minDist);
    Esample.newSample = Esample.newSet(loc,:);
    
end