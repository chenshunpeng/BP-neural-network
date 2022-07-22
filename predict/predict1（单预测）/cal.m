load data_Octane.mat
% 在Matlab的菜单栏点击APP，再点击Neural Fitting app.
 
% 将指标变为列向量，然后再用sim函数预测
sim(net, new_X(1,:)')

% 写一个循环，预测接下来的十个样本的辛烷值
% 注意要将指标变为列向量，然后再用sim函数预测
predict_y = zeros(10,1); % 初始化predict_y
for i = 1: 10
    result = sim(net, new_X(i,:)');
    predict_y(i) = result;
end
disp('预测值为：')
disp(predict_y)
