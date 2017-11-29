package cn.tedu.utils;

import org.apache.shiro.crypto.hash.Md5Hash;

public class Md5Utils {

	public static String getMd5(String password, String salt) {
		Md5Hash mh = new Md5Hash(password, salt, 2);
		return mh.toString();
	}
}
