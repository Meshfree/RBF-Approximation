function f = MarschnerLobb(x,y,z)


alpha =0.002;
fm = 10;

f = (1 + alpha * (1+ cos(2*fm) * pi * cos(1/2 * pi * sqrt(x.^2 + y.^2)) -sin(pi*z/2))/(2* (1+alpha)) ) ;
end