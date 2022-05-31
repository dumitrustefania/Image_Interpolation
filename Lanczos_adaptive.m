function [A, B, C] = Lanzcos_adaptive(A, B, C, s1, s2, tol)
  [n] = size(A);
  H = eye(n);
  eps = 1;
  m = 1;
  
  while eps > tol
    [V, W] = Lanzcos_rational(A, B, C);
    A = W' * A * V;
    B = W' * B;
    C = C * V;
    
    h = H;
    I = eye(n);
    H = C * inv(H*I -A) * B;
       
    eps = norm(H - h, Inf);
  endwhile
endfunction