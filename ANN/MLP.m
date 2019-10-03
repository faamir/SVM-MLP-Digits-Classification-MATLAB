%in barname baraye amuzeshe shabake asabi ba 
%MLP ba algoritm BACK PROPAGATION ast,dar shabke asabi az
%8 neuron dar laye makhfi estefade shode ast.
%in barname az tabe,e sigmoid estefade mikonad .
clc;
clear all;
close all;
load mydataf% 
% tedad laye haye makhfi 8
wsinput=rand(3,8); wsoutput=rand(8,2);
a=1; % Alfa baraye tabe'e fa'al saaz
landa=0.9; % Nerkhe yadgiri
rate=0.9; % Zarib update nerkhe yadgiri
for count=1:100 % tedad 200 epoch amuzesh kole dade ha
error=0;
for s=1: size(Data2,1)
d=0; 
inputlayer=Data2(s,:)*wsinput;
fHidden= sigmoid(inputlayer,a);
outputlayer=fHidden*wsoutput;
fOutput=sigmoid(outputlayer, a);
%**************************************************
for i=1:size(fOutput,2)
outputdelta(i)=a*fOutput(i)*(1-fOutput(i))*(d-fOutput(i)); % desired output is "zero" in training pattern 2.
end 
for i=1:size(fHidden,2)
hiddendeltaw(i,1)=landa*outputdelta(1)*fHidden(i);
hiddendeltaw(i,2)=landa*outputdelta(2)*fHidden(i);
end
for j=1:size(fHidden,2)
hiddenlayerdelta(j)=a*fHidden(j)*(1-fHidden(j))*(outputdelta(1)*wsoutput(j,1)+outputdelta(2)*wsoutput(j,2));
end
for i=1:size(hiddendeltaw,1)
wsoutput(i,1)=wsoutput(i,1)+ hiddendeltaw(i,1);
wsoutput(i,2)=wsoutput(i,2)+ hiddendeltaw(i,2);
end
inputdeltaw=landa*(hiddenlayerdelta'*Data2(s,:));
wsinput=wsinput+inputdeltaw';
error=error+power(d-fOutput(1),2)+power(d-fOutput(2),2);
end;

trainerror(count)=error;
if landa>0.1 
landa=landa*rate;
end;
end;
plot(trainerror);
title('Test Error');
xlabel('Training epoch');
ylabel('Error');
%test
inputlayer=Datatest(:,:)*wsinput; fHidden= sigmoid(inputlayer,a);
outputlayer=fHidden*wsoutput; fOutput=sigmoid(outputlayer, a);
errorTest=sum(sum(fOutput))/100