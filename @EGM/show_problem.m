function show_problem(EGM)
    % show_problem EGM method for displaying the problem.
    %
    % Yiqing Li, 10/20/2020
    %
    % See also EGM.

    % Copyright: 2020 Yiqing Li(anne.yiqing.li@outlook.com)
    % CC-BY-SA
    
    %% Initialization
    param = EGM.param;

    %% Borders
    fprintf('======================== ')
    fprintf('xEGM')
    fprintf(' =======================\n')
    fprintf('\n')

    %% Print
    fprintf(['Name of the run : ',param.runName,'\n'])
    fprintf(['Problem to solve : ',param.evaluationFunction,'\n'])
    fprintf(['   Number of control variables  : ',num2str(param.inputDimen),'\n'])
    fprintf('\n')
    fprintf('Parameters : \n')
    fprintf(['   First group (simplex) size : ',num2str(param.simplexSize),'\n'])
    fprintf('\n')
    fprintf('   One step of EGM gradient exploit includes Operations : \n')
    fprintf('       Mirror \n')
    fprintf('       Expand \n')
    fprintf('       Contract \n')
    fprintf('       Shrink \n')
    fprintf('   One step of EGM exploration is based on : \n')
    fprintf('       Latin Hypercube Sampling (LHS) \n')
    fprintf('\n')

    % To continue
    disp('To generate a group : egm.generate_group;')
    disp('To run N round : egm.go(N);')
    
    %% Borders
    fprintf('===========================')
    fprintf('===========================\n')
    
end %method
