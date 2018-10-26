
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import mypack.DBLoader;

public class activate_shopkeeper extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        String status = request.getParameter("status");
        String email = request.getParameter("email");

        ResultSet rs = DBLoader.executeQuery("select * from merchant_signup where email='"+email+"'");
        try {
            if (rs.next()) {
                rs.updateString("status", status);
                rs.updateRow();
                out.println("success");

            }
            else
            {
            out.println("failes");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

}
