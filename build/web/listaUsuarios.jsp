<%-- 
    Document   : listaUsuarios
    Created on : 29/05/2020, 03:58:43
    Author     : axtri
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="conexao.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="use" class="beans.Chamados"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de usuarios</title>
        <link rel="stylesheet" type="text/css" href="" media="screen"/>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    </head>
    <body>
        <%
        int id = (Integer) request.getSession().getAttribute("sid");
        String us = (String) (session.getAttribute("susuario"));
        if(session.getAttribute("susuario")==null){
            response.sendRedirect("index.jsp");
        }
        %>

        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" href="#">Lista de usuarios</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="tecoIndex.jsp">Inicio <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="filaChamados.jsp">Chamados ativos</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="filaAntChamados.jsp">Chamados antigos</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="filaBloqChamados.jsp">Chamados bloqueados</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="listaUsuarios.jsp">Lista de usuarios</a>
                    </li>
                </ul>
                <form class="form-inline" method="get" action="">
                    <input class="form-control mr-sm-2" type="search" name="q" placeholder="Procurar por id do funcionario..." aria-label="Search">
                    <button class="btn btn-secondary my-2 my-sm-0" type="submit">Procurar</button>
                </form>
              </div>
        </nav>
        <div class="container-fluid mt-5"> 
        <table class="table table-fluid" id="myTable">      
            <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Id do funcionario</th>
                    <th scope="col">Login do funcionario</th>
                    <th scope="col">Nome do funcionario</th>
                </tr>
            </thead>
        <%
            String que = request.getParameter("q");
                String query;
                
                if(que!=null){
                    query = "select * from usuario where idusuario like '%"+que+"%';";
                }else{
                    query = "select * from usuario";
                }
            ResultSet re = use.consultar(query);
            int cont = 1;
            while(re.next()){
                %>
                    <tbody>
                         <tr>
                            <th scope="row"><%=cont%></th>
                            <td><%=re.getString("idusuario")%></td>
                            <td><%=re.getString("usuario")%></td>
                            <td><%=re.getString("nome")%></td>
                         </tr>
                    </tbody>              
            <%
            cont++;         
            }
        %>
        </table>
        </div>
    </body>
</html>

