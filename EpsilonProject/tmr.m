function [output] = tmr(input, epsilon)
    output = input.*0;
    sd = std(input)
    m = mean(input)
    
    if(sd > epsilon)
        for idx = 1:numel(input)
            x(idx) = abs(input(idx) - m);
        end
        [mx, mxIdx] = max(x);
        output(mxIdx) = 1;
    end
end