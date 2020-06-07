clc; clear all; close all;

% Macierze A,B z r�wna� stanu
A=[1 0; 0 3];
B=[1; 2];

%Macierze Q i R na podstawie wska�nika jako�ci
Q=[9 -18; -18 36];
R=15;

%Parametr F
F = 0;

%Ilo�� iteracji
N=20;

%Warunki pocz�tkowe
x10=10;
x20=15;

%Sprawdzenie za�o�e� problemu LQ - symetryczno�� macierzy Q,R,F
disp('Sprawdzenie za�o�e� problemu LQ');
if issymmetric(Q) 
    disp('Macierz Q jest symetryczna');
else disp('Macierz Q jest niesymetryczna');
end

if issymmetric(R) 
    disp('Macierz R jest symetryczna');
else disp('Macierz R jest niesymetryczna');
end

if issymmetric(F) 
    disp('Macierz F jest symetryczna');
else disp('Macierz F jest niesymetryczna');
end

%Sprawdzenie za�o�e� problemu LQ - dodatnia polokreslonosc macierzy Q,F
if polokreslonosc(Q)==1 
    disp('Macierz Q jest dodatnio p�okre�lona');
else disp('Macierz Q nie jest dodatnio p�okre�lona');
end
if polokreslonosc(F)==1 
    disp('Macierz F jest dodatnio p�okre�lona');
else disp('Macierz F nie jest dodatnio p�okre�lona');
end

%Sprawdzenie za�o�e� problemu LQ - dodatnia polokreslonosc macierzy R
if okreslonosc(R)==1 
    disp('Macierz R jest dodatnio okre�lona');
else disp('Macierz R nie jest dodatnio okre�lona');
end

%Sprawdzenie sterowalno�ci
[d1, ~]=size(A);
H=[B A*B];
if d1==rank(H)
   disp('Uk�ad jest sterowalny') 
else disp('Uk�ad jest niesterowalny') 
end

disp('                       ');
%% Warunki poczatkowe dla zbadania ich wp�ywu na przebiegi czasowe
x10_1=10;
x20_1=15;
x10_2=12;
x20_2=15;
x10_3=10;
x20_3=17;

%Wywo�anie oblicze� dla r�nych warunk�w pocz�tkowych
%Ostatni parametr decyduje czy chcemy sprawdzi� symetryczno�� i dodatni�
%p�okre�lono�� macierzy Ki

w1 = funkcja_glowna(x10_1,x20_1,A,B,d1,Q,R,N,F,1);
u_1 = w1{1,1};
x_1 = w1{1,2};
J_1 = w1{1,3};

w2 = funkcja_glowna(x10_2,x20_2,A,B,d1,Q,R,N,F,0);
u_2 = w2{1,1};
x_2 = w2{1,2};
J_2 = w2{1,3};

w3 = funkcja_glowna(x10_3,x20_3,A,B,d1,Q,R,N,F,0);
u_3 = w3{1,1};
x_3 = w3{1,2};
J_3 = w3{1,3};


%Wykresy zbiorcze dla r�nych warunk�w pocz�tkowych - x1
figure(1)
plot(1:N,x_1(1,:), 'r*');
xlabel('iteracja')
ylabel('x1')
title('Wp�yw warunk�w pocz�tkowych na x1');
hold on
plot(1:N,x_2(1,:), 'g*');
hold on
plot(1:N,x_3(1,:), 'b*');
hold on
plot(1:N,x_1(1,:), 'r');
hold on
plot(1:N,x_2(1,:), 'g');
hold on
plot(1:N,x_3(1,:), 'b');
hold off
legend(['x10= ' num2str(x10_1) ', x20= ' num2str(x20_1)],['x10= ' num2str(x10_2) ', x20= ' num2str(x20_2)],['x10= ' num2str(x10_3) ', x20= ' num2str(x20_3)],'Location','east');



%Wykresy zbiorcze dla r�nych warunk�w pocz�tkowych - x2
figure(2)
plot(1:N,x_1(2,:), 'r*');
xlabel('iteracja')
ylabel('x2')
title('Wp�yw warunk�w pocz�tkowych na x2');
hold on
plot(1:N,x_2(2,:), 'g*');
hold on
plot(1:N,x_3(2,:), 'b*');
hold on
plot(1:N,x_1(2,:), 'r');
hold on
plot(1:N,x_2(2,:), 'g');
hold on
plot(1:N,x_3(2,:), 'b');
hold off
legend(['x10= ' num2str(x10_1) ', x20= ' num2str(x20_1)],['x10= ' num2str(x10_2) ', x20= ' num2str(x20_2)],['x10= ' num2str(x10_3) ', x20= ' num2str(x20_3)],'Location','east');


%Wykresy zbiorcze dla r�nych warunk�w pocz�tkowych - u
figure(3)
plot(1:N-1,u_1, 'r*');
xlabel('iteracja')
ylabel('u')
title('Wp�yw warunk�w pocz�tkowych na u');
hold on
plot(1:N-1,u_2, 'g*');
hold on
plot(1:N-1,u_3, 'b*');
hold on
plot(1:N-1,u_1, 'r');
hold on
plot(1:N-1,u_2, 'g');
hold on
plot(1:N-1,u_3, 'b');
hold off
legend(['x10= ' num2str(x10_1) ', x20= ' num2str(x20_1)],['x10= ' num2str(x10_2) ', x20= ' num2str(x20_2)],['x10= ' num2str(x10_3) ', x20= ' num2str(x20_3)],'Location','east');


