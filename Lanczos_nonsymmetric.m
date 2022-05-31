function H = Lanczos_nonsymmetric(A, V, W, m)
  
  [Q, R] = qr(W' * V);

  V(1) = V * inv(R);
  W(1) = W*Q;
  Vt(2) = A*V1;
  Wt(2) = A'*W1;

  for j=1:m
    alpha(j) = W(j)'*Vt(j+1);
    Vt(j+1) -= V(j)*alpha(j);
    Wt(j+1) -= W(j)*alpha(j)';
    
    beta = Vt(j+1)/V(j+1);
    delta = Wt(j+1)/W(j+1);
    delta = delta';
    
    [U, S, Z] = svd(W(j+1)' * V(j+1));

    delta = delta * U * sqrt(S);
    beta = sqrt(S) * Z' * beta;

    V(j+1) = V(j+1) * Z * (1/sqrt(S));
    W(j+1) = W(j+1) * U * (1/sqrt(S));

    Vt(j+2) = A * V(j+1) - V(j)*delta;
    Wt(j+2) = A' * W(j+1) - W(j)*beta'; 

    A(m) = W(m)' * A * V(m);
    B(m) = W(m)' * B;
    C(m) = C * V(m);
  endfor

  I = eye(m);
  H = C * inv(s*I -A) * B;
endfunction