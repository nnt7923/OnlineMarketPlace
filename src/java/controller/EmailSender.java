/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.AccountDAO;
import java.io.IOException;
import java.io.PrintWriter;
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
import java.util.concurrent.TimeUnit;
import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;
import model.Account;
import validation.PasswordValidator;

/**
 *
 * @author nntru
 */
@WebServlet(name = "EmailSender", urlPatterns = {"/EmailSender"})
public class EmailSender extends HttpServlet {

//    private static final String PHONE_NUMBER_REGEX = "^0\\d{9}$";
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

            // phone_regex
//            Pattern phone_number_pattern = Pattern.compile(PHONE_NUMBER_REGEX);
//            Matcher matcher = phone_number_pattern.matcher(phone);
//            if (!matcher.matches()) {
//                session.setAttribute("message", "Invalid phone number!!!");
//                request.getRequestDispatcher("login.jsp").forward(request, response);
//                return;
//            }
            if (!PasswordValidator.isValidPassword(password)) {
                request.setAttribute("errorMessage", "It must contain at least 8 characters, including at least 1 uppercase letter, 1 lowercase letter, and 1 number.");
                setAttributes(request, username, password, email, phone, address, role);
                request.getRequestDispatcher("login.jsp").forward(request, response);
                return;
            }

            // check exist email
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

            // Check if the email exists in the system using getAccountByEmail method
            Account account = null;
            try {
                account = dao.getAccountByEmail(email_forgot);
            } catch (SQLException e) {
                e.printStackTrace();
                // Handle error, maybe redirect to an error page
            }

            if (account == null) {
                // If the email does not exist, show an error message and do not proceed with OTP
                request.setAttribute("errorMessage", "Email does not exist in the system!");
                setAttributes(request, username, password, email, phone, address, role);
                request.getRequestDispatcher("login.jsp").forward(request, response);
                return;
            }

            session.setAttribute("flag", flag);
            session.setAttribute("email_reset", email_forgot);
        }

        // random otp
        String code = generateRandomCode();
        // send email
        boolean emailSent = sendEmail(email == null ? email_forgot : email, code);

        if (emailSent && flag.equalsIgnoreCase("register")) {
            // Save the confirmation code and send to session
            request.setAttribute("authCode", code);
            request.setAttribute("codeGeneratedTime", System.currentTimeMillis());

            request.setAttribute("email", email);
            request.setAttribute("phone", phone);
            request.setAttribute("username", username);
            request.setAttribute("role", role);
            request.setAttribute("password", password);
            request.setAttribute("address", address);

            // sendRedirect verify page
            response.sendRedirect("verifyCode.jsp");
        } else if (emailSent && flag.equalsIgnoreCase("forgotPassword")) {
            // Save the confirmation code and send to session
            session.setAttribute("authCode", code);
            session.setAttribute("codeGeneratedTime", System.currentTimeMillis());
            response.sendRedirect("verifyCode.jsp");
        } else {
            response.getWriter().println("Sending email failed. Please try again.");
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
        // email account information
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
            e.printStackTrace(); // Log error details to the console
            log("Error sending email: " + e.getMessage(), e); // Write errors to the servlet log
            return false;
        }
    }

    private String generateRandomCode() {
        String chars = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
        StringBuilder code = new StringBuilder();
        Random rnd = new Random();
        while (code.length() < 6) {
            int index = rnd.nextInt(chars.length());
            code.append(chars.charAt(index));
        }
        return code.toString();
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
