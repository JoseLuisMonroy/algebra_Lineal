%  Monroy Fernandez Jose Luis
%  2BV1

%% Initial Declaration
matrixA = [0.217, 0.732, 0.414; 0.508, 0.809, 0.376; 0.795, 0.886, 0.338; ];
vectorB = [0.741; 0.613; 0.485];

%% Begin of part 2.a
solutionVector1 = gaussReduction(matrixA, vectorB);
sprintf("Solution vector of the system is")
disp(solutionVector1);
%% End Of the part 2.a

%% Begin of part 2.b
vectorB = vectorB * 0.005;
solutionVector2 = gaussReduction(matrixA, vectorB);
sprintf("Solution vector of the system is")
disp(solutionVector2);
%% End of part 2.b

%% Begin of part 2.c
sprintf('First solution')
disp(solutionVector1)
sprintf('Second solution')
disp(solutionVector2)
% End of part 2.c 
%% Begin of part 3.1
[L, U, P]=lutx(matrixA);
%End of part 3.1
%% Gauss reductión funtion
function solutionVector = gaussReduction(matrixA, vectorA)
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

    disp(matrixB); %In order to show step by step remove the first' %'
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

    disp(matrixB); %In order to show step by step remove the first' %'
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

function [L,U,p] = lutx(A)
%LU factorizacion Triangular
% [L,U,p] = lutx(A) produce una matriz triangular inferior L, una matriz triangular superior U, y un vector de permutación p, tal que L*U = A(p,:).
[n,n] = size(A);
p = (1:n)’
for k = 1:n-1
% Find largest element below diagonal in k-th column
[r,m] = max(abs(A(k:n,k)));
m = m+k-1;
% Skip elimination if column is zero
if (A(m,k) ~= 0)
% Swap pivot row
if (m ~= k)
A([k m],:) = A([m k],:);
p([k m]) = p([m k]);
end
% Compute multipliers
i = k+1:n;
A(i,k) = A(i,k)/A(k,k);
% Update the remainder of the matrix
j = k+1:n;
A(i,j) = A(i,j) - A(i,k)*A(k,j);
end
end
% Separate result
L = tril(A,-1) + eye(n,n);
U = triu(A);
end 
