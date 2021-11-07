/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package vidaflix;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author user
 */
public class login extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
           // processRequest(request, response);
            String email=request.getParameter("username");
            String password=request.getParameter("password");
            Connection con =new connection().getConnection();
            Statement stmt = con.createStatement();
            String Query="select * from users where email=? and password=?";
            PreparedStatement st=con.prepareStatement(Query);
            st.setString(1,email);
            st.setString(2, password);
            ResultSet rs=st.executeQuery();
            if(rs.next())
            {
                   HttpSession session=request.getSession();
                    session.setAttribute("email", email);  
                    response.sendRedirect("Dashboard.jsp");
            }
            else{
                 request.setAttribute("error",rs.getString("email"));
                 request.getRequestDispatcher("login.jsp").forward(request, response);  
            }
         
        } catch (SQLException ex) {
            request.setAttribute("error",ex.toString());
                 request.getRequestDispatcher("login.jsp").forward(request, response);  
        } catch (ClassNotFoundException ex) {
            request.setAttribute("error",ex.toString());
                 request.getRequestDispatcher("login.jsp").forward(request, response);  
        }
       
        
    }

  
}
