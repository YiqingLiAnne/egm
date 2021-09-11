function parameters = default_parameters()
    % default_parameters    Parameters setting.
    % parameters = default_parameters() returns the parameters including
    % EGM parameters and problem parameters.
    %
    % Yiqing Li, 10/20/2020
    % See also EGM, Esample, Gsimplex, Mtable.

    % Copyright: 2020 Yiqing Li(anne.yiqing.li@outlook.com)
    % CC-BY-SA

    %% Import,start and save setting
    parameters.importDataBase = 0;
    parameters.instantSave = 1;
    
    %% Problem parameters
    parameters.runName = 'Example'; % The name of the run for saving results.
    parameters.evaluationFunction = 'Example'; % The name of the function for evaluation.
    parameters.upperLimit = [3   3]; % The upper boundary for each dimension of inputs.
    parameters.lowerLimit = [-3 -3]; % The lower boundary for each dimension of inputs
    parameters.inputDimen = 2; % The dimension of input variables
    parameters.costDimen = parameters.inputDimen + 1; % The dimension location for a vertex in the data base.
    parameters.indivDimen = parameters.costDimen;
    parameters.punishCost = 10;% The high cost punished to the vertices out of boundary.
    % Define the initial individuals
    parameters.defineInitialIndiv = true; %'true' means the optimization starts from the following individuals, otherwise start randomly
    initial_centre_indiv = [-2 -2];
    parameters.limit_length = parameters.upperLimit-parameters.lowerLimit;
    parameters.simplex_deviation = 0.05.*parameters.limit_length;
    parameters.initialIndiv = initial_centre_indiv.*ones(parameters.indivDimen,parameters.inputDimen) + [zeros(1,parameters.inputDimen);parameters.simplex_deviation.*eye(parameters.indivDimen-1)];

    %% EGM setting
    % Gradient_simplex param
    simplexMirrorStep = 1; % Step size of the mirror in downhilll simplex method
    simplexContractStep = 0.5; % Step size of the contract in downhilll simplex method
    simplexExpandStep = 2; % Step size of the expand in downhilll simplex method
    simplexShrinkStep = 1/2; % Step size of the shrink in downhilll simplex method
    simplexParam = [simplexMirrorStep simplexContractStep simplexExpandStep simplexShrinkStep];
    parameters.simplexParam = simplexParam; % Above parameters combination in downhilll simplex method
    parameters.simplexSize = parameters.inputDimen + 1; % The size of the simplex, which means the number of vertices included in a simplex.
    parameters.gradient_Nstep = 1; % EGM includes 1 step of exploit during each round. 
    
    % Exploration_sample param               
    parameters.exploration_Nstep = 1;% EGM includes 1 step of exploration during each round.       
    parameters.sampleSetSize = 1e5;% EGM includes 1 step of exploration during each round.

end