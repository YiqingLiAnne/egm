function Gsimplex = Gsimplex_run(Gsimplex,roundSet)
    % Gsimplex_run 	Gsimplex method for runnning downhilll simplex steps.
    % Gsimplex.Gsimplex_run(N) runs N downhill simplex.
    % 
    % Yiqing Li, 10/20/2020
    % See also Gsimplex, mirror, contract, expand, shrink.

    % Copyright: 2020 Yiqing Li(anne.yiqing.li@outlook.com)
    % CC-BY-SA

    %% Parameters
    inputDimen = Gsimplex.param.inputDimen;
    costDimen = inputDimen + 1;    
    
    %% Initialize
    
    round = 0;
    J = evaluate_vertices(Gsimplex.table,Gsimplex.currentSimplex(:,1:inputDimen));
    Gsimplex.currentSimplex(:,costDimen) = J';
    
    %% Simplex steps
    while round < roundSet
        round = round + 1;   
        % Sort the best and worst vertex 
        sort_vertex(Gsimplex);
        % Find the centroid of the best side opposite to the worst vertex
        get_opposite_centroid(Gsimplex);
        % Find a better point
        % Mirror
        mirror(Gsimplex);             
        if Gsimplex.nextVertex(costDimen) >= Gsimplex.worstVertex.cost
            % Contract
            contract(Gsimplex);
            if Gsimplex.next2Vertex(costDimen) < Gsimplex.worstVertex.cost
                Gsimplex.currentSimplex(Gsimplex.worstVertex.ID,:) = Gsimplex.next2Vertex;
            else
                % Shrink
                shrink(Gsimplex);
            end
        elseif Gsimplex.nextVertex(costDimen) < Gsimplex.bestVertex.cost               
            % Expand
            expand(Gsimplex);
            if Gsimplex.next2Vertex(costDimen) < Gsimplex.nextVertex(costDimen)
                Gsimplex.currentSimplex(Gsimplex.worstVertex.ID,:) = Gsimplex.next2Vertex;
            else
                Gsimplex.currentSimplex(Gsimplex.worstVertex.ID,:) = Gsimplex.nextVertex;
            end
        else
            Gsimplex.currentSimplex(Gsimplex.worstVertex.ID,:) = Gsimplex.nextVertex;
        end
    end     
    
end