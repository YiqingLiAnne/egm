function [existedFlag,existedIndex] = find_vertices(Mtable,new_vertices)
    % find_vertices   Mtable method for retrieving vertices to evaluate in
    % the evaluted vetices.
    % [existedFlag,existedIndex] = Mtable.find_vertices(new_vertices) looks
    % for new_vertices in Mtable.table_to_visit and returns the logic
    % number existedFlag, location ID existedIndex.
    %
    % Yiqing Li, 10/20/2020
    % See also Mtable, evaluate_vertices,punish_outLimit.

    % Copyright: 2020 Yiqing Li(anne.yiqing.li@outlook.com)
    % CC-BY-SA

    %% Parameters
    dim = Mtable.param.inputDimen;

    %% Check
    if isempty(Mtable.table_to_visit)
        existedFlag = logical(zeros(size(new_vertices,1),1));
        existedIndex = zeros(size(new_vertices,1),1);
    else
        objBase = Mtable.table_to_visit(:,1:dim);
        [lia,loc] = ismember(new_vertices(:,1:dim),objBase,'rows');
        existedFlag = lia;
        existedIndex = loc;
    end
    
end