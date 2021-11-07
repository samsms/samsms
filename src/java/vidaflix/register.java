/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package vidaflix;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
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
public class register extends HttpServlet {
 String email;
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
    }

  
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
     try {
         processRequest(request, response);
         String email=request.getParameter("username");
         String password=request.getParameter("password");
         Connection con =new connection().getConnection();      
        Statement stmt = con.createStatement();
        String Query="insert into users (email,password)values(?,?)";
        PreparedStatement st=con.prepareStatement(Query);
        st.setString(1,email);
        st.setString(2, password);
        st.execute();
        HttpSession session=request.getSession();
        session.setAttribute("email", email); 
        response.sendRedirect("Dashboard.jsp");  
         con.close();
     } catch (ClassNotFoundException ex) {
         request.setAttribute("error","error");
            request.getRequestDispatcher("register.jsp").forward(request, response);     
       
     } catch (SQLException ex) {
        request.setAttribute("error","error");
            request.getRequestDispatcher("register.jsp").forward(request, response);     
       
     }
           
        
        
        
    }

}
