data_EGM = [];
for i = 1:11 
    data_EGM = [data_EGM; EGM.group{1,i}.vertices EGM.group{1,i}.cost];
end

    