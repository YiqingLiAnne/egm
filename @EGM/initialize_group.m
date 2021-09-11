function initialize_group(EGM)
    % initalize_group   EGM method for EGM.group initialization.
    %
    % Yiqing Li, 10/20/2020
    %
    % See also EGM, go, evolve_group, update_the_group.

    % Copyright: 2020 Yiqing Li(anne.yiqing.li@outlook.com)
    % CC-BY-SA

    %% Parameters    
    round_ongoing = EGM.roundID + 1;
    
    %% Update    
    EGM.group{1,round_ongoing}.round = [];
    EGM.group{1,round_ongoing}.vertices = [];
    EGM.group{1,round_ongoing}.cost = [];
    EGM.group{1,round_ongoing}.operation = [];
    EGM.group{1,round_ongoing}.simplex_best = [];
    EGM.group{1,round_ongoing}.cost_best = [];
    EGM.group{1,round_ongoing}.egmStep = [];       
    
end