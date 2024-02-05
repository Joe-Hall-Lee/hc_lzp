% 插值预测中间周的水体评价指标
load Z.mat
x = Z(1, :); % Z 的第一行是星期
[n, m] = size(Z); % n 为 Z 的行数，m 为 Z 的列数
% 注意 MATLAB 的数组中不能保存字符串，如果要生成字符串数组，就需要使用元胞数组，其用大括号 {} 定义和引用
ylab = {'周数', '轮虫', '溶氧', 'COD', '水温', 'PH值', '盐度', '透明度', '总碱度', '氯离子', '透明度', '生物量'}; % 等会要画的图形的标签
disp(['共有', num2str(n-1), '个指标要进行插值。'])
disp('正在对一号池三次埃尔米特插值，请等待') % 一号池共有十一组要插值的数据，算上星期所在的第一行，共十二行
P = zeros(11, 15); % 对要储存数据的矩阵 P 赋予初值
for i = 2:n % 从第二行开始都是要进行插值的指标
    y = Z(i, :); % 将每一行依次赋值给 y
    new_x = 1:15; % 要进行插值的 x
    p1 = pchip(x, y, new_x); % 调用三次埃尔米特插值函数
    subplot(4, 3, i-1); % 将所有图依次变现在 4 * 3 的一幅大图上
    plot(x, y, 'ro', new_x, p1, '-'); % 画出每次循环处理后的图像
    axis([0, 15, -inf, inf]) % 设置坐标轴的范围，这里设置横坐标轴 0-15，纵坐标不变化
    % xlabel('星期')% x 轴标题
    ylabel(ylab{i}) % y 轴标题，这里直接引用元胞数组中的字符串
    P(i-1, :) = p1; % 将每次插值之后的结果保存在 P 矩阵中
end
legend('原始数据', '三次埃尔米特插值数据', 'Location', 'SouthEast') % 加上标注，注意要手动在图中拖动标注到图片右下角
P = [1:15; P] % 把 P 的第一行加上周数


% % 注意：代码文件仅供参考，一定不要直接用于自己的数模论文中
% % 国赛对于论文的查重要求非常严格，代码雷同也算作抄袭