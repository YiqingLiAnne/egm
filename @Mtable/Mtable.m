classdef Mtable < handle
    % Mtable 	Mtable object constructor
    % The properties contains:
    % param---Mtable parameters;    
    % table_to_visit---table of all evaluated vertices;
    % 
    % obj = Mtable(new_problem) initializes a Mtable object with the
    % parameters given in 'new_problem_parameters.m'.
    %
    % Yiqing Li, 10/20/2020
    % See also EGM, gradient_simplex, Gsimplex.

    % Copyright: 2020 Yiqing Li(anne.yiqing.li@outlook.com)
    % CC-BY-SA

    %% Properties
    properties
        
        % Mtable parameters
        param
        % table of all evaluated vertices
        table_to_visit

    end
    
    %% External methods
    methods
        
        add_vertices(obj,vertices);
        [existedFlag,existedIndex] = find_vertices(obj,new_vertices);
        J_out = evaluate_vertices(obj,vertices_to_evalue);
        punishedVertices = punish_outLimit(obj,vertices_to_punish);
        
    end
    
    %% Internal methods
    methods
        
        % Constructor
        function obj = Mtable(parameters)
            % Inherit Parametes
            obj.param.upperLimit = parameters.upperLimit;
            obj.param.lowerLimit = parameters.lowerLimit;
            obj.param.inputDimen = parameters.inputDimen;
            obj.param.costDimen = parameters.costDimen;
            obj.param.evaluationFunction = parameters.evaluationFunction;
            obj.param.punishCost = parameters.punishCost;
            obj.param.importDataBase = parameters.importDataBase;
            % Initialize database
            if obj.param.importDataBase == 1 
                RunSaveName = parameters.runName;
                if exist(['save_runs/', RunSaveName, '/dataBase.mat']) == 2
                    load(['save_runs/', RunSaveName, '/dataBase.mat']);
                    obj.table_to_visit = dataBase;
                else
                    obj.table_to_visit = [];
                end         
            else
                obj.table_to_visit = [];
            end            
        end
        
    end

end
