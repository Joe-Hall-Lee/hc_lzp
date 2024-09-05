%% ��ô�õ������Ӳ�����
function [f, IND] = coin_change2(coins, S)
FF = +inf * ones(1, S+2);
FF(S+2) = 0; % ���һ��Ԫ�ظ�Ϊ 0
for x = 1:S
    tmp = x - coins;
    tmp(tmp < 0) = S + 1;
    tmp(tmp == 0) = S + 2;
    FF(x) = min(FF(tmp)) + 1;
end
% ���� FF ������ IND
IND = []; % IND ��ʾ����ѡ���Ӳ����ϣ���ʼ��Ϊ������
if FF(S) < +inf % �����ܴճ� S �����
    f = FF(S);
    ind = S; % ind ��ָ�����һ��λ�� S
    while FF(ind) > 1 % ��� FF(ind) = 1 ʱ�Ͳ���Ѱ����
        indd = ind; % ����ǰһ��λ��
        tmp = ind - coins;
        tmp(tmp < 0) = S + 1; % FF �±�Ϊ S + 1 ��Ԫ��Ϊ +inf
        tmp(tmp == 0) = S + 2; % FF ���һ��Ԫ��Ϊ 0
        ind = tmp(find(FF(tmp) == (FF(ind) - 1), 1)); % �ҵ��µ�λ��
        IND = [IND, indd - ind]; % ����λ��֮���������Ҫ��ӵ�Ӳ��
    end
    IND = [IND, ind]; % FF(ind) = 1 ʱ���� ind Ҳ���뵽 IND ��
else % ���û���κ�һ��Ӳ�����������ܽ�� S �ͷ��� -1
    f = -1;
end
end
