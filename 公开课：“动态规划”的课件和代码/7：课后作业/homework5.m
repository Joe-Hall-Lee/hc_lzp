% ��ҵ 5���༭����
% ��Ŀ��Դ������ 72. �༭����
% ���ӣ�https://leetcode-cn.com/problems/edit-distance/
function f = homework5(word1, word2)
m = length(word1);
n = length(word2);
FF = ones(m, n); % ��ʼ�� DP ����
% �����һ��
ind = strfind(word2, word1(1)); % �� word2 ���� word1 �ĵ�һ����ĸ
for j = 1:n
    if isempty(ind) % word1 �ĵ� 1 ����ĸ���� word2 ��
        FF(1, j) = j;
        % word1 �ĵ�һ����ĸ�� word2 ��ʱ��ind��������ж��λ�ã�����ֻ��Ҫ�״γ��ֵ�λ��
    elseif ind(1) == 1 % word1 �� word2 �ĵ� 1 ����ĸ��ͬ
        FF(1, j) = j - 1;
    else
        % ���λ�ò�Ϊ 1����ô��λ��֮ǰ�� FF(1, j) = j����λ���Լ���λ��֮��� FF(1, j) = j - 1
        if j < ind(1)
            FF(1, j) = j;
        else
            FF(1, j) = j - 1;
        end
    end
end
% �����һ��
ind = strfind(word1, word2(1)); % �� word1 ���� word2 �ĵ�һ����ĸ
for i = 1:m
    if isempty(ind) % word2 �ĵ� 1 ����ĸ���� word1 ��
        FF(i, 1) = i;
        % word2 �ĵ�һ����ĸ�� word1 ��ʱ��ind ��������ж��λ�ã�����ֻ��Ҫ�״γ��ֵ�λ��
    elseif ind(1) == 1 % word1 �� word2 �ĵ� 1 ����ĸ��ͬ
        FF(i, 1) = i - 1;
    else
        % ���λ�ò�Ϊ 1����ô��λ��֮ǰ�� FF(i, 1) = i����λ���Լ���λ��֮��� FF(i, 1) = i - 1
        if i < ind(1)
            FF(i, 1) = i;
        else
            FF(i, 1) = i - 1;
        end
    end
end
% ѭ���������²��ֵ�Ԫ��
for i = 2:m
    for j = 2:n
        tmp1 = FF(i-1, j-1) + (word1(i) ~= word2(j)) * 1;
        % �Ȱ� word1[1..i-1] �任�� word2[1...j-1]�����ĵ� FF(i-1, j-1) ����
        % �ٰ� word1[i] �ĳ� word2[j]�������ˡ�
        % �����Ϊ������������ word1[i] == word2[j]��ʲôҲ��������һ������ FF(i-1, j-1) ����
        % ������Ҫ�滻���һ���ַ���һ������ FF(i-1,j-1) + 1 ����
        tmp2 = FF(i-1, j) + 1;
        % �Ȱ� word1[1..i-1] �任�� word2[1..j]�����ĵ� FF(i-1,j) ����
        % �ٰ� word1[i] ɾ��������word1[1..i] ����ȫ����� word2[1..j] �ˣ�
        % һ������ FF(i-1, j) + 1 ����
        tmp3 = FF(i, j-1) + 1;
        % �Ȱ� word1[1..i] �任�� word2[1..j-1]�����ĵ� FF(i, j-1) ��
        % ���������ٲ���һ���ַ� word2[j], word1[1..i] ����ȫ����� word2[1..j] �ˡ�
        % һ������ FF(i, j-1) + 1 ����
        FF(i, j) = min([tmp1, tmp2, tmp3]);
        % ��������������������word1[1..i] �任�� word2[1..j] ��Ҫ�����ֲ���
        % ���ֲ����������پ������֡�
    end
end
f = FF(m, n);
end
