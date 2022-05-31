function [V_, W_] = Lanczos_rational(A, B, C, sigma)
  [n] = size(A);

  S = inv((A - sigma(1)*eye(n))) * B; 
  R = inv((A - sigma(1)*eye(n))') * C'; 
  
  V = S;
  W = (eye(n) / V)';
  H(1, 0) = S0 / V;
  G(1, 0) = R0 / W;
  
  V_(1) = V;
  W_(1) = W;
  
  m = length(sigma);
  for k=1:m
    if k < m 
      if sigma(k+1) == Inf 
        S(k) = A*V(k);
        R(k) = A'*W(k);
      else 
        S(k) = inv(A - sigma(k+1)*eye(n)) * V(k); 
        R(k) = inv(A - sigma(k+1)*eye(n)) * W(k);
      endif
      
      H(k) = W_(k)' * S(k);
      G(k) = V_(k)' * R(k);
      
      S(k) -= V_(k) * H(k);
      R(k) -= W_(k) * G(k);
      
      [V(k+1), H(k+1,k)] = qr(S(k));
      [W(k+1), G(k+1,k)] = qr(R(k));
      
      [P(k), D(k), Q(k)] = svd(W'(k+1)*V(k+1));
      
      V(k+1) *= Q(k) * sqrt(D(k));
      W(k+1) *= P(k) * sqrt(D(k));
      
      H(k+1, k) = sqrt(D(k))*Q'(k)*H(k+1, k);
      G(k+1, k) = sqrt(D(k))*P'(k)*G(k+1, k);
      
      V_(k+1) = [V_(k), V(k+1)];
      W_(k+1) = [W_(k), W(k+1)];
    else 
      if sigma(m+1) == Inf 
        S(m) = A * B;
        R(m) = A' * C;
      else 
        S(m) = inv(A) * B;
        R(m) = inv(A') * C;
      endif
      
      H(m) = W_(m)' * S(m);
      G(m) = V_(m)' * R(m);
      
      S(m) -= V_(m) * H(m);
      R(m) -= W_(m) * G(m);
      
      [V(m+1), H(m+1,m)] = qr(S(m));
      [W(m+1), G(m+1,m)] = qr(R(m));
      
      [P(m), D(m), Q(m)] = svd(W'(m+1)*V(m+1));
      
      V(m+1) *= Q(m) * sqrt(D(m));
      W(m+1) *= P(m) * sqrt(D(m));
      
      H(m+1, m) = sqrt(D(m))*Q'(m)*H(m+1, m);
      G(m+1, m) = sqrt(D(m))*P'(m)*G(m+1, m);
      
      V_(m+1) = [V_(m), V(m+1)];
      W_(m+1) = [W_(m), W(m+1)];
    endif
  endfor
endfunction