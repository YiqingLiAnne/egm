function unitSample = generate_first_sample(Esample,sampleSize)
    % generate_first_sample   Esample method for generating the first sample randomly.
    %
    % Yiqing Li, 10/20/2020
    %
    % See also Esample_run.

    % Copyright: 2020 Yiqing Li(anne.yiqing.li@outlook.com)
    % CC-BY-SA
    
    %% Parameters
    dim = Esample.param.inputDimen; 
    
    %% Generate a random sample in the sapce 
    % Create the 1st sample in a unit space
    unitSample = rand(sampleSize,dim)-0.5;
    
end