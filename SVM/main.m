%in barnamei baraye SVM khati va SVM ba kernel Gaussian ast.
%baraye ejra barname ruye har ghesmat click karde va evaluate cell ra
%bezanid.

%%
clear ; close all; clc
 
%% SVM linear

load('mydataf.mat');
% Plot
plotData(X, y);
title('dade haye amuzeshi ');
% Training Linear SVM 
C = 1;
model = svmTrain(X, y, C, @linearKernel, 1e-3, 20);
figure;
visualizeBoundaryLinear(X, y, model);
title('marze tasmim giri ba Linear SVM ');
 
%%  SVM ba Gaussian Kernel 

% Loading
load('mydataf.mat'); 
% Plot 
figure,
plotData(X, y);
title('dade haye amuzeshi');
% Training
C = 1; sigma = 0.1;
model= svmTrain(X, y, C, @(x1, x2) gaussianKernel(x1, x2, sigma)); 
figure,
visualizeBoundary(X, y, model);
title('marze tasmim giri ba SVM Gaussian kernel');

