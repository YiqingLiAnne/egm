function save_results(EGM,name_of_saved_obj)
    % save_results    EGM method for save.
    % save_results(EGM,myObject) saves the object EGM with name myObject 
    % in the folder save_runs.
    %
    % To load the EGM object : egm.load_obj('RunName','ObjName');
    %
    % Yiqing Li, 10/20/2020
    %
    % See also EFM, load_obj.

    % Copyright: 2020 Yiqing Li (anne.yiqing.li@outlook.com)
    % CC-BY-SA

    %% Parameters
    RunSaveName = EGM.param.runName;
    if nargin < 2
        ObjSaveName = 'EGM';
    else
        ObjSaveName = name_of_saved_obj;
    end
    
    %% Create Folders
    create_folders(RunSaveName);

    %% Save obj
    dir = ['save_runs/',RunSaveName];
    EGMSavedName = [dir,'/',ObjSaveName,'.mat'];
    save(EGMSavedName,'EGM')
    
    %% Save dataBase
    dataBase = EGM.table.table_to_visit;
    dataBaseSavedName = [dir,'/dataBase.mat'];
    save(dataBaseSavedName, 'dataBase')

end
