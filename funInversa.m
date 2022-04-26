%  Monroy Fernandez Jose Luis
%  2BV1
%%% Inverse function

function []= funInversa(matrixAsociada)
    %Funcion Inversa
    v = [1, 1, 1];
    identidad = diag(v);
    matrizAinversa = [matrixAsociada identidad];
    disp(matrizAinversa);
    GaussJordan(matrizAinversa);
end