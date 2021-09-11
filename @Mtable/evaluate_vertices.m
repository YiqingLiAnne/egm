function J_out = evaluate_vertices(Mtable,vertices_to_evalue)
    % evaluate_vertices   Mtable method for vertices evaluation.
    % J_out = evaluate_vertices(obj,vertices_to_evalue) returns the costs
    % of vertices_to_evalue.
    %
    % Yiqing Li, 10/20/2020
    % See also Mtable, punish_outLimit, find_vertices, add_vertices.

    % Copyright: 2020 Yiqing Li(anne.yiqing.li@outlook.com)
    % CC-BY-SA

    %% Parameters
    upperLimit = Mtable.param.upperLimit;
    lowerLimit = Mtable.param.lowerLimit;  
    inputDimen = Mtable.param.inputDimen;
    costDimen = Mtable.param.costDimen;
    vertices_to_evalue = vertices_to_evalue;
    vertices_to_evalue0 = vertices_to_evalue;
    
    
    %% Plant function
    eval(['Plant=@',Mtable.param.evaluationFunction,'_problem;']); 
    
    %% Check existed vertices
    [existedFlag,existedIndex] = find_vertices(Mtable, vertices_to_evalue);
    if any(existedFlag)
        existedIndex(existedIndex == 0) = [];
        vertices_evalued = Mtable.table_to_visit(existedIndex,:); 
    else
        vertices_evalued = [];
    end
    vertices_to_evalue(existedFlag,:) = [];
    
    %% Check the limit
    out_limit_flag = check_constraint(vertices_to_evalue,lowerLimit,upperLimit);
    vertices_to_punish = vertices_to_evalue(out_limit_flag,:);
    punishedVertices = punish_outLimit(Mtable,vertices_to_punish);
    vertices_evalued = [vertices_evalued;punishedVertices]; 
    vertices_to_evalue(out_limit_flag,:) = [];
    
    %% Compute the cost
    vertSize = size(vertices_to_evalue, 1);
    J_compute = arrayfun(@(i) Plant(vertices_to_evalue(i, :)), 1:vertSize);
    vertices_evalued = [vertices_evalued; vertices_to_evalue J_compute'];
    
    %% Return J
    [lia,loc] = ismember(vertices_to_evalue0,vertices_evalued(:,1:inputDimen),'rows');
    vertices_to_evalue0(lia,costDimen) = vertices_evalued(loc,costDimen);
    J_out = vertices_to_evalue0(:,costDimen);
    J_out = J_out;
    
    %% Add the vertices_to_evalue to table
    add_vertices(Mtable,vertices_evalued);

end
