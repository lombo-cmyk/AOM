clc
clear all

w = 6;
n = 4;
val = [2 5 3 2];
wt = [3 2 4 1];
%val = [10 40 30 50];
%wt = [5 4 6 3];

for r = 1:(w+1)
    mat(1,r) = 0;
end
for c=1:(n+1) 
    mat(c,1)= 0;
end

% Main logic
for item=1:n
    for capacity=1:w
        maxValWithoutCurr = mat(item,capacity+1); 
        maxValWithCurr = 0; 

        weightOfCurr = wt(item); 
        if (capacity >= weightOfCurr)
            maxValWithCurr = val(item); 

            remainingCapacity = capacity - weightOfCurr; 
            maxValWithCurr =maxValWithCurr + mat(item,remainingCapacity+1);
        end

        mat(item+1,capacity+1) = max(maxValWithoutCurr, maxValWithCurr);
    end
end

mat(n+1,w+1)

