
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
public class forgot_password extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out=response.getWriter();
         String username=request.getParameter("username");
         ResultSet rs=DBLoader.executeQuery("select * from admin_login where username='"+username+"'");
         try{
         if(rs.next()){
             out.println("username is valid");
            }
         else{
         out.println("username is not valid");
         }
         }
         catch(Exception e)
         {
         e.printStackTrace();
         }
    }


}
