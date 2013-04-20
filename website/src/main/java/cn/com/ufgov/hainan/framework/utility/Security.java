package cn.com.ufgov.hainan.framework.utility;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * 安全类
 */
public class Security {
	/**
	 * MD5散列
	 * 
	 * @param value
	 *            明文
	 * @return 散列值
	 */
	public static String md5(String value) {
		String result = null;

		try {
			MessageDigest messageDigest = MessageDigest.getInstance("MD5");
			byte[] values = value.getBytes("utf-8");
			byte[] datas = messageDigest.digest(values);
			StringBuilder stringBuilder = new StringBuilder();
			for (byte data : datas) {
				int unsigned = data;
				if (data < 0) {
					unsigned = data + 0x100;
				}
				stringBuilder.append(Integer.toHexString(unsigned));
			}
			result = stringBuilder.toString();
		} catch (NoSuchAlgorithmException e) {
			Trace.getLogger().error(e);
		} catch (UnsupportedEncodingException e) {
			Trace.getLogger().error(e);
		}

		return result;
	}
}
