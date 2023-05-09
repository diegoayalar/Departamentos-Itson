<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Departamento"%>
<%@page import="control.DepartamentosCtrl"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Departamentos</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <!-- Custom CSS -->
    </head>
    <body>
        <div class="container-fluid">
            <div class="row">
                <!-- Navigation Bar -->
                <nav class="navbar navbar-expand-md navbar-dark bg-dark position-fixed w-100">
                    <div class="container-fluid">
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse" id="navbarNav">
                            <ul class="navbar-nav">
                                <li class="nav-item">
                                    <a class="nav-link active">
                                        <i class="fas fa-building mr-2"></i>
                                        Departamentos
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="inquilinos.jsp">
                                        <i class="fas fa-users mr-2"></i>
                                        Arrendatarios
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="pagos.jsp">
                                        <i class="fas fa-money-bill-wave mr-2"></i>
                                        Pagos
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>
                <!-- Content -->
                <main role="main" class="col-md-9 ml-sm-auto col-lg-12 pt-3 px-4" style="margin-top: 60px">
                    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pb-2 mb-3 border-bottom">
                        <h1 class="h2">Departamentos</h1>
                    </div>
                    <div class="row">
                        <div class="col-md-4">
                            <h3>Agregar departamento</h3>
                            <form action="agregarDepartamento" method="POST">
                                <div class="form-group">
                                    <label for="id">ID</label>
                                    <input type="text" class="form-control" id="id" name="id" placeholder="Ingrese el ID">
                                </div>
                                <div class="form-group">
                                    <label for="ubicacion">Ubicación</label>
                                    <input type="text" class="form-control" id="ubicacion" name="ubicacion" placeholder="Ingrese la ubicación">
                                </div>
                                <div class="form-group">
                                    <label for="precio">Precio</label>
                                    <input type="text" class="form-control" id="precio" name="precio" placeholder="Ingrese el precio">
                                </div>
                                <button type="submit" class="btn btn-primary">Agregar Departamento</button>
                            </form>
                        </div>
                        <div class="col-md-8">
                            <h3>Lista de departamentos</h3>
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Ubicación</th>
                                        <th>Precio</th>
                                        <th>Acción</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%    
                                        DepartamentosCtrl departamentosCtrl = new DepartamentosCtrl();

                                        List<Departamento> departamentos = departamentosCtrl.consultarTodos();
                                        for (Departamento departamento : departamentos) {
                                    %>
                                    <tr>
                                        <td><%= departamento.getId() %></td>
                                        <td><%= departamento.getUbicacion() %></td>
                                        <td>$<%= departamento.getPrecio() %></td>
                                        <td>
                                            <a href="#" class="btn btn-primary" data-toggle="modal" data-target="#editarDepartamentoModal" data-id="<%= departamento.getId() %>" data-ubicacion="<%= departamento.getUbicacion() %>" data-precio="<%= departamento.getPrecio() %>"><i class="fas fa-edit"></i></a>
                                            <a href="#" class="btn btn-danger" data-toggle="modal" data-target="#confirmarEliminarModal" data-id="<%= departamento.getId() %>"><i class="fas fa-trash"></i>
                                            </a>                                      
                                        </td>
                                    </tr>
                                    <% } %>
                                </tbody>
                            </table>
                            <!-- Modal de Actualizar Departamento -->
                            <div class="modal fade" id="editarDepartamentoModal" tabindex="-1" role="dialog" aria-labelledby="editarDepartamentoModalLabel" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="editarDepartamentoModalLabel">Editar departamento</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <form action="actualizarDepartamento" method="PUT">
                                                <div class="form-group">
                                                    <label for="id">ID</label>
                                                    <input type="text" class="form-control" id="id" name="id" readonly>
                                                </div>
                                                <div class="form-group">
                                                    <label for="ubicacion">Ubicación</label>
                                                    <input type="text" class="form-control" id="ubicacion" name="ubicacion" placeholder="Ingrese la ubicación">
                                                </div>
                                                <div class="form-group">
                                                    <label for="precio">Precio</label>
                                                    <input type="text" class="form-control" id="precio" name="precio" placeholder="Ingrese el precio">
                                                </div>
                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                                                <button type="submit" class="btn btn-primary">Actualizar Departamento</button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Modal de Eliminar Departamento -->
                            <div class="modal fade" id="confirmarEliminarModal" tabindex="-1" role="dialog" aria-labelledby="confirmarEliminarModalLabel" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <form id="eliminarDepartamentoForm" action="eliminarDepartamento" method="DELETE    ">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="confirmarEliminarModalLabel">Confirmar eliminación</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                ¿Está seguro de eliminar el departamento?
                                                <input type="hidden" name="id" id="id">
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                                                <input type="submit" class="btn btn-danger" value="Eliminar">
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </main>
            </div>
        </div>
        <!-- Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    </body>
</html>

<script>
    $('#editarDepartamentoModal').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget); // Button that triggered the modal
        var id = button.data('id'); // Extract info from data-* attributes
        var ubicacion = button.data('ubicacion');
        var precio = button.data('precio');

        var modal = $(this);
        modal.find('.modal-title').text('Editar departamento #' + id);
        modal.find('#id').val(id);
        modal.find('#ubicacion').val(ubicacion);
        modal.find('#precio').val(precio);
    });
</script>

<script>
    $('#confirmarEliminarModal').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget); // Button that triggered the modal
        var id = button.data('id'); // Extract info from data-* attributes

        var modal = $(this);
        modal.find('.modal-title').text('Eliminar departamento #' + id);
        modal.find('#id').val(id);
    });
</script>