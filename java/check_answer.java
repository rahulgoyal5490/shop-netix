import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import mypack.DBLoader;

public class check_answer extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out=response.getWriter();
        
        String email=request.getParameter("email2");
        String security_answer=request.getParameter("security_answer");
        System.out.println(security_answer);
        System.out.println(email);
        
        ResultSet rs=DBLoader.executeQuery("select * from merchant_signup where email='"+email+"' and security_answer='"+security_answer+"'");
        try{
        if(rs.next()==true)
        {
            out.println("success");
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
