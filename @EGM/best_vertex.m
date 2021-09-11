function best_vertex(EGM)
    % best_vertex   EGM Method for displaying the best vertex information.
    % egm.best_vertex prints the information including the control
    % variables and cooresponding cost.
    %
    % Yiqing Li, 10/20/2020
    %
    % See also EGM, best_vertices.

    % Copyright: 2020 Yiqing Li(anne.yiqing.li@outlook.com)
    % CC-BY-SA
    
    %% Parameters
    latestRoundID = length(EGM.group);
    latest_simplex = EGM.group{1,end}.simplex_best;
    latest_cost = EGM.group{1,end}.cost_best;
    inputDimen = EGM.param.inputDimen;
    
    %% Minimum
    [bestCost,bestI] = min(latest_cost);
    bestVertex = latest_simplex(bestI,:);
    
    %% Print
    fprintf('\n')
    fprintf('Best vertex after %i rounds\n',latestRoundID)
    fprintf('   Its cost : %.4g\n',bestCost)
    fprintf('   Vertex input(control variables):')
    fprintf('\n')
    for q=1:inputDimen
        fprintf('      b%i = ',q)
        fprintf('%i',bestVertex(q))
        fprintf('\n')
    end
    fprintf('\n')
    
end