function [dec] = str2dec(str)
   temp = reshape(dec2bin(double(str),8).',[],1); 
   temp = double(bin2dec(reshape(temp,8,[]).').');
   dec = temp(1);
   for i = 2:4
       dec = bitor(bitshift(dec,8),temp(i));
   end
end