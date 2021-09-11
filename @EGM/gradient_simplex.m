function [simplexInput,simplexCost,simplex_vertices,simplex_vertices_cost,simplexOperation] = gradient_simplex(EGM)
    % gradient_simplex    EGM method for exploit.
    % egm.gradient_simplex calls the object Gsimplex to exploit the local
    % minimum and outputs better simplex vertices simplexInput and
    % corresponding costs simplexCost, tested vertices
    % simplex_vertices_cost during exploit and corresponding operation
    % simplexOperation as well as costs simplex_vertices_cost, 
    %
    % Yiqing Li, 10/20/2020
    %
    % See also EGM, Gsimplex, exploration_sample, update_footprint.

    % Copyright: 2020 Yiqing Li(anne.yiqing.li@outlook.com)
    % CC-BY-SA
    
    %% Parameters
    gradient_Nstep = EGM.param.gradient_Nstep;
    round_N = EGM.roundID;
    inputDimen = EGM.param.inputDimen;
    costDimen = EGM.param.costDimen;
    upperLimit = EGM.param.upperLimit;
    lowerLimit = EGM.param.lowerLimit;
    simplexParam = EGM.param.simplexParam;
    
    %% Gradient method with simplex  
    % Initialize
    G_simplex = Gsimplex(upperLimit,lowerLimit,simplexParam);
    G_simplex.table = EGM.table;    
    G_simplex.currentSimplex = EGM.group{1,round_N}.simplex_best;
    G_simplex.vertices_record = [];
    G_simplex.vertices_cost = [];
    G_simplex.vertices_operation = [];
    % Simplex step
    G_simplex.Gsimplex_run(gradient_Nstep);
    simplexInput = G_simplex.currentSimplex(:,1:inputDimen);
    simplexCost = G_simplex.currentSimplex(:,costDimen);
    simplex_vertices = G_simplex.vertices_record ;
    simplex_vertices_cost = G_simplex.vertices_cost;
    simplexOperation = G_simplex.vertices_operation;
    
    %% Update the footprints
    newVertices = simplexInput;
    update_footprint(EGM,newVertices);
    
end