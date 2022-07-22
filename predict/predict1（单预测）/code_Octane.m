%% �˳���Ϊmatlab���ʵ�ֵ�BP������
% ��ջ�������
% clear
close all  %�ر�����ͼ�δ���
clc

%%��һ�� ��ȡ����
input=X;   %������������
output=Y;  %�����������

%% �ڶ��� ����ѵ�����ݺ�Ԥ������
% ע��Ҫ��ָ���Ϊ������
input_train = input(1:40,:)';
output_train =output(1:40,:)';
input_test = input(41:50,:)';
output_test =output(41:50,:)';
%�ڵ����
inputnum=401; % �����ڵ�����
hiddennum=10; % ������ڵ�����
outputnum=1;  % �����ڵ�����
%% ������ ѵ���������ݹ�һ��
[inputn,inputps]=mapminmax(input_train);%��һ����[-1,1]֮�䣬inputps��������һ��ͬ���Ĺ�һ��
[outputn,outputps]=mapminmax(output_train);
%% ���Ĳ� ����BP������
net=newff(inputn,outputn,hiddennum,{'tansig','purelin'},'trainlm');% ����ģ�ͣ����ݺ���ʹ��purelin�������ݶ��½���ѵ��

W1= net. iw{1, 1};                  %����㵽�м���Ȩֵ
B1 = net.b{1};                      %�м������Ԫ��ֵ

W2 = net.lw{2,1};                   %�м�㵽������Ȩֵ
B2 = net. b{2};                     %��������Ԫ��ֵ

%% ���岽 ����������ã� ѵ��������ѧϰ���ʣ�ѵ��Ŀ����С���ȣ�
net.trainParam.epochs=1000;         % ѵ����������������Ϊ1000��
net.trainParam.lr=0.01;             % ѧϰ���ʣ���������Ϊ0.01
net.trainParam.goal=0.00001;        % ѵ��Ŀ����С����������Ϊ0.00001

%% ������ BP������ѵ��
net=train(net,inputn,outputn);%��ʼѵ��������inputn,outputn�ֱ�Ϊ�����������

%% ���߲� ����������һ��
inputn_test=mapminmax('apply',input_test,inputps); % ���������ݽ��й�һ��

%% �ڰ˲� BP������Ԥ��
an=sim(net,inputn_test);                           %��ѵ���õ�ģ�ͽ��з���

%% �ھŲ� Ԥ��������һ����������     
test_simu=mapminmax('reverse',an,outputps);        %�ѷ���õ������ݻ�ԭΪԭʼ��������
error=test_simu-output_test;                       %Ԥ��ֵ����ʵֵ�����

%%��ʮ�� ��ʵֵ��Ԥ��ֵ���Ƚ�
figure('units','normalized','position',[0.119 0.2 0.38 0.5])
plot(output_test,'bo-')
hold on
plot(test_simu,'r*-')
hold on
plot(error,'square','MarkerFaceColor','b')
legend('����ֵ','Ԥ��ֵ','���')
xlabel('��������')
ylabel('����ֵ')
title('BP��������Լ���Ԥ��ֵ��ʵ��ֵ�Ա�ͼ')

[c,l]=size(output_test);
MAE1=sum(abs(error))/l;
MSE1=error*error'/l;
RMSE1=MSE1^(1/2);
disp(['-----------------------������--------------------------'])
disp(['������ڵ���Ϊ',num2str(hiddennum),'ʱ����������£�'])
disp(['ƽ���������MAEΪ��',num2str(MAE1)])
disp(['�������MSEΪ��       ',num2str(MSE1)])
disp(['���������RMSEΪ��  ',num2str(RMSE1)])
