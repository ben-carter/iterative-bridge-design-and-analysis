clc; clear;

%Written By Ben Carter: carter.b@husky.neu.edu

%Set Up
bridgeData = xlsread('BridgeData.xlsx');
bridgeData2 = xlsread('BridgeData2.xlsx');

%Welcome Process
disp('Welcome to the Cardi-Bridge Analyzer');
disp('Hit enter to begin analyzing your bridges');
pause;

%User input: Weight of bridges
weight1 = input('Enter the weight of bridge 1: ');
weight2 = input('Enter the weight of bridge 2: ');


%Max Load
maxLoad1 =max(bridgeData(:,2));
maxLoad2 =max(bridgeData2(:,2));

%Displacement and Load
displacement = calculateDisplacement(bridgeData(:,3), bridgeData(1,5));
displacement2 = calculateDisplacement(bridgeData2(:,3), bridgeData2(1,5));
load = bridgeData(:,2);
load2 = bridgeData2(:,2);

%Graphing Data
plot(displacement,load, 'b-', displacement2,load2, 'r-');
legend('Bridge 1');
grid on;
xlabel('Displacement (in)');
ylabel('Load (lbs)');
title('Force Load Diagram');

disp('Examine the graphs and identify the displacement of failure points of each bridge');

%Failure Points with User Interface
failurePoint1 = input('Enter the failure displacement of Bridge 1 ');
failurePoint2 = input('Enter the failure displacement of Bridge 2 ');

close;

%Bridge Toughness
toughness1 = calculateToughness(displacement, load, failurePoint1 );
toughness2 = calculateToughness(displacement2, load2, failurePoint2 );


fprintf('                                    Bridge #1   Bridge #2\n');
fprintf('Weight of Bridge (lbs)              %2.2f        %2.2f\n', weight1, weight2);
fprintf('Maximum Load (lbs)                  %2.2f        %2.2f\n', maxLoad1, maxLoad2);
fprintf('Toughness                           %2.2f        %2.2f\n', toughness1, toughness2);
fprintf('Strength to Weight Ratio (lbs/lbs)  %2.2f        %2.2f\n', maxLoad1/weight1, maxLoad2/weight2);
fprintf('Toughness to Weight Ratio (lb*in)   %2.2f        %2.2f\n', toughness1/weight1, toughness2/weight2);

out = fopen('Bridge Data Analysis.txt', 'w');

fprintf(out,'                   Bridge Data Analysis                  \n');
fprintf(out,'                                    Bridge #1   Bridge #2\n');
fprintf(out,'Weight of Bridge (lbs)              %2.2f        %2.2f\n', weight1, weight2);
fprintf(out,'Maximum Load (lbs)                  %2.2f        %2.2f\n', maxLoad1, maxLoad2);
fprintf(out,'Toughness (lb*in)                          %2.2f        %2.2f\n', toughness1, toughness2);
fprintf(out,'Strength to Weight Ratio (lbs/lbs)  %2.2f        %2.2f\n', maxLoad1/weight1, maxLoad2/weight2);
fprintf(out,'Toughness to Weight Ratio (in)      %2.2f        %2.2f\n', toughness1/weight1, toughness2/weight2);



function newData = calculateDisplacement(data, initial)

    newData = zeros(length(data));
    for i = 1:length(data)
        newData(i,1) = data(i,1)-initial;
    end

end

%User Entry


