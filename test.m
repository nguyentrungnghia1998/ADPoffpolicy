O1=zeros(60,16);
Q=eye(4);
R=1;
Kk=K4;
for i=1:60
    O1(i,:)=-kron(yy(100*i-99,:),yy(100*i-99,:))+kron(yy(100*i+1,:),yy(100*i+1,:));
end
Ixx=zeros(60,16);
VIxx=zeros(6001,16);
for i=1:6001
    VIxx(i,:)=kron(yy(i,:),yy(i,:));
end
for i=1:60
    Ixx(i,:)=0.0005*(sum(VIxx(100*i-98:100*i,:))+0.5*VIxx(100*i-99,:)+0.5*VIxx(100*i+1,:));
end
Ixu=zeros(60,4);
VIxu=zeros(6001,4);
for i=1:6001
    VIxu(i,:)=kron(yy(i,:),uu(i,:));
end
for i=1:60
    Ixu(i,:)=0.0005*(sum(VIxu(100*i-98:100*i,:))+0.5*VIxu(100*i-99,:)+0.5*VIxu(100*i+1,:));
end
O2=-2*Ixx*kron(eye(4),Kk'*R)-2*Ixu*kron(eye(4),R);
O=[O1 O2];
V=-Ixx*reshape(Q+Kk'*R*Kk,[16 1]);
data=pinv(O)*V;
Pnew=reshape(data(1:16),[4 4]);
Knew=reshape(data(17:20),[1 4]);