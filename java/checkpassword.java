/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import mypack.DBLoader;

/**
 *
 * @author Rahul
 */
public class checkpassword extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String username = request.getParameter("username");
        String old_password = request.getParameter("old_password");
        String new_password = request.getParameter("new_password");

        ResultSet rs = DBLoader.executeQuery("select * from admin_login where username='" + username + "' and password='" + old_password + "'");
        try {
            if (rs.next()) {
                if (old_password.equalsIgnoreCase(new_password)) {
                    out.println("old password and new password should not be same");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
