%% Using Neural Net Pattern Recognition Toolbox
clc;
clearvars;
close all;

%% load data
addpath D:\Tutorial
load class2_FFT_FV_data_bins64.mat;

%% Store the training data samples in variables 
% all_class1 =  vertcat(train_FFT_class1, test_FFT_class1, val_FFT_class1);
% all_class2 =  vertcat(train_FFT_class2, test_FFT_class2, val_FFT_class2);

all_class1 =  vertcat(train_FFT_class1, val_FFT_class1);
all_class2 =  vertcat(train_FFT_class2, val_FFT_class2);
%% Creating Labels in OHC format for the train data samples

train_x=vertcat(all_class1,all_class2);
num_data = size(train_x,1);
% assign class labels
train_y=zeros(num_data,2);
for i=1:1:num_data
    if(i<=num_data/2)
        train_y(i,1)=1;
    else
        train_y(i,2)=1;
    end
end
%% Creating Labels in OHC format for the test data samples

test_x=vertcat(test_FFT_class1,test_FFT_class2);
num_test_data = size(test_x,1);
% assign class labels
test_y = zeros(num_test_data,2);
for i=1:1:num_test_data
    if(i<=num_test_data/2)
        test_y(i,1)=1;
    else
        test_y(i,2)=1;
    end
end

%% Shuffling train data

data_length=length(train_x); 
k = randperm(data_length);

for i=1:1:data_length
    train_x_shuffled(i,:) = train_x(k(i),:);
    train_y_shuffled(i,:) = train_y(k(i),:);
end

%% Lets us now use the Neural Net Pattern Recognition Toolbox



