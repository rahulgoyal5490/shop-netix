

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import mypack.DBLoader;


public class forgot_password2 extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out=response.getWriter();
        
        String username=request.getParameter("username");
        String new_password=request.getParameter("new_password");
        
        ResultSet rs=DBLoader.executeQuery("select * from admin_login where username='"+username+"'");
        try{
        if(rs.next())
        {
            rs.updateString("password", new_password);
            rs.updateRow();
            out.println("Password changed successfully");
            }
        else
        {
            out.println("failed");
        }
        }
        catch(Exception e)
        {
        e.printStackTrace();
        }
        
    }


}
