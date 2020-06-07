function y=funkcja_glowna(x10,x20,A,B,d1,Q,R,N,F,sprawdzenie)
counter1=0;
counter2=0;
x(:,1)=[x10;x20]';
K(:,:,N)=ones(d1,d1)*F;

%Wyznaczanie wartoœci macierzy Ki
    for i=N-1:-1:1
        K(:,:,i)=A'*(K(:,:,i+1)-K(:,:,i+1)*B*inv(R+B'*K(:,:,i+1)*B)*B'*K(:,:,i+1))*A+Q;  
    end
    
    if(sprawdzenie==1) % Je¿eli chcemy sprawdziæ za³o¿enia LQ
        %Sprawdzenie za³o¿eñ problemu LQ - symetrycznoœæ macierzy K
        for i=1:N
            if (symetrycznosc(K(:,:,i)) == 0)
               disp(['Macierz K' num2str(i) ' nie jest symetryczna']);
               counter1=counter1+1;
            end
            if i==N && counter1==0
                disp('Macierze Ki s¹ symetryczne');
            end
        end

        %Sprawdzenie za³o¿eñ problemu LQ - dodatnia pó³okreœlonoœæ macierzy K
        for i=1:N
            if (polokreslonosc(K(:,:,i)) == 0)
                disp(['Macierz K' num2str(i) ' nie jest dodatnio pó³okreœlona']);
                counter2=counter2+1;
            end
            if i==N && counter2==0
                disp('Macierze Ki s¹ dodatnio pó³okreœlone');
            end
        end
    end
    
%Wyliczanie wartoœci sterowania, zmiennych stanu i wskaŸnika jakoœci
    J=0.5*x(:,1)'*K(:,:,1)*x(:,1);
    for i=1:N-1
       u(i)=-inv(R+B'*K(:,:,i+1)*B)*B'*K(:,:,i+1)*A*x(:,i);
       J = J+0.5*((3*x(1,i)-6*x(2,i))^2 + 15*u(i)^2);
       x(:,i+1)=A*x(:,i)+B*u(i)';
    end

y={u,x,J,K};