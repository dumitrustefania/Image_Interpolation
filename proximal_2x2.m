function out = proximal_2x2(f, STEP = 0.1)
    % ===================================================================================
    % Aplica Interpolare Proximala pe imaginea 2 x 2 f cu puncte intermediare echidistante.
    % f are valori cunoscute �n punctele (1, 1), (1, 2), (2, 1) ?i (2, 2).
    % Parametrii:
    % - f = imaginea ce se va interpola;
    % - STEP = distan?a dintre dou? puncte succesive.
    % ===================================================================================
    
    % TODO: Defineste coordonatele x si y ale punctelor intermediare.
    
    x_int = 1 : STEP : 2;
    y_int = 1 : STEP : 2;
    
    % Se afl? num?rul de puncte.
    n = length(x_int);

    % TODO: Cele 4 puncte �ncadratoare vor fi aceleasi pentru toate punctele din interior.
    
    x1 = y1 = 1;
    x2 = y2 = 2;

    % TODO: Initializeaza rezultatul cu o matrice nula n x n.
    out = zeros(n);

    % Se parcurge fiecare pixel din imaginea finala.
    for i = 1 : n
        for j = 1 : n
            % TODO: Afla cel mai apropiat pixel din imaginea initiala.
            % TODO: Calculeaza pixelul din imaginea finala.

            if (i < n/2 && j < n/2) %prima zona
                    out(i,j) = f(x1,y1);
            elseif (i < n/2 && j >= n/2) %a doua zona
                    out(i,j) = f(x1,y2);
            elseif (i >= n/2 && j < n/2) %a treia zona
                    out(i,j) = f(x2,y1);
            elseif(i >= n/2 && j >= n/2) %a patra zona
                    out(i,j) = f(x2,y2);
            endif
        endfor
    endfor

endfunction