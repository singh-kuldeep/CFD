% Assignment 1 (CFD & Heat Teansfer)

% Varaibles 
%MKS unit system is used through-out

Delta_X = 0.00001;
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
% assigning the value to the a_i and c_i
% a(1) = 1;
% a(2) = 3*K / Delta_X ;
% a(N-1) = 3*K / Delta_X ;
% a(N) = h + (2*K/Delta_X) ;


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

% P(1) = b(1) / a(1) ; 

% Q(1) = d(1) / a(1) ;

% for i=2:N-1
% 	P(i) = b(i)/( a(i) - c(i)*P(i-1) );
% 	Q(i) = ( d(i) + c(i)*Q(i-1) ) / ( a(i) - c(i)*P(i-1)) ;
% end

% Q(N) = ( d(N) + c(N)*Q(N-1) ) / ( a(N) - c(N)*P(N-1)) ;

% T(N) = Q(N) ;

% % tdjakf = 299 - ((S*5)/(100*h*K)) ; 
% 	% display(((S*0.05)/h*K));

% for i=N-1:-1:1
% 	T(i) = P(i)*T(i+1) + Q(i) ;
% % 	display(T(i));
% end

% for i=1:N
% 	T1(i) = ((S*( -X(i)*X(i) + 0.0025 ))/(2*K)) + ((S*0.05)/h) + T_0 ;
% end
[T]= TDMAA(c,a,b,d);

plot(X,T);




