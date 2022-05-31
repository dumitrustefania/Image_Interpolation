function out = proximal_rotate_RGB(img, rotation_angle)
    % =========================================================================
    % Aplica Interpolarea Proximala pentru a roti o imagine RGB cu un unghi dat.
    % =========================================================================
    
   % TODO: Extrage canalul rosu al imaginii.
    red_channel = img(:, :, 1);

    % TODO: Extrage canalul verde al imaginii.
    green_channel = img(:, :, 2);

    % TODO: Extrage canalul albastru al imaginii.
    blue_channel = img(:, :, 3);
    
    % TODO: Aplica rotatia pe fiecare canal al imaginii.
    red = proximal_rotate(red_channel, rotation_angle);
    green = proximal_rotate(green_channel, rotation_angle);
    blue = proximal_rotate(blue_channel, rotation_angle);

    % TODO: Formeaza imaginea finala concaten�nd cele 3 canale de culori.
    out = cat(3, red, green, blue);
endfunction