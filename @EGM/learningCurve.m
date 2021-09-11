function learningCurve(EGM,data_ref)
    % learningCurve     EGM method for ploting the learning curve during optimization.
    % learningCurve(EGM,data_ref) plots the minimum cost after each
    % evaluation and the learning curve from the data set data_ref.
    % egm.learningCurve plots the minimum cost after each evaluation and
    % the learning curve from the same data set.
    %
    % Yiqing Li, 10/20/2020
    %
    % See also EGM, controlLandscape.

    % Copyright: 2020 Yiqing Li(anne.yiqing.li@outlook.com)
    % CC-BY-SA
    
    %% Parameters
    costDimen = EGM.param.costDimen;
    data_to_study = EGM.table.table_to_visit;
    punishCost = EGM.param.punishCost;
    data_to_study(data_to_study(:,costDimen)==punishCost,:) = [];
    if nargin < 2        
        data_ref = data_to_study;
    end
%     data = unique(data,'rows','stable');
    numVertices = size(data_to_study,1);
    
    %% Process data 
    for m = 1:numVertices            
        if m == 1
            plotFitness(1) = data_ref(1,end);
        else
            if data_ref(m,end) < plotFitness(m-1)
                plotFitness(m) = data_ref(m,end);
            else
                plotFitness(m) = plotFitness(m-1);
            end
        end
    end   
    
    %% Organize data
    % Sort data and plot layers
    redLayerRec = [];
    blueLayerRec = [];
    optiVal = data_to_study(1,costDimen);
    redLayerRec = [redLayerRec;1,optiVal];
    optId = 1;
    for i = 2:numVertices
        if data_to_study(i,costDimen) < optiVal
            optiVal = data_to_study(i,costDimen);
            redLayerRec = [redLayerRec;i,optiVal];
        else
            blueLayerRec = [blueLayerRec;i,optiVal];
        end
    end 
    
    %% Figure
    figure
    hold on
    % Plot data points
    for i = 1:length(blueLayerRec)
        h1 = plot(blueLayerRec(i,1),blueLayerRec(i,2),'o','markersize',6,'MarkerEdgeColor',[0.09804 0.09804 0.43992]);
    end
    for i = 1:length(redLayerRec)
        h2 = plot(redLayerRec(i,1),redLayerRec(i,2),'o','markersize',6,'MarkerFaceColor',[1 0.3 0],'MarkerEdgeColor',[1 0.3 0]);
    end
    % Plot reference curve
    h3 = plot(plotFitness,'Color',[0.85,0.33,0.10],'LineStyle','-','linewidth',1.5);
    % legend
    legend([h1,h2,h3],'Unchanged optimum','New optimum','Reference curve','Box','off')    
    % axis 
    xlabel('m')
    ylabel('J')
    box on    
%     axis([0 350 0.25 0.45])
%     set(gcf,'outerposition',[10 100 1800 500])
%     set(gca,'YTick',0.26:0.01:0.4)
%     set(gca,'XTick',0:10:140)
%     set(gca,'FontSize',20)

    hold off
    
end