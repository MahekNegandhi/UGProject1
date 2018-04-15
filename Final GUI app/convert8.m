function [ dec8 ] = convert8( dec32 )
    p = 0;
    dec8 = [0,0,0,0];
    for i = 4:-1:1
        dec8(i) = bitand(bitshift(dec32,p),hex2dec('000000FF'));
        p = p - 8;
    end
end

