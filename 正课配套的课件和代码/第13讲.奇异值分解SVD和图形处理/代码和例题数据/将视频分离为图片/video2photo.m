%% ��ȡ��Ƶ
% video_file='��������.flv';
video_file = 'Ѹ����Ƶת����ת�������������.mp4';
video = VideoReader(video_file);
frame_number = video.NumberOfFrames; % ��Ƶ����֡��

%% ����ͼƬ
for i = 1:30:frame_number % ������ʾ����ÿ 30 ֡������һ�Σ����ÿһ֡��ȫ������Ļ���Ҫ���ѵ�ʱ��ܳ���
    image_name = strcat('F:\Mathematics\Mathematical_Modeling\�����ѧ��ģ\hc_lzp\�������׵Ŀμ��ʹ���\��13��.����ֵ�ֽ�SVD��ͼ�δ���\�������������\����Ƶ����ΪͼƬ\ͼƬ\image_', num2str(i), '.jpg');
    % % �Լ�����ʱ·��һ��Ҫ�ĳ��Լ��������ļ��е�·������ֱ�����ҵ�·���������ˣ����ܻᱨ��ġ�
    Photo = read(video, i); % ��������֡��ͼƬ����
    imwrite(Photo, image_name); % ��ͼƬ���浽ָ����λ��
end

% ע�⣺MATLAB ����Ƶ��Ҫ��ϸߣ������������Ĵ�������Ҫ�Ƚ���Ƶ���н���
% ��ʹ�õ���Ѹ����Ƶת����
% ����ʹ�� VideoReader/init (line 619)
% �޷�ȷ������ı��������
% video �еĶ��󽲽⣺https://blog.csdn.net/marleylee/article/details/77770860


% % ע�⣺�����ļ������ο���һ����Ҫֱ�������Լ�����ģ������
% % �����������ĵĲ���Ҫ��ǳ��ϸ񣬴�����ͬҲ������Ϯ