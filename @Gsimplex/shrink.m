function shrink(Gsimplex)
    % shrink 	Gsimplex method for shrinking all the other vetices towards
    % the best vertex with the minimum cost.
    %  
    % Yiqing Li, 10/20/2020
    % See also Esimplex, Gsimplex_run, contract.

    % Copyright: 2020 Yiqing Li(anne.yiqing.li@outlook.com)
    % CC-BY-SA

    %% Parameter    
    shrinkStep = Gsimplex.param.simplexShrinkStep;
    minIndex = Gsimplex.bestVertex.ID;
    inputDimen = Gsimplex.param.inputDimen;   
    costDimen = Gsimplex.param.inputDimen + 1;
    simplexInput = Gsimplex.currentSimplex(:,1:inputDimen);
    bestInput = simplexInput(minIndex,1:inputDimen);
    
    %% Shrink
    newSimplex(:,1:inputDimen) = simplexInput(minIndex,:) + shrinkStep * (simplexInput - bestInput);
    J = evaluate_vertices(Gsimplex.table,newSimplex);
    newSimplex(:,costDimen) = J;    
    
    %% Update
    Gsimplex.currentSimplex = newSimplex;
    shrinkInput = newSimplex(:,1:inputDimen);
    shrinkInput(minIndex,:) = [];
    shrinkCost = newSimplex(:,costDimen);
    shrinkCost(minIndex,:) = [];
        
    Gsimplex.vertices_record = [Gsimplex.vertices_record;shrinkInput];
    Gsimplex.vertices_cost = [Gsimplex.vertices_cost;shrinkCost];
    Gsimplex.vertices_operation(end+1:end+inputDimen,1) = {'shrink'};

end