start=30000;     %�����ݼ��д�start��ʼȡ
stop=32000;      %��stop����

bia=randi([1,1],stop-start+1,1);
x=input_h(start:stop,:)*10000000;

output=x*weight_1+bia*biase_1;%��һ��
[m, n] = size(output);  % ��¼�����С//relu
AA = output(:);   % ������ֱ��һά����
a = find(AA<0);   % �ҳ�����С��0����
AA(a) = 0;   % ��С��0������0���
output = reshape(AA,m,n);  % �ָ�������ʽ

output = output*weight_2+bia*biase_2;%�ڶ���
[m, n] = size(output);  % ��¼�����С//relu
BB = output(:);   % ������ֱ��һά����
b = find(BB<0);   % �ҳ�����С��0����
BB(b) = 0;   % ��С��0������0���
output = reshape(BB,m,n);  % �ָ�������ʽ

output = output*weight_3+bia*biase_3;%�����
[m, n] = size(output);  % ��¼�����С//�൱�ں�������ļ���
CC = output(:);   % ������ֱ��һά����
c = find(CC<0);   % �ҳ�����С��0����
d = find(CC>0);   % �ҳ����д���0����
CC(c) = 0;   % ��С��0������0���
CC(d) = 1;   % ������0������1���
output = reshape(CC,m,n);  % �ָ�������ʽ

y=output_mode(start:stop,:);
loss=y-output;
[m, n] = size(loss);  % ��¼�����С
EE = loss(:);   % ������ֱ��һά����
f = find(EE==0);   % �ҳ����е���0����
accuracy=length(f)/length(EE);
loss = reshape(EE,m,n);  % �ָ�������ʽ
