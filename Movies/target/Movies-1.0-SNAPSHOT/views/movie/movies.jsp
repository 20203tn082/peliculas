<%--
  Created by IntelliJ IDEA.
  User: natha
  Date: 30/07/2021
  Time: 09:11 a. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="context" value="${pageContext.request.contextPath}" />


<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet">
</head>
<body>


<div class="container">
    <button type="button" class="btn btn-outline-success btn-sm" data-bs-toggle="modal" data-bs-target="#create"><i class="fas fa-plus"></i> Agregar película</button>
    <br>
    <br>
    <table class="table">
        <thead class="table-dark">
        <th>No</th>
        <th>Nombre</th>
        <th>Descripción</th>
        <th>Fecha de estreno</th>
        <th>Dinero recaudado</th>
        <th>Estatus</th>
        <th>Acciones</th>
        </thead>
        <tbody>
<c:forEach items="${ listMovies }" var="movie" varStatus="status">
    <tr>
    <td>${movie.id_movie}</td>
    <td>${movie.name}</td>
    <td>${movie.description}</td>
    <td>${movie.premiere}</td>
    <td>${movie.collection}</td>
    <td>
        <c:if test="${movie.status eq 1}">
            Activa
        </c:if>
        <c:if test="${movie.status ne 1}">
            Inactiva
        </c:if>
    </td>
    <td>
        <c:if test="${movie.status eq 1}">
            <button type="button" class="btn btn-outline-primary btn-sm" onclick="update('${ movie.id_movie }', '${movie.name}', '${movie.description}', '${movie.premiere}', '${movie.collection}');" data-bs-toggle="modal" data-bs-target="#modify"><i class="fas fa-edit"></i> Modificar</button>
            <button type="button" class="btn btn-outline-danger btn-sm" onclick="deleteMovie('${ movie.id_movie }','${ movie.name }');" data-bs-toggle="modal" data-bs-target="#delete"> <i class="fas fa-trash"></i> Eliminar</button>
        </c:if>
        <c:if test="${movie.status ne 1}">
            <button type="button" class="btn btn-outline-info" onclick="details('${ movie.id_movie }', '${movie.name}', '${movie.description}', '${movie.premiere}', '${movie.collection}');" data-bs-toggle="modal" data-bs-target="#details"><i class="fas fa-info-circle"></i> Detalles</button>
        </c:if>

    </td>
    </tr>
</c:forEach>
        </tbody>
    </table>

</div>

<div class="modal fade" id="modify" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Modificar película</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="${context}/ServletMovies" method="POST">
                    <input type="hidden" value="update" name="action">
                    <input type="hidden" name="id" id="id">
                    <label>Nombre:</label>
                    <input class="form-control" type="text" name="name" id="name" />
                    <br>
                    <label>Descripción:</label>
                    <input class="form-control" type="text" name="description" id="description" />
                    <br>
                    <label>Fecha de estreno:</label>
                    <input class="form-control" type="date" name="date" id="date" />
                    <br>
                    <label>Dinero recaudado:</label>
                    <input class="form-control" type="number" name="collection" id="collection" step="any" />
                    <br>
                    <span style="color: green">Activa</span>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal"><i class="fas fa-times"></i> Cerrar</button>
                <button type="submit" class="btn btn-primary"><i class="fas fa-edit"></i> Modificar</button>
                </form>
            </div>
        </div>
    </div>
</div>
    <div class="modal fade" id="create" tabindex="-1" aria-labelledby="exampleModalLabel2" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel2">Registrar pelicula</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form action="${context}/ServletMovies" method="POST">
                        <input type="hidden" value="create" name="action">
                        <label>Nombre:</label>
                        <input class="form-control" type="text" name="name" />
                        <br>
                        <label>Descripción:</label>
                        <input class="form-control" type="text" name="description" />
                        <br>
                        <label>Fecha de estreno:</label>
                        <input class="form-control" type="date" name="date" />
                        <br>
                        <label>Dinero recaudado:</label>
                        <input class="form-control" type="number" name="collection" step="any" />
                        <br>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal"><i class="fas fa-times"></i> Cerrar</button>

                    <button type="submit" class="btn btn-success"><i class="fas fa-plus"></i> Agregar</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

<div class="modal fade" id="delete" tabindex="-1" aria-labelledby="exampleModalLabel3" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel3">Eliminar película</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="${context}/ServletMovies" method="POST">
                    <input type="hidden" value="delete" name="action">
                    <input type="hidden" id="id1" name="id">
                    ¿Estás seguro de querer eliminar la película <span id="name1"></span>?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal"><i class="fas fa-times"></i> Cerrar</button>

                <button type="submit" class="btn btn-danger"><i class="fas fa-trash"></i> Eliminar</button>
                </form>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="details" tabindex="-1" aria-labelledby="exampleModalLabel4" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel4">Detalles de la película</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <label>Id: </label>
                <br>
                <b><span id="id2"></span></b>
                <br>
                <label>Nombre: </label>
                <br>
                <b><span id="name2"></span></b>
                <br>
                <label>Descripción: </label>
                <br>
                <b><span id="description2"></span></b>
                <br>
                <label>Fecha de estreno: </label>
                <br>
                <b><span id="premiere2"></span></b>
                <br>
                <label>Dinero recaudado: </label>
                <br>
                <b><span id="collection2"></span></b>
                <br>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal"><i class="fas fa-times"></i> Cerrar</button>
            </div>
        </div>
    </div>
</div>
    <script>
        function update(id, name, description, date, collection){
            document.getElementById("id").value=id;
            document.getElementById("name").value=name;
            document.getElementById("description").value=description
            document.getElementById("date").value=date;
            document.getElementById("collection").value=collection;
        }
    </script>
<script>
    function deleteMovie(id, name1){
        document.getElementById("id1").value=id;
        document.getElementById("name1").innerHTML=name1;
    }
</script>
<script>
    function details(id, name, description, date, collection){
        document.getElementById("id2").innerHTML=id;
        document.getElementById("name2").innerHTML=name;
        document.getElementById("description2").innerHTML=description;
        document.getElementById("premiere2").innerHTML=date;
        document.getElementById("collection2").innerHTML=collection;
    }
</script>

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
</body>

</body>
</html>
