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
public class editcategory extends HttpServlet {

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

        String category_name = request.getParameter("category_name2");
        String category_description = request.getParameter("category_description2");
        String category_photo = filename;
//        String phone = request.getParameter("phone");

        try {
            ResultSet rs = DBLoader.executeQuery("select * from category where category_name='" + category_name + "'");

            if (rs.next()) {
                
                rs.updateString("category_name",category_name);
                rs.updateString("description", category_description);
                
                
                //rs.updateString("photo", "images/"+filename);
                rs.updateRow();
                out.println(" category edited successfully");
                System.out.println("success");    
            }
            else
            {
                out.println("fail");
            }
            
            
            
        } catch (Exception e) {
            e.printStackTrace();
        }

      

        
       

    }

}
