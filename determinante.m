function [determinante] = determinante(MatrixA)
% Determinante por Laplace
%% Determiante 
    val1 = MatrixA(1,1)*((MatrixA(2,2)*MatrixA(3,3))-(MatrixA(2,3)*MatrixA(3,2)));
    val2 = MatrixA(1,2)*((MatrixA(2,1)*MatrixA(3,3))-(MatrixA(2,3)*MatrixA(3,1)));
    val3 = MatrixA(1,3)*((MatrixA(2,1)*MatrixA(3,2))-(MatrixA(2,2)*MatrixA(3,1)));
    determinante = val1 - val2 + val3;
end