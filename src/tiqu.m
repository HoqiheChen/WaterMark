A=ones(1,75);
A=A*8;
B=ones(1,100);
B=B*8;
Z=mat2cell(double(Imarked),A,B);
get1=n(1:400);
xintu=cell(1,400);
for i=1:400;
    xintu{i}=dct2(Z{get1(i)});
end 
huanyuantu=ones(1,400);
for i=1:400;
    K(i)=corr(xintu{i}(:),pn_seq(:).*weight);
    if K(i)> 0.25
        huanyuantu(i)=0;
        %get1(i)
    end
end
huanyuantu=reshape(huanyuantu,10,40);
imshow(huanyuantu);
