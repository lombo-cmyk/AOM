function y=polokreslonosc(A)
%Funkcja do sprawdzania dodatniej półokresloności macierzy
[m,n]=size(A);
czy_jest_polokreslona=0;

for i=1:m
    %Jeżeli podwyznacznik macierzy jest <0(czyli nie jest >=0)
    if det(A(1:i,1:i))<0
        disp('Macierz nie jest dodatnio półokreślona');
        czy_jest_polokreslona=0;
        break;
    end
    if i==m
        czy_jest_polokreslona=1;
    end
end
y=czy_jest_polokreslona;