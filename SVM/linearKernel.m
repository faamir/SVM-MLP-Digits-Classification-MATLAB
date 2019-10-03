function sim = linearKernel(x1, x2)

x1 = x1(:); x2 = x2(:);

% mohasebe kernel
sim = x1' * x2;  

end