    % Initialization script.
    % Initialization    Load path to use in EGM and displays the information.
    %
    % Yiqing Li, 10/20/2020
    %
    % See also EGM, save_results, load_obj.

    % Copyright: 2020 Yiqing Li(anne.yiqing.li@outlook.com)
    % CC-BY-SA
    
    %% Load Paths    
    addpath ../EGM_v0.1.4.1
    % Tools
    addpath Tools
    addpath Tools/TRICONT/
    % Plants
    addpath Plant

    %% Show more
    more off;

    %% Information display
    % Header
    fprintf('=====================')
    fprintf('xEGM v0.1.4.1')
    fprintf('=====================\n')
    % Version
    disp(' Welcome to the xEGM software to solve non-convex')
    disp(' optimization problems.')
    % Contact
        disp(' In case of error please contact the author :')
        disp(' anne.yiqing.li@outlook.com');

    % Start
    disp(' Start by creating a EGM object with : egm=EGM;')
    % Foot
    fprintf('===========================')
    fprintf('===========================\n')
    fprintf('\n')
