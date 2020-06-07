clc; clear all; close all;
% sekcja 1
A=[2 0; 0 1];
B=[3; 2];
[d1, ~]=size(A);
Q=[16 -20; -20 25];
R=7;
N=20;
F=0;
H=[B A*B];

if d1==rank(H)
   disp('Uk³ad jest sterowalny') 
else disp('Uk³ad jest niesterowalny') 
end
x(:,1)=[10;15]';

K(:,:,N)=ones(d1,d1)*F;


for i=N-1:-1:1
    K(:,:,i)=A'*(K(:,:,i+1)-K(:,:,i+1)*B*inv(R+B'*K(:,:,i+1)*B)*B'*K(:,:,i+1))*A+Q;  
end
J=0.5*x(:,1)'*K(:,:,1)*x(:,1);
for i=1:N-1
   u(i)=-inv(R+B'*K(:,:,i+1)*B)*B'*K(:,:,i+1)*A*x(:,i);
   J = J+0.5*(4*x(1,i)-5*x(2,i))^2 + 7*u(i)^2;
   x(:,i+1)=A*x(:,i)+B*u(i)';
end
figure(1)
plot(1:N,x(1,:), 'r*');
xlabel('iteracja')
ylabel('x1')

figure(2)
plot(1:N,x(2,:), 'r*');
xlabel('iteracja')
ylabel('x2')

figure(3)
plot(1:N-1,u, 'r*');
xlabel('iteracja')
ylabel('u')

disp(sprintf('Wartosc wskaznika jakosci to: %s',num2str(J)))
