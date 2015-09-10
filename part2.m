 % Part 2

S = 44;
K = 111;


Delta_X = 0.05;
L = 1.5 ;
H = 3.0 ;

M = ( L / Delta_X ) + 2 ;
N = ( H / Delta_X ) + 2 ;

T = zeros(N,M) ; % Initialisation of temprature with zeros

for i=1:N  % Applying BC at X = 0 and X = L
	T(i,1) = 30 + 273 ;
	T(i,M) = 30 + 273 ; 
end

for j = 1:M
	T(1,j) = 273 + 400 ;
	T(N,j) = 273 + 300 ;
end

for i=2:N-1
	for j=2:M-1
		T(i,j) = (400+300+30)/3 + 273;
	end
end

a_P =  zeros(N,M);
a_E =  zeros(N,M);
a_W =  zeros(N,M);
a_N =  zeros(N,M);
a_S =  zeros(N,M);
D   =  zeros(N,M);


for i = 3:N-2
	for j = 3:M-2
		a_S(i,j) = 1 ;
		a_N(i,j) = 1 ;
		a_W(i,j) = 1 ;
		a_E(i,j) = 1 ;
	end
end

for i=3:N-2
	a_S(i,2) = 1 ;
	a_N(i,2) = 1 ;
	a_W(i,2) = 2 ;
	a_E(i,2) = 1 ;

	a_S(i,M-1) = 1 ;
	a_N(i,M-1) = 1 ;
	a_W(i,M-1) = 1 ;
	a_E(i,M-1) = 2 ;
end

for j = 3:M-2
	a_S(2,j) = 2 ;
	a_N(2,j) = 1 ;
	a_W(2,j) = 1 ;
	a_E(2,j) = 1 ;

	a_S(N-1,j) = 1 ;
	a_N(N-1,j) = 2 ;
	a_W(N-1,j) = 1 ;
	a_E(N-1,j) = 1 ;
end 

a_S(2,2) = 2 ;
a_N(2,2) = 1 ;
a_W(2,2) = 2 ;
a_E(2,2) = 1 ;

a_S(2,M-1) = 2 ;
a_N(2,M-1) = 1 ;
a_W(2,M-1) = 1 ;
a_E(2,M-1) = 2 ;

a_S(N-1,2) = 1 ;
a_N(N-1,2) = 2 ;
a_W(N-1,2) = 2 ;
a_E(N-1,2) = 1 ;

a_S(N-1,M-1) = 1 ;
a_N(N-1,M-1) = 2 ;
a_W(N-1,M-1) = 1 ;
a_E(N-1,M-1) = 2 ;		

for i=2:N-1 
	for j=2:M-1
	a_P(i,j) = a_E(i,j) + a_W(i,j) + a_N(i,j) + a_S(i,j) ;
	end
end		


for k=1:100

% move in x direction

for j = 2:M-1
	for i = 2:N-1
		D(i,j) = T(i,j-1)*a_W(i,j) + T(i,j+1)*a_E(i,j)+((S*Delta_X*Delta_X)/K);
		if i == 2 
			D(i,j) = D(i,j) + T(1,j)*a_S(2,j);
		elseif i == N-1
			D(i,j) = D(i,j) + T(N,j)*a_N(N-1,j);
		end
	end
end

for j = 2:M-1
	T(2:end-1,j) = TDMA(a_S(2:end-1,j),a_P(2:end-1,j),a_N(2:end-1,j),D(2:end-1,j));
end

% Move in y direction
for i = 2:N-1
	for j = 2:M-1
		D(i,j) = T(i-1,j)*a_S(i,j) + T(i+1,j)*a_N(i,j)+((S*Delta_X*Delta_X)/K);
		if j == 2 
			D(i,j) = D(i,j) + T(i,1)*a_W(i,2);
		elseif j == M-1
			D(i,j) = D(i,j) + T(i,M)*a_E(i,M-1);
		end
	end
end

for i = 2:N-1
	T(i,2:end-1) = TDMA(a_W(i,2:end-1),a_P(i,2:end-1),a_E(i,2:end-1),D(i,2:end-1));
end

 % display (T);
% contour(T) ;
 % shading interp;
 % surf(T);
 contourf(T,10,'ShowText','on');
% T(20,20)


end