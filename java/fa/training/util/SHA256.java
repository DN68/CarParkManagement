package fa.training.util;

import com.google.common.hash.Hashing;

import java.nio.charset.StandardCharsets;

public class SHA256 {
    public static String encrypt(String originalString) {
        if(originalString == null) return null;
        return Hashing.sha256()
                .hashString(originalString, StandardCharsets.UTF_8)
                .toString();
    }

    public static void main(String[] args) {
        System.out.println(encrypt("Aa12345678"));
    }
}
