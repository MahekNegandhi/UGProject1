function [xl,xr] = Blowfish_decipher(xl,xr)
    for i = N+2:-1:1
        xl = xor(xl,P(i));
        xr = xor(F(xl),xr);
        
        temp = xl;
        xl = xr;
        xr = temp;
    end    
    
    temp = xl;
    xl = xr;
    xr = temp;
    
    xr = xor(xr,P(2));
    xl = xor(xl,P(1));
end