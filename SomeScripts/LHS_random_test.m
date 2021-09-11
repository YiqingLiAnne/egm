% dataSource = [-4 -3 -2 -1 0 1 2 3 4];
% num_dataSource = length(dataSource);
load('save_runs/LHS_test_randomly_DNS100/initial_centre_indiv.mat')
deviaton = 0.1;

upperLimit = [5   5  5];
lowerLimit = [-5 -5 -5];
sampleSize = 1e6;
roundSet = 10;

% LHSSet = [];
% initial_centre_indiv = [];

% for i = 1:num_dataSource
%     for j = 1:num_dataSource
%         for k = 1:num_dataSource
%             initial_centre_indiv = [initial_centre_indiv;dataSource(i) dataSource(j) dataSource(k)];
%         end
%     end
% end
% save('save_runs/LHS_test_randomly/initial_centre_indiv','initial_centre_indiv')

Initialization

for i = 1:size(initial_centre_indiv,1)
    
    i
        
    initial_indiv = initial_centre_indiv(i,:).*ones(4,3) + [0 0 0;deviaton*eye(3)];
    objEsample = Esample(upperLimit,lowerLimit,sampleSize);
    objEsample.oldSet = initial_indiv;
    objEsample.Esample_run(roundSet)
    LHSSet{i} = objEsample.oldSet;
    save('save_runs/LHS_test_randomly_DNS100/LHSSet','LHSSet')
    
end
    