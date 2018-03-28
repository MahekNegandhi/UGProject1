import javax.crypto.SecretKey;
import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
%import sun.misc.BASE64Decoder;
%import sun.misc.BASE64Encoder;

%prompt="Enter plain text";
pt="Mahek Negandhi";
key = keyGenerator.getInstance("Blowfish").generateKey();
ct = doEncrypt(pt,key);
disp(ct);

function str = doEncrypt(pt ,key)
Cipher c = Cipher.getInstance("Blowfish");
c.init(Cipher.ENCRYPT_MODE,key);

ptBytes = pt.getBytes("UTF8");
enc = c.doFinal(ptBytes);
str = native2unicode(enc,"UTF8");
disp(enc)

end
