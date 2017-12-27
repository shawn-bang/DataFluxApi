package api.utils;

import org.apache.commons.codec.digest.DigestUtils;

/**
 * create by shawn 2017-12-16 11:00:00
 */
public class CryptUtils {

    public static String encryptStringMd5(String content) {
        return DigestUtils.md5Hex(content);
    }

}
