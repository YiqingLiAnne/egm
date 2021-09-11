function sort_vertex(Gsimplex)
    % sort_vertex 	Gsimplex method for sorting the vertices in a simplex
    % according to their costs.
    %  
    % Yiqing Li, 10/20/2020
    % See also Esimplex, Gsimplex_run.

    % Copyright: 2020 Yiqing Li(anne.yiqing.li@outlook.com)
    % CC-BY-SA
    

    %% Parameters        
    costDimen = Gsimplex.param.costDimen;
    simplexCost = Gsimplex.currentSimplex(:,costDimen);
    
    %% Minimal cost and location
    [minVal,minIndex] = min(simplexCost);  
    Gsimplex.bestVertex.cost = minVal;
    Gsimplex.bestVertex.ID = minIndex;
    
    %% Maximal cost and location
    [maxVal,maxIndex] = max(simplexCost);
    Gsimplex.worstVertex.cost = maxVal;
    Gsimplex.worstVertex.ID = maxIndex;

end