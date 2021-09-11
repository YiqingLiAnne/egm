classdef EGM < handle
    % EGM   EGM object constructor
    % The properties contains:
    % group---vertices information during optimization;
    % footprints---the record of EGM exploit and exploration steps;
    % param---parameters of EGM;
    % table---data base including all the tested vertices and their costs;
    % roundID---indicator of EGM iteration ;
    % version;
    % 
    % egm = EGM initializes a EGM object with the default parameters in the
    % variable egm;
    % egm = EGM('new_problem') uses new parameters created by a new file
    % new_problem_parameters.m;
    % Then run 'egm.go(N)' to evolve the egm group for N rounds.
    %
    % Yiqing Li, 10/20/2020
    %
    % See also Esample, go, Gsimplex, Mtable.

    % Copyright: 2020 Yiqing Li(anne.yiqing.li@outlook.com)
    % CC-BY-SA
    
    %% Properties
    properties
        % EGM group
            group
        % EGM exploration and exploit steps
            footprints
        % EGM parameters
            param
        % Data base
            table
        % Indicator of EGM iteration
            roundID
        % Version
            version = '0.1.2.4';
    end
    
    %% Eternal methods
    methods
        % Save and load
        save_results(obj,name_of_saved_obj)
        obj = load_obj(obj,name_of_the_run,name_of_saved_egm);
        % Main
        obj = go(obj,roundSET);
        % Vertices related
        initialize_group(obj);
        generate_simplex(obj);
        generate_group(obj);
        evolve_group(obj);
        [sampleInput,sampleCost] = exploration_sample(obj);
        [simplexInput,simplexCost,simplex_vertices,simplex_vertices_cost,simplexOperation] = gradient_simplex(obj);
        J_out = evaluate_group(obj,input_to_evaluate);
        [simplexInput,simplexCost,betterFlag] = decide_better_simplex(obj,simplexInput,simplexCost,sampleInput,sampleCost);
        update_the_group(obj,verticesInput,cost,operation,simplex_best,cost_best,egmStep);
        update_footprint(obj,newVertices);        
        % Post processing
        best_vertex(obj);
        best_vertices(obj, until_Nround, Nbest);
        learningCurve(obj,data_ref);
        controlLandscape(obj,roundID);
        printFigure(obj,name_of_figrue);
        % Others
        show_problem(obj);
    end    
    
    %% Internal methods
    methods
        % Constructor
        function obj = EGM(new_problem)
            if nargin < 1
                obj.param = default_parameters;
            else
                eval(['obj.param =',new_problem,'_parameters();']); 
            end
            obj.group = [];
            obj.table = Mtable(obj.param);
            
            if obj.param.defineInitialIndiv == 1
                % Personal starting simplex
                obj.group{1,1}.vertices = obj.param.initialIndiv;
                obj.group{1,1}.cost = [];
                obj.roundID = 1;    
            else
                % Random starting simplex        
                obj.roundID = 0;                
            end                
            
            obj.show_problem;           
    
        end
        
        % Get method
        function val = get(obj,prop)
            if (nargin < 1 || nargin > 2)
                print_usage ();
            end
            if (nargin ==1)
                val=obj;
            else
                if (~ ischar(prop))
                    error ('@NumHandle/get: PROPERTY must be a string');
                end
                switch (prop)
                    case 'group'
                        val = obj.group;
                    case 'footprints'
                        val = obj.footprints;
                    case 'param'
                        val = obj.param;
                    case 'table'
                        val = obj.table;
                    case 'roundID'
                        val = obj.roundID;
                    case 'version'
                        val = obj.version;
                    otherwise
                        error ('@NumHandle/get: invalid PROPERTY "%s"',prop);
                end
            end
        end

        % Set method
        function pout = set (obj,varargin)
            if (numel (varargin) < 2 || rem (numel(varargin),2) ~=0)
                error ('@NumHandle/set: expecting PROPERTY/VALUE pairs');
            end
            pout = obj;
            while (numel (varargin) > 1)
                prop = varargin{1};
                val = varargin{2};
                varargin(1:2) = [];
                if (~ ischar(prop))
                    error ('@NumHandle/set : invalid PROPERTY for EGM class');
                end
                switch (prop)
                    case 'group'
                        obj.group = val;
                    case 'footprints'
                        obj.footprints = val;
                    case 'param'
                        obj.param = val;
                    case 'table'
                        obj.table = val;
                    case 'roundID'
                        obj.roundID = val;
                    case 'version'
                        obj.version = val;
                    otherwise
                        error ('@NumHandle/set: invalid PROPERTY for EGM class');
                end
            end
        end
    end 
    
end
