function [MatrixFinal] = GaussJordan(matrixExtend)
%Gauss Jordan 
%   Mteodo de gauss Jordan para la matrices 
    sz = size(matrixExtend);
    multiplicator = matrixExtend(2, 1) / matrixExtend(1, 1);
    % Uptdate Matrix B
    if multiplicator > 0

        for i = 1:sz(1,2)
            matrixExtend(2, i) = matrixExtend(2, i) + (matrixExtend(1, i) * -multiplicator);
        end

    else

        for i = 1:sz(1,2)
            matrixExtend(2, i) = matrixExtend(2, i) + (matrixExtend(1, i) * multiplicator);
        end

    end

    %disp(matrixExtend); %In order to show step by step remove the first' %'
    multiplicator = matrixExtend(3, 1) / matrixExtend(1, 1);
    %Uptdate matrix B
    if multiplicator > 0

        for i = 1:sz(1,2)
            matrixExtend(3, i) = matrixExtend(3, i) + (matrixExtend(1, i) * -multiplicator);
        end

    else

        for i = 1:sz(1,2)
            matrixExtend(3, i) = matrixExtend(3, i) + (matrixExtend(1, i) * multiplicator);
        end

    end

    %disp(matrixExtend); %In order to show step by step remove the first' %'
    multiplicator = matrixExtend(3, 2) / matrixExtend(2, 2);
    %Uptdate matrix B
    if multiplicator > 0

        for i = 2:sz(1,2)
            matrixExtend(3, i) = matrixExtend(3, i) + (matrixExtend(2, i) * -multiplicator);
        end

    else

        for i = 2:sz(1,2)
            matrixExtend(3, i) = matrixExtend(3, i) + (matrixExtend(2, i) * multiplicator);
        end

    end

    %disp(matrixExtend); %In order to show step by step remove the first' %'
    multiplicator = matrixExtend(1, 2) / matrixExtend(2, 2);
    %Uptdate matrix B

        for i = 2:sz(1,2)
            matrixExtend(1, i) = matrixExtend(1, i) + (matrixExtend(2, i) * -multiplicator);
        end
    
    %disp(matrixExtend); %In order to show step by step remove the first' %'
    multiplicator = matrixExtend(2, 3) / matrixExtend(3, 3);
    %Uptdate matrix B

    for i = 3:sz(1,2)
        matrixExtend(2, i) = matrixExtend(2, i) + (matrixExtend(3, i) * -multiplicator);
    end

    %disp(matrixExtend); %In order to show step by step remove the first' %'
    multiplicator = matrixExtend(1, 3) / matrixExtend(3, 3);
    %Uptdate matrix B

    for i = 3:sz(1,2)
        matrixExtend(1, i) = matrixExtend(1, i) + (matrixExtend(3, i) * -multiplicator);
    end
    
    for i = 1:3
        multiplicator = 1 / matrixExtend (i, i);
        matrixExtend(i, i) = matrixExtend(i,i) * multiplicator;
        for j= 4 : sz(1,2)
            matrixExtend(i, j) = matrixExtend(i,j) * multiplicator;
        end
        
    end

    disp(matrixExtend);

    MatrixFinal = matrixExtend;
end