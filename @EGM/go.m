function EGM = go(EGM,roundSET)
    % go    EMG method for starting evolutions.
    % egm.go(N_round) starts N_round evolutions of EGM group.
    %
    % Examples:
    %   % evolve the EGM group for 10 round
    %   egm.go(10)
    %
    % Before this, 
    % run 'Initialization' script to load useful path;
    % run 'egm = EGM' to create an EGM object.
    %
    % Yiqing Li, 10/20/2020
    %
    % See also EGM, save_results, load_obj.

    % Copyright: 2020 Yiqing Li(anne.yiqing.li@outlook.com)
    % CC-BY-SA

    Action = tic;
   
    %% Read the existed data and start
    if EGM.roundID == 0
        round_record = 0;
        EGM.initialize_group;
        EGM.generate_group;
        EGM.evaluate_group;
        EGM.update_the_group;
        EGM.update_footprint;   
        round_ongoing = round_record + 1;
    elseif isempty(EGM.group{1,1}.cost)
            EGM.roundID = 0;
            round_record = 0;            
        if isempty(EGM.group{1,1}.vertices)
            EGM.initialize_group;
            EGM.generate_group;
        end
        EGM.evaluate_group;
        EGM.update_the_group;        
        EGM.update_footprint;        
        round_ongoing = round_record + 1;
    else
        round_record = length(EGM.group)-1;
        round_ongoing = round_record + 1;
    end
            
    %% Iteration
    EGM_roundSET = roundSET + 1;
    while EGM.roundID < EGM_roundSET
        EGM_round = round_ongoing;
        fprintf([' Round ',num2str(EGM_round),' starts \n'])        
        EGM.evolve_group;
        if EGM.param.instantSave == true
            save_results(EGM,'instant_save')
        end    
        fprintf([' Round ',num2str(EGM_round),' ends and is saved \n'])        
        round_ongoing = round_ongoing + 1;       

%         simplex_convergence = EGM.compute_convergence;
%         if simplex_convergence < convergenceSet
%             break;
%         end
    end
        
    %% Print
    % Computation time
    End = toc(Action);
    fprintf([num2str(round_ongoing-1-round_record),' round(s) of EGM evolution costs ',num2str(End),' seconds\n'])
    EGM.best_vertex;

end