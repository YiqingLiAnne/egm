%% Individual test

% initial_centre_indiv = [-3 -3 3];
% deviaton = 0.1;
% initial_indiv = initial_centre_indiv.*ones(4,3) + [0 0 0;deviaton*eye(3)];   
% Initialization
% egm = EGM('Fluidic_pinball');
% egm.group{1,1}.vertices = initial_indiv;
% egm.param.runName = 'Fluidic_pinball_test_0811';
% egm.go(15)
% %     create_folders(['Fluidic_pinball_test',num2str(i+1)]);
% %     system(['cp save_runs/Fluidic_pinball_test',num2str(i),'/dataBase.mat save_runs/Fluidic_pinball_test',num2str(i+1),'/dataBase.mat'])
% %     load(['save_runs/Fluidic_pinball_test',num2str(i),'/instant_save.mat'])
% %     EGM.go(6)



%% Continuous test

initial_centre_indiv = [0,-4.5,4.5;
                        0,-4,  4;
                        0,-3.5,3.5;
                        0,-3,  3;
                        0,-2.5,2.5;
                        0,-2,  2;
                        0,-1.5,1.5;
                        0,-1,  1;
                        0,-0.5,0.5];    
deviaton = 0.1;
for i = 3:size(initial_centre_indiv,1)
    
    i
    initial_indiv = initial_centre_indiv(i,:).*ones(4,3) + [0 0 0;deviaton*eye(3)];   
    Initialization
    egm(i) = EGM('Fluidic_pinball');
    egm(i).group{1,1}.vertices = initial_indiv;
    egm(i).param.runName = ['Fluidic_pinball_test',num2str(i)];
    egm(i).table = Mtable(egm(i).param);
    egm(i).go(10)
    create_folders(['Fluidic_pinball_test',num2str(i+1)]);
    system(['cp save_runs/Fluidic_pinball_test',num2str(i),'/dataBase.mat save_runs/Fluidic_pinball_test',num2str(i+1),'/dataBase.mat'])
% % % % % % % % % % % %     to continue     % % % % % % % % % % % %     
%     load(['save_runs/Fluidic_pinball_test',num2str(i),'/instant_save.mat'])
%     EGM.go(10)

end
