

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import mypack.DBLoader;


public class DeleteCategory extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        String category_name = request.getParameter("category_name");
        
        try {
            
            ResultSet rs = DBLoader.executeQuery("select * from category where category_name='"+category_name+"'");
            if(rs.next())
            {
                rs.deleteRow();
                out.println("success");
            }
            else
            {
                out.println("failed");
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
    
    }

   
    
}
