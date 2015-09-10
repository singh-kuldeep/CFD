% Assignment 1 (CFD & Heat Teansfer)

% Varaibles 
%MKS unit system is used through-out

Delta_X = 0.05/1000;
Length = 0.05 ;
N = Length/ Delta_X + 1 ; 
X = linspace(0,Length,N);

K = 111 ; 
S = 2*10000 ;
h = 44 ;
T_0 = 298;

a_P = 1:N; 
a_E = 1:N ; 
a_W = 1:N;
d = 1:N ;
P = 1:N;
Q = 1:N;
T = 1:N ;



a_E(N) = h ; 
for i=1:N-1
	a_E(i) = 1;
end
a_W(1) = 0 ;
a_W(N) = K/Delta_X ; 
for i=2:N-1
	a_W(i) = 1 ; 
end

for i=1:N;
a_P(i) = a_E(i)+a_W(i);
end

%assigning the value to d_i 
d(1) = 0 ; 
d(N) = h*T_0 ; 

for i=2:N-1
	d(i) = S*Delta_X*Delta_X/K ;
end


[T] = TDMA(a_W,a_P,a_E,d);

plot(X,T);




