load('mnist_all.mat');
Test_data = {test0',test1',test2',test3',test4',test5',test6',test7',test8',test9'};
X = cell2mat(Test_data)';
Y =[];
for i = 1:10
    Y = [Y;zeros(size(Test_data{i},2),1)+i];
end


[syn0_10,syn1_10,Error_10,Rate_10] = Network(10);
[error_10,rate_10] = Error_Cal(X,syn0_10,syn1_10,Y);

[syn0_50,syn1_50,Error_50,Rate_50] = Network(50);
[error_50,rate_50] = Error_Cal(X,syn0_50,syn1_50,Y);

[syn0_100,syn1_100,Error_100,Rate_100] = Network(100);
[error_100,rate_100] = Error_Cal(X,syn0_100,syn1_100,Y);

x = linspace(1,100,100);

plot(x,Error_10,x,Error_50,x,Error_100);
title('Log Loss Error');
legend('n = 10','n = 50','n = 100');

plot(x,Rate_10,x,Rate_50,x,Rate_100);
title('Accurancy on the Traning Set');
legend('n = 10','n = 50','n = 100');