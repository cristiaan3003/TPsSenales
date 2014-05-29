%[t,x]=senoidal(A,f,tita,fm,t_ini,t_fin)
[t,S1] = senoidal(1,1,0,100,0,3);
[t,S3] = senoidal(1,3,0,100,0,3);
[t,S3a] = senoidal(1,3,10,100,0,3);
[t,S3b] = senoidal(1,3,-10,100,0,3);
[t,S5] = senoidal(1,5,0,100,0,3);
[t,S10] = senoidal(1,10,0,100,0,3);
S = [S1;S3;S3a;S3b;S5;S10];
N=length(S1);
plot(t,S1,t,S3,t,S5,t,S10)
resu = zeros(6,6);
for i=1:1:6
    for j=1:1:6
        resu(i,j) = interno(S(i,:),S(j,:));
    end
end
resu
% 
%mismo seno con cambio de fases

SF = zeros(20,300);
fases=zeros(20,1);
for k=1:20
    %[t,x]=senoidal(A,f,tita,fm,t_ini,t_fin)
    [x,SF(k,:)] = senoidal(1,5,k*(pi/4),100,0,3);
    fases(k) = interno( SF(1,:) , SF(k,:) );
end
fases

% %[t,x]=senoidal(A,f,tita,fm,t_ini,t_fin)
% [fr,fruta1] = senoidal(1,1,0,100,0,3);
% [fr,fruta2] = senoidal(-1,1,0,100,0,3);
% figure(1)
% plot(fr,fruta1,fr,fruta2)
% kaka=interno(fruta1,fruta2)

% % %[t,x]=senoidal(A,f,tita,fm,t_ini,t_fin)
% [fr,fruta3] = senoidal(1,-1,0,100,0,3);
% figure(2)
% plot(fr,fruta1,fr,fruta3)
% kaka=interno(fruta1,fruta3)
