load data_Octane.mat
% ��Matlab�Ĳ˵������APP���ٵ��Neural Fitting app.
 
% ��ָ���Ϊ��������Ȼ������sim����Ԥ��
sim(net, new_X(1,:)')

% дһ��ѭ����Ԥ���������ʮ������������ֵ
% ע��Ҫ��ָ���Ϊ��������Ȼ������sim����Ԥ��
predict_y = zeros(10,1); % ��ʼ��predict_y
for i = 1: 10
    result = sim(net, new_X(i,:)');
    predict_y(i) = result;
end
disp('Ԥ��ֵΪ��')
disp(predict_y)
