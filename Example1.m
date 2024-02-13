

W=wiener(1000,2,4,100);



function [W] = wiener (N,mu, sigma ,T)
dt = T/N; % dt i s time step
dW = zeros (1 ,N) ; % preal locate arrays
W = zeros (1 ,N) ;
Y1 = zeros (1 ,N+1) ;

for pic = 1:1:4
    t = 0: dt :T; % create a time vector with N steps
    dW(1) = sqrt(dt) * randn ; % f i r s t approximation outside loop . . .
    W(1) = dW(1) ; % since W(0) is not allowed
    for step = 2: N
        dW( step ) = sqrt ( dt ) *randn ; % general increment
        W( step ) = W( step-1) + dW( step ) ;
    end
    Y1 = mu * t + sigma * [10 ,W] ;
    
    
    subplot (2 ,2 , pic ) ; plot ( t , Y1) ; hold on % plot the path
    subplot (2 ,2 , pic ) ; plot ( t ,mu * t , ' : ') ; hold on
    axis ( [0 T min(-sigma , (mu-2*sigma ) *T) max( sigma , (mu+2*sigma ) *T) ] )
    title ( [ int2str(N), '-step wiener process and its mean' ] )
    xlabel ( [ 'Mu', num2str(mu), ',Sigma', num2str(sigma) ] )
end
hold off
end