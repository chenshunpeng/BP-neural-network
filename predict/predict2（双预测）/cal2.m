clc;
predict_y = zeros(10,2); % 初始化predict_y
pre_test=mapminmax('apply',new_X(:,:)',inputps);% 对预测数据进行归一化
for i = 1: 10
    result = sim(net, pre_test(:,i));
    predict_y(i,1) = result(1);
    predict_y(i,2) = result(2);
end
disp('预测值为：')
predict_y=predict_y';
predict_y=mapminmax('reverse',predict_y,outputps); %把预测结果还原
disp(predict_y)



