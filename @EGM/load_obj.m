function EGM = load_obj(EGM,name_of_the_run,name_of_saved_egm)
    % load_obj      EGM method for loading the saved object.
    % load_obj loads the object name_of_saved_egm in run name_of_the_run.
    %
    % To save the EGM object : egm.save_results('ObjName');
    %
    % Yiqing Li, 10/20/2020
    %
    % See also EGM, save_results.

    % Copyright: 2020 Yiqing Li(anne.yiqing.li@outlook.com)
    % CC-BY-SA
    
    %% Parameters
    if nargin < 2
        RunSaveName = EGM.param.runName;
    else
        RunSaveName = name_of_the_run;
    end
    if nargin < 3
        EGMSaveName = 'EGM';
    else
        EGMSaveName = name_of_saved_egm;
    end
    LoadDir = ['save_runs/',RunSaveName,'/',EGMSaveName,'.mat'];
    LoadEGM = load(LoadDir);
    
    %% Inherit properties
    propEGM = properties(EGM);
    for p = 1:length(propEGM)
        new_prop = get(LoadEGM.EGM,propEGM{p});
        set(EGM,propEGM{p},new_prop);
    end

    %% Update properties
    EGM.param.runName = name_of_the_run;
    
end