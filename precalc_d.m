function [Ix, Iy, Ixy] = precalc_d(I)
    % =========================================================================
    % Prealculeaza matricile Ix, Iy si Ixy ce contin derivatele dx, dy, dxy ale 
    % imaginii I pentru fiecare pixel al acesteia.
    % =========================================================================
    
    % Obtinem dimensiunea imaginii.
    [m n nr_colors] = size(I);
    
    % TODO: Tranforma matricea I in double.
    I = double(I);

    % Matricile derivate sunt umplute cu valoarea 0
    Ix = zeros(m,n);
    Iy = zeros(m,n);
    Ixy = zeros(m,n);

    for i = 1 : m
        for j = 1 : n

        % TODO: Calculeaza matricea cu derivate fata de x Ix.
        if(j==1 || j==n)
            Ix(i,j) =0;
        else
            Ix(i,j) = fx(I, i, j);
        endif

        % TODO: Calculeaza matricea cu derivate fata de y Iy.
        if(i==1 || i==m)
            Iy(i,j) = 0;
        else
            Iy(i,j) = fy(I, i, j);
        endif

        % TODO: Calculeaza matricea cu derivate fata de xy Ixy.
        if(j==1 || j==n || i==1 || i==m)
            Ixy(i,j) = 0;
        else
            Ixy(i,j) = fxy(I, i, j);
        endif

        endfor
    endfor 
endfunction
