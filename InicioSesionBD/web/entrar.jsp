<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <style>
            body{
                background:url("Imagenes/oliver.jpg")fixed;
                color: white;
            }

        </style>
    </head>
    <body>
        <%@page import="java.sql.*,java.io.*" %>


        <%

            if (request.getParameter("Entrar") != null) {
                HttpSession sesion = request.getSession();
                String correo = request.getParameter("Correo");
                String contra = request.getParameter("contra");
                Connection c = null;
                Statement s = null;
                ResultSet r = null;

                try {
                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                    c = DriverManager.getConnection("jdbc:mysql://localhost/tarea", "root", "n0m3l0");
                    s = c.createStatement();
                } catch (SQLException error) {
                    out.println(error.toString());
                }
                try {
                    r = s.executeQuery("select*from usuarios where correo='" + correo + "'" + " and contra='" + contra + "'");
                    if (r.next()) {
                        String coreo = r.getString("correo");
                        String contraseña = r.getString("contra");
                        out.print("  <form action='sesion.jsp' method='post' name='inicio' >"
                                + coreo + "&nbsp;"
                                + "<input type='submit' name='cerrar' value='cerrar'>  "
                                + "</form>");
                        response.sendRedirect("http://localhost:8080/InicioSesionBD/Pagina.html");
                        out.print("<META HTTP-EQUIV='REFRESH' CONTENT='.0000001; URL=http://localhost:8080/InicioSesionBD/InicioTodo.html'/>");
                    } else {
                        out.print("<script>alert('Datos incorrectos')</script>");
                        response.sendRedirect("http://localhost:8080/InicioSesionBD/InicioTodo.html");
                    }
                } catch (SQLException error) {
                    out.println(error.toString());
                }

            } else if (request.getParameter("cerrar") != null) {
                HttpSession sesion = request.getSession();
                String nombre = request.getParameter("nom");
                sesion.invalidate();
                response.sendRedirect("http://localhost:8080/InicioSesionBD/InicioTodo.html");

            }


        %>
        <h1>Que esto mola</h1>
    </body>
</html>
