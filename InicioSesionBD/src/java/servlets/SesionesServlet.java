/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class SesionesServlet extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String nombre;
        String apellido;

        //recuperamos los datos del formulario
        nombre = request.getParameter("NOMBRE");
        apellido = request.getParameter("APELLIDO");

        HttpSession sesion = request.getSession();
        sesion.setAttribute("claveSesion", nombre + apellido);

        response.setContentType("text/html");
        //Mostramos los  valores en el cliente
        PrintWriter out = response.getWriter();
        
        out.println("<div style = \"float: left; width:100%; height:100%; background-color:#708573; font-family: Roboto Condensed;\">");
        out.println("<br><br>");
        out.println("<br><br>");
        out.println("<center><Font color=\"white\"  size=\"12\">");
        out.println("<a href=\"/m/catalogo.jsp\"> Link al catalogo del carrito  </a>");
        out.println("<br>");
        out.println("ID de la sesi&oacute;n: " + sesion.getId());
        out.println("</div>");

    }

}
