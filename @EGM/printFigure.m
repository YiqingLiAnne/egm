function printFigure(EGM,name_of_figrue)
    % printFigure   EGM method for printing and saving the current figure.
    % egm.printFigure('myFigure') print the current figure as
    % 'myFigure.eps','myFigure.png'.
    %
    % Yiqing Li, 10/20/2020
    %
    % See also EGM,learningCurve,controlLandscape.

    % Copyright: 2020 Yiqing Li(anne.yiqing.li@outlook.com)
    % CC-BY-SA

    %% Parameters
    RunSaveName = EGM.param.runName;
    FigPath = ['save_runs/',RunSaveName,'/Figures/',name_of_figrue];
    
    %% Test
    if exist([FigPath,'.eps'],'file')
        error('This file name already exist')
    end
    
    %% Print
    print([FigPath,'.eps'],'-depsc','-tiff','-r600') 
    print([FigPath,'.png'],'-dpng','-r600') 

end