function [compress_A] = mysvd(A, ratio)
% 函数作用：使用奇异值分解将矩阵 A 压缩到指定的特征比例
% 输入变量
%     A: 要压缩的 m * n 维的矩阵
%     ratio: 要保留原矩阵的特征比例（100% 表示不压缩）
% 输出变量
%     compress_A: 压缩后的矩阵
[U, S, V] = svd(A); % U: m * m; S: m * n; V: n * n
eigs = diag(S); % 得到 S 的主对角线元素，即矩阵 A 的奇异值，并将其保存到列向量中
SUM = sum(eigs); % 计算所有奇异值的总和
temp = 0; % 新建临时变量，用于下面的循环
for i = 1:length(eigs) % 循环
    temp = temp + eigs(i); % 每循环一次，就更新 temp 的值为原来的 temp 值 + 接下来的一个奇异值
    if (temp / SUM) > ratio % 如果现在的比例超过了 ratio，就退出循环
        break
    end
end
disp(['压缩后保留原矩阵的比例特征为：', num2str(roundn(100*temp/SUM, -2)), '%']) % roundn(x, -2) 可将 x 四舍五入到小数点后两位
compress_A = U(:, 1:i) * S(1:i, 1:i) * V(:, 1:i)';
end


% % 注意：代码文件仅供参考，一定不要直接用于自己的数模论文中
% % 国赛对于论文的查重要求非常严格，代码雷同也算作抄袭
% % 视频中提到的附件可在售后群（购买后收到的那个有道云笔记中有加入方式）的群文件中下载。包括讲义、代码、优秀的作业、我视频中推荐的资料等。
% % 关注我的微信公众号《数学建模学习交流》，后台发送“软件”两个字，可获得常见的建模软件下载方法；发送“数据”两个字，可获得建模数据的获取方法；发送“画图”两个字，可获得数学建模中常见的画图方法。另外，也可以看看公众号的历史文章，里面发布的都是对大家有帮助的技巧。
% % 购买更多优质精选的数学建模资料，可关注我的微信公众号《数学建模学习交流》，在后台发送“买”这个字即可进入店铺(我的微店地址：https://weidian.com/?userid=1372657210)进行购买。
% % 视频价格不贵，但价值很高。单人购买观看只需要58元，三人购买人均仅需46元，视频本身也是下载到本地观看的，所以请大家不要侵犯知识产权，对视频或者资料进行二次销售。
% % 如何修改代码避免查重的方法：https://www.bilibili.com/video/av59423231（必看）