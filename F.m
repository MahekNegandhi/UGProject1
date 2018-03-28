function y = F(x)
d = bitand(x,hex2dec('00FF'));
x=bitshift(x,-8);
c = bitand(x,hex2dec('00FF'));
x=bitshift(x,-8);
b = bitand(x,hex2dec('00FF'));
x=bitshift(x,-8);
a = bitand(x,hex2dec('00FF'));
y = xor((sbox(1,a)+sbox(2,b)),sbox(2,c))+sbox(3,d);
end