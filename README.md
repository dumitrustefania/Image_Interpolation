**Dumitru Bianca Stefania**
**312CA**

## Tema #2 - Metode Numerice - Interpolare aplicata pe imagini

# Observatii:

- Pentru interpolarea imaginilor color (RGB), am aplicat algoritmul necesar pe fiecare canal de culoare in parte (rosu, verde, albastru)

- La resize, pentru a putea redimensiona corect imaginile, le-am mutat originea din punctul (1,1) in punctul (0,0), iar factorii de scalare (de la o imagine mxn la una pxq) au devenit:
    - s_x = (q - 1) / (n - 1)
   	- s_y = (p - 1) / (m - 1)

## Interpolare Proximala :

- Este cea mai simpla metpda de interpolare: se cauta cel mai apropiat punct cunoscut si se aproximeaza valoarea functiei din acesta

- Pentru cazul 2x2, am determinat in care dintre cele 4 zone patratice in care este impartita imaginea se afla punctul cautat, pentru a putea aproxima corect valoarea punctului curent

- Pentru resize, am aplicat indicilor transformarea inversa de redimensionare, dupa care i-am readus la sistemul cu originea in (1,1) si le-am rotunjit valoarea

- Pentru rotate, am aplicat indicilor transformarea inversa de rotire, dupa care i-am readus la sistemul cu originea in (1,1) si le-am rotunjit valoarea. Pe baza lor, am calculat coeficientii de interpolare cu ajutorul functiei proximal_coef, iar apoi valoarea interpolata a pixelului dupa formula explicata in enunt

## Interpolare Bicubica :

- Am calculat matricile Ix, Iy si Ixy ce contin derivatele dx, dy, dxy ale imaginii pentru fiecare pixel

- Am aproximat valoarea derivatelor fx fy si fxy cu ajutorul diferentelor finite (egale cu jumatatea diferentei dintre punctul urmator si cel anterior)

- Cu ajutorul matricilor Ix, Iy si Ixy, am calculat matricea A a coeficientilor de interpolare descrisa in enunt

- Valoarea interpolata a functiei in fiecare punct va fi egala cu [1 x x^2 x^3] * A * [1 y y^2 y^3]

## Interpolare Lanczos :

- Interpolarea Lanczos este o metoda bazata pe potrivirea momentelor multipunct si este considerata o metoda puternica pentru problemele de reducere a ordinii modelului, intrucat este legata de subspatiile rationale Krylov si se bazeaza pe selectia unor puncte de interpolare

- Am implementat 3 algoritmi de tip Lanczos, urmarind indicatiile si pseudocodul din enuntul temei:

# Algoritmul Standard Bloc Nesimetric
# Algoritmul Rational Bloc
# Algoritmul Rational de ordin Adaptiv
