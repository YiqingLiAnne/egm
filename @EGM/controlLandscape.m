function controlLandscape(EGM,roundID)
    % controlLandscape   EGM method for ploting the landscape including
    % proximity map and tested vertices during optimization.
    % controlLandscape(EGM,roundID) plot the proximity map with the entire
    % data set and the location of tested vertices in the data set 
    % until roundID round,which is the  subset of the former.
    %
    % Example:
    % controlLandscape(EGM,8) plots the proximiy map by all the data in 10
    % rounds and the vetices tested in 8 rounds.
    %
    % Yiqing Li, 10/20/2020
    %
    % See also EGM, learningCurve.

    % Copyright: 2020 Yiqing Li(anne.yiqing.li@outlook.com)
    % CC-BY-SA
    
    %% Parameters
    costDimen = EGM.param.costDimen;
    BGDataSet = EGM.table.table_to_visit;
    punishCost = EGM.param.punishCost;
    BGDataSet(BGDataSet(:,costDimen)==punishCost,:) = [];
    if nargin < 2        
        data_to_study = BGDataSet;
    else
        data_to_study = [];
        for round = 1:roundID
            data_to_study = [data_to_study; EGM.group{1,round}.vertices EGM.group{1,round}.cost];
        end
            data_to_study = unique(data_to_study,'rows','stable'); 
            data_to_study(data_to_study(:,costDimen) == punishCost,:) = [];        
    end
    
    %% Start a figure    
    figure
    hold on
    
    %% Proximity map      
    coordinateY = proximityMap(BGDataSet(:,1:costDimen-1),BGDataSet(:,costDimen));
    
    %% Tested vertices
    testedVertex(data_to_study(:,costDimen),coordinateY)
    hold off

    %% Figure Setting     
    xlabel('\gamma_1')
    ylabel('\gamma_2')
    box on
    axis equal
    axis tight    
    colorbar    
    range = sort(BGDataSet(:,costDimen));
    Rg2 = linspace(range(1),range(end),5);
    caxis([range(1) range(end)])    
	colorbar('ytick',Rg2)

%     ylabel(colorbar,'J')
    
end

function coordinateY = proximityMap(dataSetInput,dataSetCost)
    % Plot the proximity map out of the tested data points .
    %
    % Yiqing Li, 10/20/2020
    %
    % See also controlLandscape, testedVertex.

    % Copyright: 2020 Yiqing Li(anne.yiqing.li@outlook.com)
    % CC-BY-SA
    %% Input    
    input = dataSetInput;
    cost = dataSetCost;
    
    %% Compute the distances of the data points in the dataset.
    [m,n] = size(input);
    for i=1:m
        for j=1:m
            sum=0;
            for l=1:n
                sum=sum+(input(i,l)-input(j,l))^2;
            end
            % ###########Metric 1###########
            G(i,j) = sqrt(sum);
            % ###########Metric 2###########
%             G0(i,j) = sum;
%             G_V(i,j) = abs(proxiVal(i,1)-proxiVal(j,1));

        end
    end
    % ###########Metric 2###########
%     alp = max(G0,[],'all')/max(G_V,[],'all');
%     G = sqrt(G0 + alp * G_V);

    %% Multidimensional scaling
    coordinateY = cmdscale(G);
    
    %% Triangulation
    tri = delaunay(coordinateY(:,1),coordinateY(:,2));
    
    %% Plot
    [~,h]=tricontf(coordinateY(:,1),coordinateY(:,2),tri,cost,200);
    set(h,'edgecolor','none');
    load('Tools/mycolor10D.mat')
    colormap(mycolor)
%     colormap(flipud(gray))

end

function testedVertex(dataSetCost, coordinateY)
    % Plot the tested data points according to their location indicated by
    % coordinateY on the proximity map.
    %
    % Yiqing Li, 10/20/2020
    %
    % See also controlLandscape, proximityMap.

    % Copyright: 2020 Yiqing Li(anne.yiqing.li@outlook.com)
    % CC-BY-SA
    
    %% Get layer
    numVertices = size(dataSetCost,1);
    redLayerRec = [];
    blueLayerRec = [];
    Y = coordinateY;
    redLayerRec = [redLayerRec;Y(1,1),Y(1,2),1];
    optiVal = dataSetCost(1);  
    
    for i=2:numVertices
        if dataSetCost(i) < optiVal
            redLayerRec = [redLayerRec;Y(i,1),Y(i,2),i];
            optiVal = dataSetCost(i);
        else
            blueLayerRec = [blueLayerRec;Y(i,1),Y(i,2)];
        end
    end    
  
    %% Plot layer
    for i = 1:size(blueLayerRec,1)
        plot(blueLayerRec(i,1),blueLayerRec(i,2),'o','markersize',5,'MarkerEdgeColor',[0.09804 0.09804 0.43992]);
    end
    for i = 1:size(redLayerRec,1)
        plot(redLayerRec(i,1),redLayerRec(i,2),'o','markersize',7,'MarkerFaceColor',[1 0.3 0],'MarkerEdgeColor',[1 0.3 0])
        text(redLayerRec(i,1),redLayerRec(i,2),num2str(redLayerRec(i,3)),'FontSize',5,'horiz','center','FontWeight','bold')
    end
    
end
