function [ dec32 ] = convert32( dec8 )
    dec32 = uint32(dec8(1));
    for i = 2:4
        dec32 = bitor(bitshift(dec32,8),uint32(dec8(i)));
    end
end

