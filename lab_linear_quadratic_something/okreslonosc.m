function y=okreslonosc(A)
%Funkcja do sprawdzania dodatniej okreœlonoœci macierzy
[m,n]=size(A);
czy_jest_okreslona=0;

for i=1:m
    %Je¿eli podwyznacznik macierzy jest <=0(czyli nie jest >0)
    if det(A(1:i,1:i))<=0
        czy_jest_okreslona=0;
        break;
    end
    if i==m
        czy_jest_okreslona=1;
    end
end
y=czy_jest_okreslona;