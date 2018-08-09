
/*
/**
	 * 使用<code>secret</code>对paramValues按以下算法进行签名： <br/>
	 * uppercase(hex(sha1(secretkey1value1key2value2...secret))
	 *
	 * @param paramNames
	 *            需要签名的参数名
	 * @param paramValues
	 *            参数列表
	 * @param secret
	 * @return
	 * @throws UnsupportedEncodingException
	 * @throws NoSuchAlgorithmException
	 */
	public static String sign(Map<String, String> paramValues, String secret) throws NoSuchAlgorithmException,
		UnsupportedEncodingException {
		StringBuilder sb = new StringBuilder();
		List<String> paramNames = new ArrayList<String>(paramValues.size());
		paramNames.addAll(paramValues.keySet());
		Collections.sort(paramNames);

		sb.append(secret);
		for (String paramName : paramNames) {
			sb.append(paramName).append(paramValues.get(paramName));
		}
		sb.append(secret);
		byte[] sha1Digest = getSHA1Digest(sb.toString());
		return byte2hex(sha1Digest);
	}

	private static byte[] getSHA1Digest(String data) throws NoSuchAlgorithmException, UnsupportedEncodingException {
		MessageDigest md = MessageDigest.getInstance("SHA-1");
		return md.digest(data.getBytes("UTF-8"));
	}

	/**
	 * 二进制转十六进制字符串
	 *
	 * @param bytes
	 * @return
	 */
	private static String byte2hex(byte[] bytes) {
		StringBuilder sign = new StringBuilder();
		for (int i = 0; i < bytes.length; i++) {
			String hex = Integer.toHexString(bytes[i] & 0xFF);
			if (hex.length() == 1) {
				sign.append("0");
			}
			sign.append(hex.toUpperCase());
		}
		return sign.toString();
	}
 */
import 'package:crypto/crypto.dart';
import 'dart:convert';
class SignUtil{
  //签名
    String sign (Map<String,String> signData,String secret){
      return "";
    }
    //二进制
    String byte2hex(var bytes){
      StringBuffer sign = new StringBuffer();
      for(int i= 0;i<bytes;i++){
        //返回对应得 进制数
        String hex = bytes[i].toRadixString(16);
        if(hex.length == 1){
          sign.write("0");
        }
        sign.write(hex.toUpperCase());
      }
      return sign.toString();

    }
}