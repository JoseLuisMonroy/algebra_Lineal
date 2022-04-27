function [L, U, p, siguiente, deter] = lux(MatrixA)
%LUP 
    %L
    multiplicador = MatrixA(2,1) / MatrixA(1,1);
    lini = [1 ,1, 1];
    L = diag(lini);
    L(2, 1) = -multiplicador;
    multiplicador = MatrixA(3,1) / MatrixA(1,1);
    L(3, 1) = -multiplicador;
    multiplicador = MatrixA(3,1) / MatrixA(1,1);
    L(3, 2) = - multiplicador;

    %U
    
    multiplicator = MatrixA(2, 1) / MatrixA(1, 1);
    % Uptdate Matrix B
        for i = 1:3
            MatrixA(2, i) = MatrixA(2, i) + (MatrixA(1, i) * -multiplicator);
        end
    %disp(MatrixA); %In order to show step by step remove the first' %'
    multiplicator = MatrixA(3, 1) / MatrixA(1, 1);
    %Uptdate matrix B
   
        for i = 1:3
            MatrixA(3, i) = MatrixA(3, i) + (MatrixA(1, i) * -multiplicator);
        end

    %disp(MatrixA); %In order to show step by step remove the first' %'
    multiplicator = MatrixA(3, 2) / MatrixA(2, 2);
    %Uptdate matrix B

        for i = 2:3
            MatrixA(3, i) = MatrixA(3, i) + (MatrixA(2, i) * -multiplicator);
        end

    U = MatrixA;
    

    %%De aqui ya no le entendí a que se refiere con P y con Sig 
    p = 2;
    resi = mod(p,2);
    
    if resi == 0
        siguiente = [1, 0, 0];
    
    else
        siguiente = [-1, 0, 0];
    end
    
end

