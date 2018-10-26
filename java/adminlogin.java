
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.PageContext;
import mypack.DBLoader;

/**
 *
 * @author Rahul
 */
public class adminlogin extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        System.out.println(username);
        System.out.println(password);

        ResultSet rs = DBLoader.executeQuery("select * from admin_login where username='" + username + "' and password='" + password + "'");
        try {
            if (rs.next()) {
                HttpSession session = request.getSession();
                session.setAttribute("username", username);
                session.setAttribute("password", password);
                System.out.println("values set in session");

                out.println("Success");

            } else {
                out.println("Username or Passwrd is not correct");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

}
