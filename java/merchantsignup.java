/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.util.Collection;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import mypack.DBLoader;
import mypack.FileUploader;


@MultipartConfig
public class merchantsignup extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        Collection<Part> parts = request.getParts();

        String absolutePath = request.getServletContext().getRealPath("/images");
        System.out.println(absolutePath);

     
        String filename = "";
        for (Part p : parts) {
            String newfilename = new Date().getTime() + ".jpg";

             filename = FileUploader.savefileonserver(p, absolutePath, newfilename);
           
        }

        String email = request.getParameter("email");
        String password = request.getParameter("password");
       String contact =request.getParameter("contact");
        String merchant_name= request.getParameter("merchant_name");
        String shop_name = request.getParameter("shop_name");
        String address = request.getParameter("address");
        String city = request.getParameter("city");
        String sq = request.getParameter("sq");
        String sa = request.getParameter("sa");
        
        String photo = filename;
//        String phone = request.getParameter("phone");

        try {
            ResultSet rs = DBLoader.executeQuery("select * from merchant_signup where email='" + email + "'");

            if (rs.next()) {
                    out.println("Email Already exists");
                    System.out.println("fail");
            }
            else
            {
                rs.moveToInsertRow();
                
                rs.updateString("email",email);
                rs.updateString("password", password);
                rs.updateString("phone_number", contact);
                rs.updateString("name", merchant_name);
                rs.updateString("address", address);
                rs.updateString("city", city);
                rs.updateString("security_question", sq);
                rs.updateString("security_answer", sa);
                
                
                rs.updateString("photo", "images/"+filename);
                rs.updateString("shop_name", shop_name);
                
                rs.insertRow();
                out.println("SignUP successfully");
                System.out.println("success");
            }
            
            
            
        } catch (Exception e) {
            e.printStackTrace();
        }

      

        
       

    }

}
