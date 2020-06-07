function y=symetrycznosc(A)
[m,n]=size(A);
symetryczna=0;

for i=1:m
    for j=1:n
        %Dodano tutaj wspó³czynnik uwzglêdniaj¹cy b³êdy numeryczne
        %Sprawdzenie symetrycznoœci macierzy sprowadza siê do zbadania
        %czy wartoœci A(i,j) i A(j,i) s¹ równe
        if A(i,j) >= A(j,i)+0.0001 || A(i,j) <= A(j,i)-0.0001
            symetryczna = 0;
            break;
        end
        %Je¿eli dotar³o do koñca obu iteracji bez przerwy
        if i==m && j==n
            symetryczna = 1;
        end
    end
end
y=symetryczna;