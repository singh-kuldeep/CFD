% Assignment 1 (CFD & Heat Teansfer)

% Varaibles 
%MKS unit system is used through-out

Delta_X = 0.05/1000;
Length = 0.05 ;
N = Length/ Delta_X + 2 ; 
X = linspace(0,Length,N);

K = 111 ; 
S = 2*10000 ;
h = 44 ;
T_0 = 298;

a = 1:N; 
b = 1:N ; 
c = 1:N;
d = 1:N ;
P = 1:N;
Q = 1:N;
T = 1:N ;
T1 = 1:N;

b(1) = 1 ;
b(N-1) = 2*K/Delta_X ;
b(N) = h ; 
for i=2:N-2
	b(i) = K/Delta_X;
end
c(1) = 0 ;
c(2) = 2*K/Delta_X ;
c(N) = 2*K/Delta_X ; 
for i=3:N-1
	c(i) = K/Delta_X ; 
end

for i=1:N;
a(i) = b(i)+c(i);
end

%assigning the value to d_i 
d(1) = 0 ; 
d(N) = h*T_0 ; 

for i=2:N-1
	d(i) = S*Delta_X ;
end


[T] = TDMA(c,a,b,d);

plot(X,T);




