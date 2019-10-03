function sim = gaussianKernel(x1, x2, sigma)

x1 = x1(:); x2 = x2(:);


xny         =   x1-x2;
Normxny    =   xny'*xny;
sim         =   exp(-Normxny/(2*sigma^2));

end
