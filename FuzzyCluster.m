clc; clear all, close all;
load iris.dat

index1 = [iris(:,1),iris(:,end)];
index2 = [iris(:,2),iris(:,end)];
index3 = [iris(:,3),iris(:,end)];

[center,U,objFcn]=fcm(iris,3);
figure,
    plot(objFcn)
    title('Objective Function Values')
    xlabel('banyak iterasi')
    ylabel('Objective Function Value')
    
maxU=max(U);
index1=find(U(1,:)==maxU);
index2=find(U(2,:)==maxU);
index3=find(U(3,:)==maxU);


figure,
line(iris(index1,1),iris(index1,2),iris(index1,3),'linestyle',...
    'none','marker','o','markersize',10,'color','g');
line(iris(index2,1),iris(index2,2),iris(index2,3),'linestyle',...
    'none','marker','x','markersize',10,'color','r');
line(iris(index3,1),iris(index3,2),iris(index3,3),'linestyle',...
    'none','marker','v','markersize',10,'color','b');
hold on
    plot(center(1,1),center(1,2),'ko','markersize',15,'LineWidth',2)
    plot(center(2,1),center(2,2),'kx','markersize',15,'LineWidth',2)
    plot(center(3,1),center(3,2),'kv','markersize',15,'LineWidth',2)
legend('otomasi','instalasi','pembangkit')
    xlabel('rata-rata nilai otomasi')
    ylabel('rata-rata nilai instalasi')
    zlabel('rata-rata nilai pembangkit')
grid;

cluster_n = 3
expo = 2.0;
max_iter = 100;
min_impro = 1e-6;
min_display = 5;
opsi = [expo max_iter min_impro min_display];

[U, center, obj] = fcm(iris,cluster_n,opsi);

sample = iris(10,:);
konsentrasi_mahasiswa=[]
for i=1:3
    konsentrasi_mahasiswa(i)=norm(U(i,:) - sample);
end

[value,rata]=sort(konsentrasi_mahasiswa);
rata_terkecil=rata(1);
if rata_terkecil==1
    disp('otomasi')
elseif rata_terkecil==2
    disp('instalasi')
elseif rata_terkecil==3
    disp('pembangkit');
end
