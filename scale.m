function s0 = scale(M,qo,qi,tau)
%l = @(a,b) cond(M==1,a,b);
%s0 = 0.5*(1+sign(M-1)*(1 - 1/abs(log(l(10,M))))*l(0,1));

rq = qo/qi;
%if(abs(rq) == 1 && abs(tau*qo) <= 10)
%    l = @(a,b) cond(M==1,a,b);
%    s0 = 0.5*(1+sign(M-1)*(1 - 1/abs(log(l(10,M))))*l(0,1));
%else

% if(abs(rq) == 1)% && abs(tau*qo) <= 100)
%     if(M < 1)
%         s0 = 0.5;
%     else
%         s0 = 1;
%     end
% else
%     root_guess_m = @(Rq,M) (1-sqrt(abs(Rq)./M))./(1+Rq./M);
%     s0 = root_guess_m(1+rq,M);
% end

root_guess_m = @(Rq,M) (1-sqrt(abs(Rq)./M))./(1+Rq./M);
s0 = root_guess_m(1+rq,M);