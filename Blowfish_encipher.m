function [xl,xr] = Blowfish_encipher(xl,xr)
    for i = 1:N
        xl = xor(xl,P(i));
        xr = xor(F(xl),xr);
        
        temp = xl;
        xl = xr;
        xr = temp;
    end    
    
    temp = xl;
    xl = xr;
    xr = temp;
    
    xr = xor(xr,P(N+1));
    xl = xor(xl,P(N+2));
end