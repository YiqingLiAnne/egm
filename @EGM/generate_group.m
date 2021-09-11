function generate_group(EGM)                                                                                    
    % generate_group    EGM method for generating a new group.
    % egm.generate_group initizalize a group to evolve. The initial group 
    % is a simplex including N+1 vertices in a N dimensional sapce
    %
    % Yiqing Li, 10/20/2020
    %
    % See also EGM, go, update_the_group.

    % Copyright: 2020 Yiqing Li(anne.yiqing.li@outlook.com)
    % CC-BY-SA

    %% Parameters
    simplexSize = EGM.param.simplexSize;
    inputDimen = EGM.param.inputDimen;  
    input_upperLimit = EGM.param.upperLimit;
    input_lowerLimit = EGM.param.lowerLimit;
    round_ongoing = EGM.roundID+1;
    limit_length = 1;% unit space
    
    %% Generate initial simplex
    % Create the initial simplex in a unit space
%     centre_indiv = rand(simplexSize,inputDimen)-0.5;
    centre_indiv = rand(1,inputDimen)-0.5;
    simplex_deviation = 0.05.*limit_length;
    initSimplex_unit = centre_indiv.*ones(simplexSize,inputDimen) + [zeros(1,inputDimen);simplex_deviation.*eye(simplexSize-1)];
    
    % Project to the real space
    firstSimplex = return_real_domain(initSimplex_unit,input_lowerLimit,input_upperLimit);

    
    
    %% Update and change the status   
    EGM.group{1,round_ongoing}.vertices = firstSimplex;
    EGM.group{1,round_ongoing}.operation = [];
    for i = 1:simplexSize
        EGM.group{1,round_ongoing}.operation{i,1} = 'random';
    end
    
end