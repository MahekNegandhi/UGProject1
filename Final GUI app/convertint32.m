function [Str] = convertint32(dec32,n)
    base64 = org.apache.commons.codec.binary.Base64();
    j=1;
    for i = 1:length(dec32)
        dec8(j:j+3) = convert8(dec32(i));
        j = j+4;
    end
    if n == 1
       dec8 = base64.encode(uint8(dec8))';
    else
       dec8 = base64.decode(uint8(dec8))';
    end
    for i = 1:length(dec8)
        if dec8(i) < 0
            dec8(i) = dec8(i) + 256;
        end
    end
    Str = char(dec8);
end