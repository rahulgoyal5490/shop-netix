
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
public class merchantlogin extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        System.out.println(email);
        System.out.println(password);

        ResultSet rs = DBLoader.executeQuery("select * from merchant_signup where email='" + email + "' and password='" + password + "'");
        try {
            if (rs.next()) {
                HttpSession session = request.getSession();
                session.setAttribute("email", email);
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