%Warto�ci wska�nik�w jako�ci dla r�nych warunk�w pocz�tkowych
disp(['Wartosc wskaznika jakosci to: ' num2str(J_1) ' dla x10 = ' num2str(x10_1) ', x20 = ' num2str(x20_1)]);
disp(['Wartosc wskaznika jakosci to: ' num2str(J_2) ' dla x10 = ' num2str(x10_2) ', x20 = ' num2str(x20_2)]);
disp(['Wartosc wskaznika jakosci to: ' num2str(J_3) ' dla x10 = ' num2str(x10_3) ', x20 = ' num2str(x20_3)]);



%% Wywo�anie oblicze� dla r�nych warto�ci R

%Warto�ci R dla por�wnania
R1 = 3;
R2 = 15;
R3 = 30;

%Ostatni parametr decyduje czy chcemy sprawdzi� symetryczno�� i dodatni�
%p�okre�lono�� macierzy Ki
w1 = funkcja_glowna(x10,x20,A,B,d1,Q,R1,N,F,0);
u_1 = w1{1,1};
x_1 = w1{1,2};
J_1 = w1{1,3};

w2 = funkcja_glowna(x10,x20,A,B,d1,Q,R2,N,F,0);
u_2 = w2{1,1};
x_2 = w2{1,2};
J_2 = w2{1,3};

w3 = funkcja_glowna(x10,x20,A,B,d1,Q,R3,N,F,0);
u_3 = w3{1,1};
x_3 = w3{1,2};
J_3 = w3{1,3};


%Wykresy zbiorcze dla r�nych warto��i R - x1
figure(4)
plot(1:N,x_1(1,:), 'r*');
xlabel('iteracja')
ylabel('x1')
title('Wp�yw warto�ci R na x1');
hold on
plot(1:N,x_2(1,:), 'g*');
hold on
plot(1:N,x_3(1,:), 'b*');
hold on
plot(1:N,x_1(1,:), 'r');
hold on
plot(1:N,x_2(1,:), 'g');
hold on
plot(1:N,x_3(1,:), 'b');
hold off
legend(['R= ' num2str(R1)],['R= ' num2str(R2)],['R= ' num2str(R3)],'Location','east');



%Wykresy zbiorcze dla r�nych warto��i R - x2
figure(5)
plot(1:N,x_1(2,:), 'r*');
xlabel('iteracja')
ylabel('x2')
title('Wp�yw warto�ci R na x2');
hold on
plot(1:N,x_2(2,:), 'g*');
hold on
plot(1:N,x_3(2,:), 'b*');
hold on
plot(1:N,x_1(2,:), 'r');
hold on
plot(1:N,x_2(2,:), 'g');
hold on
plot(1:N,x_3(2,:), 'b');
hold off
legend(['R= ' num2str(R1)],['R= ' num2str(R2)],['R= ' num2str(R3)],'Location','east');


%Wykresy zbiorcze dla r�nych warto��i R - u
figure(6)
plot(1:N-1,u_1, 'r*');
xlabel('iteracja')
ylabel('u')
title('Wp�yw warto�ci R na u');
hold on
plot(1:N-1,u_2, 'g*');
hold on
plot(1:N-1,u_3, 'b*');
hold on
plot(1:N-1,u_1, 'r');
hold on
plot(1:N-1,u_2, 'g');
hold on
plot(1:N-1,u_3, 'b');
hold off
legend(['R= ' num2str(R1)],['R= ' num2str(R2)],['R= ' num2str(R3)],'Location','east');


%Warto�ci wska�nik�w jako�ci dla r�nych warto��i R
disp(['Wartosc wskaznika jakosci to: ' num2str(J_1) ' dla R = ' num2str(R1)]);
disp(['Wartosc wskaznika jakosci to: ' num2str(J_2) ' dla R = ' num2str(R2)]);
disp(['Wartosc wskaznika jakosci to: ' num2str(J_3) ' dla R = ' num2str(R3)]);


%% Ustalanie si� element�w macierzy K

%Parametry startowe
x10=10;
x20=15;
R=7;

%Ostatni parametr decyduje czy chcemy sprawdzi� symetryczno�� i dodatni�
%p�okre�lono�� macierzy Ki
w = funkcja_glowna(x10,x20,A,B,d1,Q,R,N,F,0);
K_ = w{1,4};

figure(7)
for j=1:N
    plot(j,K_(1,1,j), 'r*');
    hold on
    plot(j,K_(1,1,j), 'r');
    set ( gca, 'xdir', 'reverse' )
    xlabel('iteracja')
    ylabel('K - element pierwszy wiersz pierwsza kolumna')
    title('Ustalanie si� element�w macierzy K');
    hold on
    if j==N
        hold off 
    end     
end

figure(8)
for j=1:N
    plot(j,K_(1,2,j), 'g*');
    hold on
    plot(j,K_(1,2,j), 'g');
    set ( gca, 'xdir', 'reverse' )
    xlabel('iteracja')
    ylabel('K - element pierwszy wiersz druga kolumna')
    title('Ustalanie si� element�w macierzy K');
    hold on
    if j==N
        hold off
    end
end

figure(9)
for j=1:N
    plot(j,K_(2,1,j), 'b*');
    hold on
    plot(j,K_(2,1,j), 'b');
    set ( gca, 'xdir', 'reverse' )
    xlabel('iteracja')
    ylabel('K - element drugi wiersz pierwsza kolumna')
    title('Ustalanie si� element�w macierzy K');
    hold on
    if j==N
        hold off
    end
end

figure(10)
for j=1:N
    plot(j,K_(2,2,j), 'm*');
    hold on
    plot(j,K_(2,2,j), 'm');
    set ( gca, 'xdir', 'reverse' )
    xlabel('iteracja')
    ylabel('K - element drugi wiersz druga kolumna')
    title('Ustalanie si� element�w macierzy K');
    hold on
    if j==N
        hold off
    end
end
