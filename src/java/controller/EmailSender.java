/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.AccountDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.util.List;
import java.util.Random;
import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;
import model.Account;
import validation.PasswordValidator;
import validation.PhoneValidator; // Import the PhoneValidator class

/**
 *
 * @author nntru
 */
@WebServlet(name = "EmailSender", urlPatterns = {"/EmailSender"})
public class EmailSender extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        AccountDAO dao = new AccountDAO();
        HttpSession session = request.getSession();

        String flag = request.getParameter("flag") == null ? "" : request.getParameter("flag");
        String username = null;
        String password = null;
        String email = null;
        String phone = null;
        String address = null;
        String email_forgot = null;
        int role = 0;

        if (flag.equalsIgnoreCase("register")) {
            username = request.getParameter("username");
            password = request.getParameter("password");
            email = request.getParameter("email");
            phone = request.getParameter("phone");
            address = request.getParameter("address");

            role = Integer.parseInt(request.getParameter("role"));
            List<Account> list = dao.listAll();

            // Validate phone number using PhoneValidator
            if (!PhoneValidator.isValidPhoneNumber(phone)) {
                request.setAttribute("errorMessage", "Invalid phone number format. It must start with 0 and have 10 digits");
                setAttributes(request, username, password, email, phone, address, role);
                request.getRequestDispatcher("login.jsp").forward(request, response);
                return;

            }

            if (!PasswordValidator.isValidPassword(password)) {
                request.setAttribute("errorMessage", "It must contain at least 8 characters, including at least 1 uppercase letter, 1 lowercase letter, and 1 number.");
                setAttributes(request, username, password, email, phone, address, role);
                request.getRequestDispatcher("login.jsp").forward(request, response);
                return;
            }
            // Check if the email already exists
            for (Account account : list) {
                if (email.equals(account.getEmail())) {
                    request.setAttribute("errorMessage", "Email already exists!!!");
                    setAttributes(request, username, password, email, phone, address, role);
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                    return;
                }
            }

            session.setAttribute("flag", flag);
            session.setAttribute("email_reset", email);
        } else if (flag.equalsIgnoreCase("forgotPassword")) {
            email_forgot = request.getParameter("email_forgot");

            Account account = null;
            try {
                account = dao.getAccountByEmail(email_forgot);
            } catch (SQLException e) {
                e.printStackTrace();
                request.setAttribute("errorMessage", "An error occurred while checking your email. Please try again later.");
                request.getRequestDispatcher("login.jsp").forward(request, response);
                return;
            }

            if (account == null) {
                request.setAttribute("errorMessage", "Email does not exist in the system!");
                request.getRequestDispatcher("login.jsp").forward(request, response);
                return;
            }

            session.setAttribute("flag", flag);
            session.setAttribute("email_reset", email_forgot);
        }

        // random otp
        String code = generateRandomCode();
        boolean emailSent = sendEmail(email == null ? email_forgot : email, code);

        if (emailSent && flag.equalsIgnoreCase("register")) {
            session.setAttribute("authCode", code);
            session.setAttribute("codeGeneratedTime", System.currentTimeMillis());

            session.setAttribute("email", email);
            session.setAttribute("phone", phone);
            session.setAttribute("username", username);
            session.setAttribute("role", role);
            session.setAttribute("password", password);
            session.setAttribute("address", address);

            response.sendRedirect("verifyCode.jsp");
        } else if (emailSent && flag.equalsIgnoreCase("forgotPassword")) {
            session.setAttribute("authCode", code);
            session.setAttribute("codeGeneratedTime", System.currentTimeMillis());
            response.sendRedirect("verifyCode.jsp");
        } else {
            request.setAttribute("errorMessage", "Sending email failed. Please try again.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }

    }

    private void setAttributes(HttpServletRequest request, String username, String password, String email, String phone, String address, int role) {
        request.setAttribute("username", username);
        request.setAttribute("password", password);
        request.setAttribute("email", email);
        request.setAttribute("phone", phone);
        request.setAttribute("address", address);
        request.setAttribute("role", role);
    }

    private boolean sendEmail(String recipient, String code) throws UnsupportedEncodingException {
        String email = "noreplyonlyread@gmail.com";
        String appPassword = "soej fvbi oicy choa";
        String smtpHost = "smtp.gmail.com";
        int smtpPort = 587;

        Properties props = new Properties();
        props.put("mail.smtp.host", smtpHost);
        props.put("mail.smtp.port", smtpPort);
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");

        Authenticator auth = new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(email, appPassword);
            }
        };

        Session session = Session.getInstance(props, auth);

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(email, "FireflyShop"));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipient));
            message.setSubject("Verification");
            message.setText("Your verification code is: " + code);

            Transport.send(message);

            return true;
        } catch (MessagingException e) {
            e.printStackTrace();
            log("Error sending email: " + e.getMessage(), e);
            return false;
        }
    }

    private String generateRandomCode() {
        String chars = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        StringBuilder code = new StringBuilder();
        Random rnd = new Random();
        while (code.length() < 6) {
            int index = rnd.nextInt(chars.length());
            code.append(chars.charAt(index));
        }
        return code.toString();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
