function evolve_group(EGM)
    % evolve_group	EGM method for group evolution,
    % egm.evolve_group evolves the EGM group by one step of exploit and one
    % step of exploraiton.
    %    
    % Yiqing Li, 10/20/2020
    % 
    % See also EGM, save_results, load_obj.

    % Copyright: 2020 Yiqing Li(anne.yiqing.li@outlook.com)
    % CC-BY-SA

    %% EGM steps
    % Gradient simplex
    if EGM.param.gradient_Nstep ~= 0
        [simplexInput,simplexCost,simplex_vertices,simplex_vertices_cost,simplexOperation] = gradient_simplex(EGM);
    end
    % Explorative sample
    if EGM.param.exploration_Nstep ~= 0
        [sampleInput,sampleCost] = exploration_sample(EGM);
        sampleOperation = 'sample';
        [simplexInput_best,simplexCost_best,betterFlag] = decide_better_simplex(EGM,simplexInput,simplexCost,sampleInput,sampleCost);
    else
        sampleInput = [];
        sampleCost = [];
        sampleOperation = 'valid';
        simplexInput_best = simplexInput;
        simplexCost_best = simplexCost;
        betterFlag = false;
    end
    %% Update group
    % Record
    simplex_best = simplexInput_best;
    cost_best = simplexCost_best;
    verticesInput = [simplex_vertices; sampleInput];
    verticeCost = [simplex_vertices_cost; sampleCost];
    operation = simplexOperation;
    operation{end+1,1} = sampleOperation;
    % The status of EGM step
    if true(betterFlag)
        egmStep = 'explore';
    else
        egmStep = 'exploit';
    end
    % Initialize a  new group of the ongoing round and update it
    initialize_group(EGM);
    update_the_group(EGM,verticesInput,verticeCost,operation,simplex_best,cost_best,egmStep);    
    
end