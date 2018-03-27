package blowfish;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

public class BlowFish {
    public static void main(String[] args) throws Exception{
    String pt,ct;
    SecretKey key;
    
    BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        System.out.println("Enter Plain Text");
    pt = br.readLine();
    
    key = KeyGenerator.getInstance("BlowFish").generateKey();
    ct = doEncrypt(pt,key);
    System.out.println(ct);
    
    pt = doDecrypt(ct,key);
    System.out.println(pt);
    }
    static String doEncrypt(String pt, SecretKey key) throws Exception
    {
        Cipher c = Cipher.getInstance("BlowFish");
        c.init(Cipher.ENCRYPT_MODE, key);
        
        byte[] ptBytes = pt.getBytes("UTF8");
        byte[] enc = c.doFinal(ptBytes);
        String str = new BASE64Encoder().encode(enc);
        
        return str;
    }
    static String doDecrypt(String ct, SecretKey key) throws Exception
    {
        Cipher c = Cipher.getInstance("BlowFish");
        c.init(Cipher.DECRYPT_MODE,key);
        
        byte[] enc = new BASE64Decoder().decodeBuffer(ct);
        byte[] ptBytes=c.doFinal(enc);
        String str = new String(ptBytes,"UTF8");
        return str;
                
    }
    
}
