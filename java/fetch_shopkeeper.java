import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import mypack.RDBMS_TO_JSON;

public class fetch_shopkeeper extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out=response.getWriter();
        String status=request.getParameter("status");
        
        String ans=new RDBMS_TO_JSON().generateJSON("select * from merchant_signup where status='"+status+"'");
        out.println(ans);
    }


}
