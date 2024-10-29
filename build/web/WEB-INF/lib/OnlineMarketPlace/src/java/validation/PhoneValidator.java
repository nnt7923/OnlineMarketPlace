package validation;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class PhoneValidator {

    // Sử dụng regex để kiểm tra định dạng số điện thoại
    private static final String PHONE_NUMBER_REGEX = "^0\\d{9}$";
    private static final Pattern PHONE_NUMBER_PATTERN = Pattern.compile(PHONE_NUMBER_REGEX);

    public static boolean isValidPhoneNumber(String phoneNumber) {
        if (phoneNumber == null || phoneNumber.isEmpty()) {
            return false;
        }
        Matcher matcher = PHONE_NUMBER_PATTERN.matcher(phoneNumber);
        return matcher.matches();
    }
}
