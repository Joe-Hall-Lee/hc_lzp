%% 选择决策方案的模拟
% 某设备上安装有四只型号规格完全相同的电子管，已知电子管寿命为 1000-2000 小时之间的均匀分布（假定为整数）。
% 当电子管损坏时有两种维修方案，一是每次更换损坏的那一只；二是当其中一只损坏时四只同时更换。
% 已知更换时间为换一只时需 1 小时，4 只同时换为 2 小时。
% 更换时机器因停止运转每小时的损失为 20 元，又每只电子管价格 10 元，
% 试用模拟方法决定哪一个方案经济合理？

%% （1）预备知识
% randi([a, b], m, n)  随机生成 m * n 的矩阵，矩阵中的每个元素都是 [a, b] 中的随机整数
randi([1, 5], 3, 2)
randi([1, 5]) % 不写 m * n 代表只生成 1 个随机数

% find函数的用法
% find函数的用法在第一期视频：层次分析法那一节讲过，我们当时找最大特征值的位置
a = [2, 3, 5, 1, 7, 5];
find(a) % 找到a中所有非 0 元素的位置
find(a == 5) % 找到 a 中等于 5 的元素的位置
find(a == 5, 1) % 找到 a 中第一个等于 5 的元素的位置
find(a == min(a)) % 找到 a 中最小元素的位置

%% （2）代码部分
clear; clc
T = 100000000; % T 表示模拟的总时间（单位为小时）
t = 0; % 初始化当前时刻为 0 小时
c1 = 0;
c2 = 0; % 初始化两种方案的总花费都为 0

%% 方案一
life = randi([1000, 2000], 1, 4); % 随机生成四个电子管的寿命，假设为整数
while t < T % 只要现在的时刻没有超过总时刻，就不断循环下去
    result = min(life); % 找出寿命最短的那一个电子管的寿命
    t = t + result + 1; % 现在的时间更改到有电子管损坏的时刻（加上 1 表示更换电子管需要花费的时间）
    c1 = c1 + 20 * 1 + 10; % 更新方案一的花费
    k = find(life == result, 1); % 找到哪一个电子管是坏的
    life = life - result - 1; % 更新所有电子管的寿命（这里不减去 1 也是可以的，减少了 1 也无所谓，对结果的影响很小）
    life(k) = randi([1000, 2000]); % 把坏掉的那个电子管的寿命重置
end

%% 方案二
t = 0; % 初始化当前时刻为 0 小时
while t < T % 只要现在的时刻没有超过总时刻，就不断循环下去
    life = randi([1000, 2000], 1, 4); % 随机生成四个电子管的寿命，假设为整数
    result = min(life); % 找出寿命最小的那一个电子管的寿命
    t = t + result + 2; % 现在的时间更改到有电子管损坏的时刻（加上 2 表示更换所有电子管需要花费的时间）
    c2 = c2 + 20 * 2 + 40; % 更新方案二的花费
end

%% 两种方案的花费
c1
c2


% % 注意：代码文件仅供参考，一定不要直接用于自己的数模论文中
% % 国赛对于论文的查重要求非常严格，代码雷同也算作抄袭