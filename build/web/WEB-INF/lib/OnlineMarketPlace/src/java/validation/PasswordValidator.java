/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package validation;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 *
 * @author nntru
 */
public class PasswordValidator {
    
    // ??nh ngh?a regex cho m?t kh?u
    private static final String PASSWORD_REGEX = "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=\\S+$).{8,}$";

    private static final Pattern pattern = Pattern.compile(PASSWORD_REGEX);

    // Ph??ng th?c ki?m tra m?t kh?u h?p l?
    public static boolean isValidPassword(String newPassword) {
        if (newPassword == null) {
            return false;
        }

        Matcher matcher = pattern.matcher(newPassword);
        return matcher.matches();
    }
}