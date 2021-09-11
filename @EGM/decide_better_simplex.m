function [simplexInput,simplexCost,betterFlag] = decide_better_simplex(EGM,simplexInput,simplexCost,sampleInput,sampleCost)
    % decide_better_simplex     EGM method for deciding the best simplex after group evolution.
    % [simplexInput,simplexCost,betterFlag] = egm.decide_better_simplex(simplexInput,simplexCost,sampleInput,sampleCost)
    % updates the simplexInput and simplexCost with samplexInput and
    % sampleCost if samlpleCost is smaller than the maximum of simplexCost.
    %    
    % Yiqing Li, 10/20/2020
    % 
    % See also EGM, evolve_group, updata_the_group.

    % Copyright: 2020 Yiqing Li(anne.yiqing.li@outlook.com)
    % CC-BY-SA

    %% Current best exploit    
    [maxCost,maxID] =  max(simplexCost);

    %% Comapre exploration and exploit
    if sampleCost < maxCost
        simplexInput(maxID,:) = sampleInput;
        simplexCost(maxID) = sampleCost;
        betterFlag = 1;
    else
        betterFlag = 0;
    end
            
end