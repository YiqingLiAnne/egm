function out_limit = check_constraint(vertices_to_check,input_lowerLimit,input_upperLimit)
    % check_constraint checks whether the vertices are out of the boundary.
    % check_constraint(vertices_to_check,input_lowerLimit,input_upperLimit)
    % returns the logical numbers out_limit to indicate whether the
    % vertices in vertices_to_check are out of the input boundary
    % (input_lowerLimit,input_upperLimit).
    %
    % Yiqing Li, 10/20/2020
    %
    % See also evaluate_vertices, punish_outLimit.

    % Copyright: 2020 Yiqing Li(anne.yiqing.li@outlook.com)
    % CC-BY-SA

    %% Initialize    
    out_limit = [];
    
    %% Check
    for i = 1:size(vertices_to_check)
        vertex = vertices_to_check(i,:);
        if all(vertex <= input_upperLimit)&& all(vertex>= input_lowerLimit)
            out_limit(i) = 0;
        else
            out_limit(i) = 1;
        end
    end
    
    %% Output    
    out_limit = logical(out_limit);
    
end