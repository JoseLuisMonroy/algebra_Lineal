%  Monroy Fernandez Jose Luis
%  2BV1
%%% Gauss reduction funtion
function solutionVector = GaussReduction(matrixA, vectorA)
    % Gauss reduction
    matrixB = [matrixA vectorA];
    multiplicator = matrixB(2, 1) / matrixB(1, 1);
    % Uptdate Matrix B
    if multiplicator > 0

        for i = 1:4
            matrixB(2, i) = matrixB(2, i) + (matrixB(1, i) * -multiplicator);
        end

    else

        for i = 1:4
            matrixB(2, i) = matrixB(2, i) + (matrixB(1, i) * multiplicator);
        end

    end

    %disp(matrixB); %In order to show step by step remove the first' %'
    multiplicator = matrixB(3, 1) / matrixB(1, 1);
    %Uptdate matrix B
    if multiplicator > 0

        for i = 1:4
            matrixB(3, i) = matrixB(3, i) + (matrixB(1, i) * -multiplicator);
        end

    else

        for i = 1:4
            matrixB(3, i) = matrixB(3, i) + (matrixB(1, i) * multiplicator);
        end

    end

    %disp(matrixB); %In order to show step by step remove the first' %'
    multiplicator = matrixB(3, 2) / matrixB(2, 2);
    %Uptdate matrix B
    if multiplicator > 0

        for i = 2:4
            matrixB(3, i) = matrixB(3, i) + (matrixB(2, i) * -multiplicator);
        end

    else

        for i = 2:4
            matrixB(3, i) = matrixB(3, i) + (matrixB(2, i) * multiplicator);
        end

    end

    sprintf("Final matrix is: (form [a,b]")
    disp(matrixB);
    %% Backward substitution
    matrixAux1 = zeros(3);
    matrixAux2 = [0; 0; 0; ];

    for i = 1:3

        for k = 1:3
            matrixAux1(i, k) = matrixB(i, k);
        end

    end

    for i = 1:3
        matrixAux2(i, 1) = matrixB(i, 4);
    end

    solutionVector(3) = matrixAux2(3) / matrixAux1(3, 3);
    solutionVector(2) = matrixAux2(2) / (matrixAux1(2, 2) + (matrixAux1(2, 3) * solutionVector(3)));
    solutionVector(1) = matrixAux2(1) / (matrixAux1(1, 1) + (matrixAux1(2, 1) * solutionVector(2)) + (matrixAux1(1, 3) * solutionVector(3)));
end
