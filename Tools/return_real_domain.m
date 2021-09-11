function actual_sample = return_real_domain(unitsample,input_lowerLimit,input_upperLimit)
    % return_real_domain projects the vertices in the unit space unitsample
    % into the domain described by input_lowerLimit,input_upperLimit, and
    % returns the vertices in the real sapce.
    %
    % Yiqing Li, 10/20/2020
    %
    % See also generate_group, Esample_run.

    % Copyright: 2020 Yiqing Li(anne.yiqing.li@outlook.com)
    % CC-BY-SA



    %% Parameters
    input_range = input_upperLimit - input_lowerLimit;
    input_middle = (input_upperLimit + input_lowerLimit)/2;    
    
    %% Project to the real domain
    actual_sample = input_middle + input_range.*unitsample;
    
end