classdef Esample < handle
    % Esample   Esample object constructor
    % The properties contains:
    % param---parameters of Esample;    
    % oldSet---the existed data points;
    % newSet---new data points sampled by LHS;
    % distanceMap---the distance between data points in data set newSet and
    % those in oldSet;
    % newSample---The furthest data point chosen from newSet away from oldSet;
    % 
    % Esample = Esample(upperLimit,lowerLimit,sampleSize) initializes a
    % Esample object with the parameters indicating
    % boundary(upperLimit,lowerLimit) and density of LHS
    % sampleing(sampleSize).
    %    
    % Then run 'Esample.Esample_run(N)' to get N furthest points away from
    % the current data set among LHS samples.
    %
    % Yiqing Li, 10/20/2020
    % See also EGM, exploration_sample.

    % Copyright: 2020 Yiqing Li(anne.yiqing.li@outlook.com)
    % CC-BY-SA
    
    %% Properties
    properties 
        
        % Parameters of Esample
        param
        % The existed data points
        oldSet
        % New data points sampled by LHS
        newSet
        % The distance between data points in data set newSet and those in oldSet
        distanceMap
        % The furthest data point chosen from newSet away from oldSet
        newSample
    
    end
    
    %% Eternal methods
    methods
        
        % Main
        obj = Esample_run(obj,roundSet);
        % Others
        unitSample = generate_first_sample(obj,sampleSize);
        unitSet = sample_lhs(obj);
        compute_set_distance(obj);
        select_furthest_sample(obj);        
        
    end
    
    %% Internal methods
    methods
        
        % Constructor
        function obj = Esample(upperLimit,lowerLimit,sampleSize)
                obj.param.upperLimit = upperLimit;
                obj.param.lowerLimit = lowerLimit;
                obj.param.inputDimen = length(obj.param.upperLimit);
                obj.param.sampleSetSize = sampleSize;
        end     
        
    end
    
end