function J_out = evaluate_group(EGM,input_to_evaluate)
    % evaluate_group	EGM method for vertices evaluation.
    % egm.evaluate_group(A) evaluates the M vertices with N variables
    % in vector A, which is M rows * N columns, and ouputs the
    % corresponding costs vectors J_out.
    % egm.evaluate_group evaluates the unevaluated vertices of the first
    % EGM group, and ouputs the corresponding costs J_out.
    %    
    % Yiqing Li, 10/20/2020
    % 
    % See also EGM, go, exploration_sample.

    % Copyright: 2020 Yiqing Li(anne.yiqing.li@outlook.com)
    % CC-BY-SA

    %% Parameters
    round_ongoing = EGM.roundID + 1;    
    if round_ongoing == 1
        input_to_evaluate = EGM.group{1,round_ongoing}.vertices;
    end
    
    %% Compute the cost    
    J_out = evaluate_vertices(EGM.table,input_to_evaluate);

    if round_ongoing == 1          
        EGM.group{1,round_ongoing}.cost = J_out;
    end
    
end
