N = 16;
function InitializeBlowfish( key , keybytes )
    j=1;
    for i = 1:N+2
        data = hex2dec('00000000');
        for k = 1:4
            data = bitor(bitshift(data,8),key(j));
            j = j + 1;
            if j>=keybytes
                j=0;
            end
        end
        P(i) = xor(P(i),data);
    end
    datal = hex2dec('00000000');
    datar = hex2dec('00000000');
    for i = 1:2:N+2
        Blowfish_encipher(datal,datar);
        P(i) = datal;
        P(i+1) = datar;
    end
    for i = 1:4
        for j = 1:256
            Blowfish_encipher(datal,datar);
            sbox(i,j) = datal;
            sbox(i,j+1) = datar;
        end
    end
     
end
