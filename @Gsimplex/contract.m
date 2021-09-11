function contract(Gsimplex)
    % contract 	Gsimplex method for contraction step in downhill simplex.
    %  
    % Yiqing Li, 10/20/2020
    % See also Esimplex, Gsimplex_run, mirror.

    % Copyright: 2020 Yiqing Li(anne.yiqing.li@outlook.com)
    % CC-BY-SA
    
    %% Parameters
    contractStep = Gsimplex.param.simplexContractStep;
    centroid = Gsimplex.centroid;
    maxIndex = Gsimplex.worstVertex.ID;
    inputDimen = Gsimplex.param.inputDimen;    
    simplexInput = Gsimplex.currentSimplex(:,1:inputDimen);
    
    %% Contract
    contractInput = centroid + contractStep * (simplexInput(maxIndex,1:inputDimen) - centroid);
    contractCost = evaluate_vertices(Gsimplex.table,contractInput);

    %% Update Gsimplex
    Gsimplex.next2Vertex = [contractInput contractCost];
    Gsimplex.vertices_record = [Gsimplex.vertices_record;contractInput];
    Gsimplex.vertices_cost = [Gsimplex.vertices_cost;contractCost];
    Gsimplex.vertices_operation{end+1,1} = 'contract';
    
end