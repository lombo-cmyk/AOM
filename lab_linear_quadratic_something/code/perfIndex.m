function ret = perfIndex(x0, K0)
% Function returning optimum performance index

    ret = x0'*K0*x0 / 2;
end