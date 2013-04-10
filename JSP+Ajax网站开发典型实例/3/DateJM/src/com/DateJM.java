package com;

import java.security.*;
import javax.crypto.*;

public class DateJM
{

  private static String Algorithm="DES"; //定义 加密算法,可用 DES,DESede,Blowfish
  public static byte[] jmKey;           //一个比特型的数组，存储要加密与解密的数据信息

  //装置数据加密算法管理器
  static
  {
    Security.addProvider(new com.sun.crypto.provider.SunJCE());
  }

  //生成密钥
  public static byte[] getKey() throws Exception
  {
    KeyGenerator keygen = KeyGenerator.getInstance(Algorithm);
    SecretKey deskey = keygen.generateKey();
    jmKey=deskey.getEncoded();
    return deskey.getEncoded();
  }

  //加密
  public static byte[] encode(byte[] input) throws Exception
  {
    SecretKey deskey = new javax.crypto.spec.SecretKeySpec(getKey(),Algorithm);
    System.out.println("key:"+jmKey);
    Cipher c1 = Cipher.getInstance(Algorithm);
    c1.init(Cipher.ENCRYPT_MODE,deskey);
    byte[] cipherByte=c1.doFinal(input);

    return cipherByte;
  }

  //解密
  public static byte[] decode(byte[] input) throws Exception
  {
    SecretKey deskey = new javax.crypto.spec.SecretKeySpec(jmKey,Algorithm);
    System.out.println("key:"+jmKey);
    Cipher c1 = Cipher.getInstance(Algorithm);
    c1.init(Cipher.DECRYPT_MODE,deskey);
    byte[] clearByte=c1.doFinal(input);

    return clearByte;
  }

  /*md5()信息摘要, 不可逆
  public static byte[] md5(byte[] input) throws Exception{
    java.security.MessageDigest alg=java.security.MessageDigest.getInstance("MD5"); //or "SHA-1"
    if (debug){
      System.out.println("摘要前的二进串:"+byte2hex(input));
      System.out.println("摘要前的字符串:"+new String(input));
    }
    alg.update(input);
    byte[] digest = alg.digest();
    if (debug)
      System.out.println("摘要后的二进串:"+byte2hex(digest));
    return digest;
  }
*/
  /*字节码转换成16进制字符串
  public static String byte2hex(byte[] b)
  {
    String hs="";
    String stmp="";
    for (int n=0;n<b.length;n++){
      stmp=(java.lang.Integer.toHexString(b[n] & 0XFF));
      if (stmp.length()==1)
        hs=hs+"0"+stmp;
      else hs=hs+stmp;
        if (n<b.length-1)  hs=hs+":";
      }
    return hs.toUpperCase();
  }

  public static void main(String[] args) throws Exception{


    byte[] key = "好好学习".getBytes();
    encode("测试加密".getBytes(),key);
    md5("测试加密".getBytes());
  }
  */
}
