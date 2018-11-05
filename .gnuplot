se grid
se samples 1000

e=exp(1)

gauss(s,x)=1/sqrt(2*pi*s**2)*e**(-x**2/(2*s**2))
sec(x)=1/cos(x)
csc(x)=1/sin(x)
cot(x)=1/tan(x)
sech(x)=1/cosh(x)
csch(x)=1/sinh(x)
coth(x)=1/tanh(x)
asech(x)=log(sqrt(1/x-1)*sqrt(1/x+1)+1/x)
acsch(x)=log(1/x+sqrt(1/(x*x)+1))
acoth(x)=0.5*log((x+1)/(x-1))
theta(x)=x>0?1:0
