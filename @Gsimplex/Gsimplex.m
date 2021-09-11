classdef Gsimplex < handle
    % Gsimplex 	Gsimplex object constructor
    % The properties contains:
    % param---Gsimplex parameters;    
    % currentSimplex---the updated simplex during optimization;
    % bestVertex---the best vertex with the minimum cost in currentSimplex;
    % worstVertex---the worst vertex with the maximum cost in currentSimplex;
    % centroid---the centroid of the vertices opposite to worstVertex in currentSimplex;
    % nextVertex---the first point during simplex step(mirror point of worstVertex);
    % next2Vertex---the second point achieved by simplex step(contract or expand); 
    % vertices_record---the tested vertices during the simplex steps;
    % vertices_cost---the costs of the tested vertices vertices_record;
    % vertices_operation---the operations that generates vertices_record;
    % table---the database;
    % 
    % obj = Gsimplex(upperLimit,lowerLimit,simplexParam) initializes a
    % Gsimplex object with the parameters including
    % boundary(upperLimit,lowerLimit) and initial vertices(simplexParam).
    % Then run 'Gsimplex.Gsimplex_run(N)' to evolve the vertices by N
    % downhill simplex steps.
    %
    % Yiqing Li, 10/20/2020
    % See also EGM, Mtable, gradient_simplex.

    % Copyright: 2020 Yiqing Li(anne.yiqing.li@outlook.com)
    % CC-BY-SA

    properties
        % Gsimplex parameters
        param
        % The updated simplex during optimization
        currentSimplex
        % The best vertex with the minimum cost in currentSimplex
        bestVertex
        % The worst vertex with the maximum cost in currentSimplex
        worstVertex
        % The centroid of the vertices opposite to worstVertex in currentSimplex
        centroid
        % The first point during simplex step
        nextVertex
        % The second point achieved by simplex step
        next2Vertex  
        % The tested vertices during the simplex steps
        vertices_record
        % The costs of the tested vertices vertices_record
        vertices_cost
        % The operations that generates vertices_record
        vertices_operation
        % The database
        table
        
    end
    
%% External function
    methods
        
        % Main
        obj = Gsimplex_run(obj,roundSet)
        % Downhill simplex steps
        mirror(obj)
        contract(obj)
        expand(obj)
        shrink(obj)   
        % Others
        sort_vertex(obj)
        get_opposite_centroid(obj)
      
    end
    
%% Internal function
    methods
        
        function obj = Gsimplex(upperLimit,lowerLimit,simplexParam)
            % Problem parameters
            obj.param.upperLimit = upperLimit;
            obj.param.lowerLimit = lowerLimit;
            obj.param.inputDimen = length(upperLimit);
            obj.param.costDimen = obj.param.inputDimen + 1;
            obj.param.simplexSize = obj.param.inputDimen + 1;
            % Gsimplex param           
            obj.param.simplexMirrorStep = simplexParam(1);
            obj.param.simplexContractStep = simplexParam(2);
            obj.param.simplexExpandStep = simplexParam(3);
            obj.param.simplexShrinkStep = simplexParam(4);
        end
        
    end

end