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
public class change_password extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out=response.getWriter();
        String username=request.getParameter("username");
        String old_password=request.getParameter("old_password");
        String new_password=request.getParameter("new_password");
        String confirm_password=request.getParameter("confirm_password");
        
        ResultSet rs=DBLoader.executeQuery("select * from admin_login where username='"+username+"' and password='"+old_password+"'");
        try{
             if(rs.next())
             {
                 rs.updateString("password", new_password);
                 rs.updateRow();
                 out.println("password changed successfully");
             }
           }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        
    }


}
