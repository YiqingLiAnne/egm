function update_the_group(EGM,verticesInput,cost,operation,simplex_best,cost_best,egmStep)
    % update_the_group      EGM method for updating the group information.
    % egm.update_the_group(verticesInput,cost,operation,simplex_best,cost_best,egmStep)
    % updates the properties of egm.group{1,N}, where N means the Nth round of EGM.
    %
    % Yiqing Li, 10/20/2020
    %
    % See also EGM, evolve_group, generate_group, go.

    % Copyright: 2020 Yiqing Li(anne.yiqing.li@outlook.com)
    % CC-BY-SA

    %% Parameters    
    EGM.roundID = EGM.roundID + 1;
    EGM.group{1,EGM.roundID}.round = EGM.roundID;

    %% Update the properties of EGM.group    
    if EGM.roundID == 1        
        EGM.group{1,EGM.roundID}.simplex_best = EGM.group{EGM.roundID}.vertices;
        EGM.group{1,EGM.roundID}.cost_best = EGM.group{EGM.roundID}.cost;       
        EGM.group{1,EGM.roundID}.egmStep = 'initialize';
    else
        EGM.group{1,EGM.roundID}.vertices = verticesInput;
        EGM.group{1,EGM.roundID}.cost = cost;        
        EGM.group{1,EGM.roundID}.operation = operation;
        EGM.group{1,EGM.roundID}.simplex_best = simplex_best;
        EGM.group{1,EGM.roundID}.cost_best = cost_best;
        EGM.group{1,EGM.roundID}.egmStep = egmStep;
    end
    
end