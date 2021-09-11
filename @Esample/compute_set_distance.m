function compute_set_distance(Esample)
    % compute_set_distance    Esample method for getting the Euclidean
    % distances between data points in data set Esample.newSet and those in
    % Esample.oldSet;
    %
    % Yiqing Li, 10/20/2020
    %
    % See also Esample, sample_lhs, select_furthest_sample.

    % Copyright: 2020 Yiqing Li(anne.yiqing.li@outlook.com)
    % CC-BY-SA
    
    %% Parameters
    newSet  = Esample.newSet;
    oldSet = Esample.oldSet;
    
    %% Compute distance matrix
    distMatr = pdist2(newSet,oldSet,'Euclidean');
    Esample.distanceMap = distMatr;
    
end