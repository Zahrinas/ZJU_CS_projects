function [result] = detect(result)

    tau = 0.004;
    for i = 1:8
        if result(i) > tau
            result(i) = 1;
        elseif result(i) < -tau
            result(i) = -1;
        else
            result(i) = 0;
        end
    end
    
    result = (sum(abs(result)) >= 4);
end