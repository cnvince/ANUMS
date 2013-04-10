package com;

import java.security.*;
import javax.crypto.*;

public class DateJM
{

  private static String Algorithm="DES"; //���� �����㷨,���� DES,DESede,Blowfish
  public static byte[] jmKey;           //һ�������͵����飬�洢Ҫ��������ܵ�������Ϣ

  //װ�����ݼ����㷨������
  static
  {
    Security.addProvider(new com.sun.crypto.provider.SunJCE());
  }

  //������Կ
  public static byte[] getKey() throws Exception
  {
    KeyGenerator keygen = KeyGenerator.getInstance(Algorithm);
    SecretKey deskey = keygen.generateKey();
    jmKey=deskey.getEncoded();
    return deskey.getEncoded();
  }

  //����
  public static byte[] encode(byte[] input) throws Exception
  {
    SecretKey deskey = new javax.crypto.spec.SecretKeySpec(getKey(),Algorithm);
    System.out.println("key:"+jmKey);
    Cipher c1 = Cipher.getInstance(Algorithm);
    c1.init(Cipher.ENCRYPT_MODE,deskey);
    byte[] cipherByte=c1.doFinal(input);

    return cipherByte;
  }

  //����
  public static byte[] decode(byte[] input) throws Exception
  {
    SecretKey deskey = new javax.crypto.spec.SecretKeySpec(jmKey,Algorithm);
    System.out.println("key:"+jmKey);
    Cipher c1 = Cipher.getInstance(Algorithm);
    c1.init(Cipher.DECRYPT_MODE,deskey);
    byte[] clearByte=c1.doFinal(input);

    return clearByte;
  }

  /*md5()��ϢժҪ, ������
  public static byte[] md5(byte[] input) throws Exception{
    java.security.MessageDigest alg=java.security.MessageDigest.getInstance("MD5"); //or "SHA-1"
    if (debug){
      System.out.println("ժҪǰ�Ķ�����:"+byte2hex(input));
      System.out.println("ժҪǰ���ַ���:"+new String(input));
    }
    alg.update(input);
    byte[] digest = alg.digest();
    if (debug)
      System.out.println("ժҪ��Ķ�����:"+byte2hex(digest));
    return digest;
  }
*/
  /*�ֽ���ת����16�����ַ���
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


    byte[] key = "�ú�ѧϰ".getBytes();
    encode("���Լ���".getBytes(),key);
    md5("���Լ���".getBytes());
  }
  */
}
