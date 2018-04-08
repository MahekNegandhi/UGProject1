function [str] = dec2str(dec)
   p = 0;
   for i = 4:-1:1
       temp(i) = bitand(bitshift(dec,p),hex2dec('000000FF'));
       p = p - 8;
   end
   disp(temp);
   str = char(temp);
end