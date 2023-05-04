<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Inquilino"%>
<%@page import="modelo.Departamento"%>
<%@page import="control.InquilinosCtrl"%>
<%@page import="control.DepartamentosCtrl"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Arrendatarios</title>
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
                <!-- Left Navigation Bar -->
                <nav class="navbar navbar-expand-md navbar-dark bg-dark position-fixed w-100">
                    <div class="container-fluid">
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse" id="navbarNav">
                            <ul class="navbar-nav">
                                <li class="nav-item">
                                    <a class="nav-link" href="departamentos.jsp">
                                        <i class="fas fa-building mr-2"></i>
                                        Departamentos
                                    </a>
                                </li>
                                <li class="nav-item active">
                                    <a class="nav-link">
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
                        <h1 class="h2">Arrendatarios</h1>
                    </div>
                    <div class="row">
                        <div class="col-md-4">
                            <h3>Agregar Arrendatario</h3>
                            <form action="agregarInquilino" method="POST">
                                <div class="form-group">
                                    <label for="nombre">Nombre</label>
                                    <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Ingrese el nombre">
                                </div>
                                <div class="form-group">
                                    <label for="numeroTelefono">Número de teléfono</label>
                                    <input type="text" class="form-control" id="numeroTelefono" name="numeroTelefono" placeholder="Ingrese el número">
                                </div>
                                <div class="form-group">
                                    <label for="fechaInicioContrato">Fecha de inicio de contrato</label>
                                    <input type="date" class="form-control" id="fechaInicioContrato" name="fechaInicioContrato">
                                </div>
                                <div class="form-group">
                                    <label for="montoPagoContrato">Monto a pagar</label>
                                    <input type="text" class="form-control" id="montoPagoContrato" name="montoPagoContrato" placeholder="Ingrese el monto">
                                </div>
                                <div class="form-group">
                                    <%    
                                        DepartamentosCtrl departamentosCtrl = new DepartamentosCtrl();
                                        List<Departamento> departamentos = departamentosCtrl.consultarTodos();
                                    %>
                                    <label for="departamento">Departamento</label>
                                    <select class="form-control" id="idDepartamento" name="idDepartamento">
                                        <option disabled selected value="">-- Seleccionar departamento --</option>
                                        <%
                                            for (Departamento departamento : departamentos) {
                                        %>
                                        <option value="<%= departamento.getId() %>"><%= departamento.getId() %></option>
                                        <% } %>
                                    </select>
                                </div>
                                <button type="submit" class="btn btn-primary">Agregar Arrendatario</button>
                            </form>
                        </div>
                        <div class="col-md-8">
                            <h3>Lista de arrendatarios</h3>
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Nombre</th>
                                        <th>Número telefónico</th>
                                        <th>Inicio de contrato</th>
                                        <th>Monto a pagar</th>
                                        <th>Departamento</th>
                                        <th>Estado</th>
                                        <th>Acción</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%    
                                       InquilinosCtrl inquilinosCtrl = new InquilinosCtrl();

                                       List<Inquilino> inquilinos = inquilinosCtrl.consultarTodos();
                                        for (Inquilino inquilino : inquilinos) {
                                    %>
                                    <tr>
                                        <td><%= inquilino.getId() %></td>
                                        <td><%= inquilino.getNombre() %></td>
                                        <td><%= inquilino.getNumeroTelefono() %></td>
                                        <td><%= inquilino.getInicioContrato() %></td>
                                        <td>$<%= inquilino.getMontoPagoContrato() %></td>
                                        <td><%= inquilino.getIdDepartamento() %></td>
                                        <td><%= inquilino.getEstado() == true ? "Activo" : "Inactivo" %></td>
                                        <td>
                                            <a href="#" class="btn btn-primary" data-toggle="modal" data-target="#editarInquilinoModal" data-id="<%= inquilino.getId() %>" data-nombre="<%= inquilino.getNombre() %>" data-numero_telefono="<%= inquilino.getNumeroTelefono() %>" data-fecha_inicio_contrato="<%= inquilino.getInicioContrato() %>" data-monto_pago_contrato="<%= inquilino.getMontoPagoContrato() %>" data-id_departamento="<%= inquilino.getIdDepartamento() %>"data-estado="<%= inquilino.getEstado() %>"><i class="fas fa-edit"></i></a>
                                            <a href="#" class="btn btn-danger" data-toggle="modal" data-target="#confirmarDarBajaModal" data-id="<%= inquilino.getId() %>"><i class="fas fa-trash"></i>
                                            </a>       
                                        </td>
                                    </tr>
                                    <% } %>
                                </tbody>
                            </table>
                            <!-- Modal de Actualizar inquilino -->
                            <div class="modal fade" id="editarInquilinoModal" tabindex="-1" role="dialog" aria-labelledby="editarInquilinoModalLabel" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="editarInquilinoModalLabel">Editar Inquilino</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <form action="actualizarInquilino" method="PUT">
                                                <div class="form-group">
                                                    <label for="id">ID</label>
                                                    <input type="text" class="form-control" id="id" name="id" readonly>
                                                </div>
                                                <div class="form-group">
                                                    <label for="nombre">Nombre</label>
                                                    <input type="text" class="form-control" id="nombre" name="nombre">
                                                </div>
                                                <div class="form-group">
                                                    <label for="numeroTelefono">Número de teléfono</label>
                                                    <input type="text" class="form-control" id="numeroTelefono" name="numeroTelefono">
                                                </div>
                                                <div class="form-group">
                                                    <label for="fechaInicioContrato">Fecha de inicio de contrato</label>
                                                    <input type="date" class="form-control" id="fechaInicioContrato" name="fechaInicioContrato">
                                                </div>
                                                <div class="form-group">
                                                    <label for="montoPagoContrato">Monto a pagar</label>
                                                    <input type="text" class="form-control" id="montoPagoContrato" name="montoPagoContrato">
                                                </div>
                                                <div class="form-group">
                                                    <%    
                                                       departamentos = departamentosCtrl.consultarTodos();
                                                    %>
                                                    <label for="idDepartamento">Departamento</label>
                                                    <select class="form-control" id="idDepartamento" name="idDepartamento">
                                                        <option disabled selected value="">-- Seleccionar departamento --</option>
                                                        <% for (Departamento departamento : departamentos) { %>
                                                        <option value="<%= departamento.getId() %>"><%= departamento.getId() %></option>
                                                        <% } %>
                                                    </select>
                                                </div>
                                                <div class="form-group">
                                                    <label for="estado">Estado</label>
                                                     <select class="form-control" id="estado" name="estado">
                                                        <option disabled selected value="">-- Seleccionar estado --</option>
                                                        <option value="false">Inactivo</option>
                                                        <option value="true">Activo</option>
                                                    </select>
                                                </div>
                                                <button type="submit" class="btn btn-primary">Actualizar Inquilino</button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Modal de Eliminar Departamento -->
                            <div class="modal fade" id="confirmarDarBajaModal" tabindex="-1" role="dialog" aria-labelledby="confirmarDarBajaModalLabel" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <form id="darBajaInquilinoForm" action="darBajaInquilino" method="PUT">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="confirmarDarBajaModalLabel">Confirmar dar de baja</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                ¿Está seguro de dar de baja al inquilino?
                                                <input type="hidden" name="id" id="id">
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                                                <input type="submit" class="btn btn-danger" value="Dar de baja">
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
            </div>
            <!-- Bootstrap JS -->
            <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    </body>
</html>

<script>
    $('#editarInquilinoModal').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget); // Button that triggered the modal
        var id = button.data('id'); // Extract info from data-* attributes
        var nombre = button.data('nombre');
        var numeroTelefono = button.data('numero_telefono');
        var fechaInicioContrato = button.data('fecha_inicio_contrato');
        var montoPagoContrato = button.data('monto_pago_contrato');
        var idDepartamento = button.data('id_departamento');
        var estado = button.data('estado');

        var modal = $(this);
        modal.find('.modal-title').text('Editar inquilino #' + id);
        modal.find('#id').val(id);
        modal.find('#nombre').val(nombre);
        modal.find('#numeroTelefono').val(numeroTelefono);
        modal.find('#fechaInicioContrato').val(fechaInicioContrato);
        modal.find('#montoPagoContrato').val(montoPagoContrato);
        modal.find('#idDepartamento').val(idDepartamento);
        modal.find('#estado').val(estado);
    });
</script>

<script>
    $('#confirmarDarBajaModal').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget); // Button that triggered the modal
        var id = button.data('id'); // Extract info from data-* attributes

        var modal = $(this);
        modal.find('.modal-title').text('Dar de baja inquilino #' + id);
        modal.find('#id').val(id);
    });
</script>