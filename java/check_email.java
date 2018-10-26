
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import mypack.DBLoader;

public class check_email extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String email = request.getParameter("email");
        ResultSet rs = DBLoader.executeQuery("select * from merchant_signup where email='" + email + "'");
        try {
            if (rs.next()) {
                String security_question=rs.getString("security_question");
                out.println(security_question);
                
            }
            else
            {
                out.println("email is invalid");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

}
