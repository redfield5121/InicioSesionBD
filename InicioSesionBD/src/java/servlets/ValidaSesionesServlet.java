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

public class ValidaSesionesServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        HttpSession sesion = request.getSession();
        String titulo = null;

        //Pedimos el atributo, y verificamos si existe
        String claveSesion = (String) sesion.getAttribute("claveSesion");

        if (claveSesion.equals("emmanueloropeza")) {
            titulo = "Llave correcta";
        } else {
            titulo = "Llave incorrecta";
        }

        //Mostramos los  valores en el cliente
        PrintWriter out = response.getWriter();

        out.println("<div style = \"float: left; width:100%; height:100%; background-color:#708573; font-family: Roboto Condensed;\">");
        out.println("<br><br>");
        out.println("<br><br>");
        out.println("<center><Font color=\"white\"  size=\"12\">" + titulo);
        out.println("<br>");
        out.println("ID de la sesi&oacute;n: " + sesion.getId());
        out.println("<br><br>");

        out.println("<a href='salir.jsp'  target='_parent' class='btn btn-2' id='cs'>\n"
                + "            CERRAR SESIÓN\n"
                + "        </a></center>");

        out.println("</div>");
    }

}
