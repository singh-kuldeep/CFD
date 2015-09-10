function [T] = TDMA(a_W, a_P, a_E, D)
	N = length(a_P);
	
	P = 1:N;
	Q = 1:N;
	T = 1:N;

	P(1) = a_E(1) / a_P(1) ; 
	Q(1) = D(1) / a_P(1) ;

	for i=2:N-1
		P(i) = a_E(i)/( a_P(i) - a_W(i)*P(i-1) );
		Q(i) = ( D(i) + a_W(i)*Q(i-1) ) / ( a_P(i) - a_W(i)*P(i-1)) ;
	end
	Q(N) = ( D(N) + a_W(N)*Q(N-1) ) / ( a_P(N) - a_W(N)*P(N-1)) ;
	T(N) = Q(N) ;
	for i=N-1:-1:1
		T(i) = P(i)*T(i+1) + Q(i) ;
	end
	
end

