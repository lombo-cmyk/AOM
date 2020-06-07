function y=polokreslonosc(A)
%Funkcja do sprawdzania dodatniej p�okreslono�ci macierzy
[m,n]=size(A);
czy_jest_polokreslona=0;

for i=1:m
    %Je�eli podwyznacznik macierzy jest <0(czyli nie jest >=0)
    if det(A(1:i,1:i))<0
        disp('Macierz nie jest dodatnio p�okre�lona');
        czy_jest_polokreslona=0;
        break;
    end
    if i==m
        czy_jest_polokreslona=1;
    end
end
y=czy_jest_polokreslona;