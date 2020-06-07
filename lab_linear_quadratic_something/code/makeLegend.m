function legendArray = makeLegend(values, name)
% Function returning cell array of legend items basing on values set and name.

    for i = 1:length(values)
        str = string(num2str(values{i}));
        legendArray{i} = name + " = [";
        for j = 1:length(str)-1
           legendArray{i} = legendArray{i} + str(j) + ", ";
        end
        legendArray{i} = legendArray{i} + str(length(str)) + "]";
    end
end