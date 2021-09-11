function best_vertices(EGM, until_Nround, Nbest)
    % best_vertices   EGM method for displaying the best vertices information.
    % egm.best_vertices(8, 3) gives the best 3 vetices after 8 rounds
    % and prints the information including the control,
    % variables and cooresponding cost.
    %
    % Yiqing Li, 10/20/2020
    %
    % See also EGM, best_vertex.

    % Copyright: 2020 Yiqing Li(anne.yiqing.li@outlook.com)
    % CC-BY-SA
    
    %% Parameter
    inputDimen = EGM.param.inputDimen;
    costDimen = EGM.param.costDimen;    
    data_to_study = [];    
    
    if until_Nround > length(EGM.group)
        until_Nround = EGM.roundID;
    end

    for round = 1:until_Nround
        vertices = EGM.group{1,round}.vertices;
        cost = EGM.group{1,round}.cost;
        roundID = round*ones(length(cost),1);
        data_to_study = [data_to_study; roundID vertices cost];
    end
    
    %% Sort    
    [~,I] = sort(data_to_study(:,costDimen+1));
    data_to_study = data_to_study(I,:);
    dataSet_post = unique(data_to_study,'rows','stable'); 
    roundID_post = dataSet_post(:,1);
    verices_post = dataSet_post(:,2:costDimen+1-1);
    cost_post = dataSet_post(:,costDimen+1);

    %% Print
    for p = 1:Nbest
        switch p
            case 1
                ord = 'st';
            case 2
                ord = 'nd';
            case 3
                ord = 'rd';
            otherwise
                ord = 'th';
        end
        fprintf(['%i-',ord,' vertex:\n'],p)
        fprintf('   generated in group: %i\n',roundID_post(p))
        fprintf('   cost: %f\n',cost_post(p))
        fprintf('   vertex(control variables):')
        fprintf('\n')
        for q=1:inputDimen
            fprintf('      b%i = ',q)
            fprintf('%i',verices_post(q))
            fprintf('\n')
        end
        fprintf('\n')
    end
    
end