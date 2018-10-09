%close all;
%clear all;
clc;
weight=200;
target=imread('1.bmp');
I=rgb2gray(target);
A=ones(1,75);
A=A*8;
B=ones(1,100);
B=B*8;
X=mat2cell(double(I),A,B);
delta=ones(1,7500);
zonghe=0;
for i=1:7500;
      zonghe=sum(sum(X{i}))/64;
      delta(i)=sum(sum((X{i}-zonghe).^2))/8;
end
[m,n]=sort(delta,'descend');
get=n(1:400);
for i=1:400;
    Y{i}=dct2(X{get(i)});
end 
pn_seq=round(rand(8,8));
midband=[
           1 1 1 1 1 1 1 1;
           1 1 1 1 1 1 1 1;
           1 1 1 1 1 1 1 1;
           1 1 1 1 1 1 1 0;
           1 1 1 1 1 1 0 0;
           1 1 1 1 1 0 0 0;
           1 1 1 1 0 0 0 0;
           1 1 1 0 0 0 0 0;
          ];
pn_seq=pn_seq.* midband;
logo=imread('logo10.bmp');
for i=1:400
        if logo(i) == 0
            Y{i}=Y{i}+pn_seq*weight;
            %i
            %get(i)
            %corr(Y{i}(:),pn_seq(:)*weight)
        end
end
for i=1:400;
    X{get(i)}=idct2(Y{i});
end
Imarked=cell2mat(X);
Imarked=uint8(Imarked);
MSE=sum(sum((I-Imarked).^2))/800/600;
PSNR=10*log(255^2/MSE);
imwrite(Imarked,'Imarked.bmp');




