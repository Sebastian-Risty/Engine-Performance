% Name: Sebastian Risty
% Date: 12/3/2020
% File: HW6.m
% Purpose: This program plots two different sets of data, exports the data to
% an excel spreadsheet, and states whether each set of data is valid.

%import the data from the two provided text files
inventorOneData = importdata('inventor1.txt');
inventorTwoData = importdata('inventor2.txt');

%create a variable for the run times, since this will always be the same
%for both we just need one variable
runNum = inventorOneData(:,1);

%create variables for each variable given in the data sheets for both
%inventor one and two
tc1 = inventorOneData(:,2);
th1 = inventorOneData(:,3);
w1 = inventorOneData(:,4);
qSupply1 = inventorOneData(:,5);

tc2 = inventorTwoData(:,2);
th2 = inventorTwoData(:,3);
w2 = inventorTwoData(:,4);
qSupply2 = inventorTwoData(:,5);

%calculate efficiency for inventor one and two
efficiency1 = w1./qSupply1;
efficiency2 = w2./qSupply2;

%calculate carnot efficiency for inventor one and two
carnotEfficiency1 =  1 - tc1./th1;
carnotEfficiency2 =  1 - tc2./th2;

%create subplot for inventor one with run number in x-axis and both efficiencies
%in the y-axis, also creating legend to differenciate line colors
subplot(2,1,1), plot(runNum, efficiency1, 'k-.', runNum, carnotEfficiency1, 'r-');
title('efficiency vs run number (Inventor One)');
xlabel('run number');
ylabel('efficiency');
legend('efficiency', 'carnot efficiency');

%same thing but for inventor two
subplot(2,1,2), plot(runNum, efficiency2, 'k-.', runNum, carnotEfficiency2, 'r-');
title('efficiency vs run number (Inventor Two)');
xlabel('run number');
ylabel('efficiency');
legend('efficiency', 'carnot efficiency');

%create a 11x5 matrix with labels on top and data beneath each label
%respectivly. The data compares efficiency to run number
data = ["Run Number", "Efficiency Inventor One", "Carnot Efficiency Inventor One", "Efficiency Inventor Two", "Carnot Efficiency Inventor Two";
        runNum, efficiency1, carnotEfficiency1, efficiency2, carnotEfficiency2];
    
%export data to a excel sheet called data.xlsx
filename = 'data.xlsx';
writematrix(data, filename, 'Sheet', 1, 'Range', 'A1:E11');

%check if inventor one's data is valid and print our result
if(~isempty(find(efficiency1 > carnotEfficiency1, 1)))
    disp("Inventor one's data shows that their claims are not plausable." + newline)
else
    disp("Inventor one's data shows that their claims are plausable." + newline)
end

%same thing but for inventor two
if(~isempty(find(efficiency2 > carnotEfficiency2, 1)))
    disp("Inventor two's data shows that their claims are not plausable.")
else
    disp("Inventor two's data shows that their claims are plausable.")
end
