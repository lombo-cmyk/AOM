function y=symetrycznosc(A)
[m,n]=size(A);
symetryczna=0;

for i=1:m
    for j=1:n
        %Dodano tutaj wsp�czynnik uwzgl�dniaj�cy b��dy numeryczne
        %Sprawdzenie symetryczno�ci macierzy sprowadza si� do zbadania
        %czy warto�ci A(i,j) i A(j,i) s� r�wne
        if A(i,j) >= A(j,i)+0.0001 || A(i,j) <= A(j,i)-0.0001
            symetryczna = 0;
            break;
        end
        %Je�eli dotar�o do ko�ca obu iteracji bez przerwy
        if i==m && j==n
            symetryczna = 1;
        end
    end
end
y=symetryczna;