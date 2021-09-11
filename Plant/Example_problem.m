function J = Example_problem(example_input)
    % Example_problem   Toy function.
    %
    % Yiqing Li, 10/20/2020
    % See also evaluate_group, evaluate_vertices.

    % Copyright: 2020 Yiqing Li(anne.yiqing.li@outlook.com)
    % CC-BY-SA
    
    temp = [];
    sigmaV = [ 1   1 ;
              -1   1 ;
               1  -1 ;
              -1  -1 ];
    for i = 1:size(sigmaV,1)
        powerS = sum((example_input - sigmaV(i,:)).^2)*2;
        temp = [temp 1/i * exp(-powerS)];
    end
    J = 1 - sum(temp);
    
%     P = example_input;
% 
%     J = 1 ... 
%     - 1   * exp(-(P(1) -   1 ).^2 - (P(2) -   1 ).^2) ...
%     - 1/2 * exp(-(P(1) -   1 ).^2 - (P(2) - (-1)).^2) ...
%     - 1/3 * exp(-(P(1) - (-1)).^2 - (P(2) -   1 ).^2) ...
%     - 1/4 * exp(-(P(1) - (-1)).^2 - (P(2) - (-1)).^2);

    % Rosenbrock
%     J = (1-example_input(:,1)).^2 + 100*(example_input(:,2)-example_input(:,1).^2).^2;

end