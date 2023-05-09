<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Inquilino"%>
<%@page import="modelo.Pago"%>
<%@page import="control.InquilinosCtrl"%>
<%@page import="control.PagosCtrl"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Pagos</title>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <!-- Bootstrap CSS -->
        <link
            rel="stylesheet"
            href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
            />
        <!-- Font Awesome -->
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
            />
        <!-- Custom CSS -->
    </head>
    <body>
        <div class="container-fluid">
            <div class="row">
                <!-- Left Navigation Bar -->
                <nav
                    class="navbar navbar-expand-md navbar-dark bg-dark position-fixed w-100"
                    >
                    <div class="container-fluid">
                        <button
                            class="navbar-toggler"
                            type="button"
                            data-toggle="collapse"
                            data-target="#navbarNav"
                            >
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse" id="navbarNav">
                            <ul class="navbar-nav">
                                <li class="nav-item">
                                    <a
                                        class="nav-link"
                                        href="departamentos.jsp"
                                        >
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
                                    <a class="nav-link active">
                                        <i
                                            class="fas fa-money-bill-wave mr-2"
                                            ></i>
                                        Pagos
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>
                <!-- Content -->
                <main
                    role="main"
                    class="col-md-9 ml-sm-auto col-lg-12 pt-3 px-4"
                    style="margin-top: 60px"
                    >
                    <div
                        class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pb-2 mb-3 border-bottom"
                        >
                        <h1 class="h2">Pagos</h1>
                    </div>
                    <div class="row">
                        <div class="col-md-4">
                            <h3>Agregar pago</h3>
                            <form action="agregarPago" method="POST">
                                <div class="form-group">
                                    <%    
                                        InquilinosCtrl inquilinosCtrl = new InquilinosCtrl();
                                        List<Inquilino> inquilinos = inquilinosCtrl.consultarTodos();
                                    %>
                                    <label for="idInquilino">Inquilino</label>
                                    <select class="form-control" id="idInquilino" name="idInquilino">
                                        <option disabled selected value="">-- Seleccionar Inquilino --</option>
                                        <%
                                            for (Inquilino inquilino : inquilinos) {
                                        %>
                                        <option value="<%= inquilino.getId() %>"><%= inquilino.getNombre() %></option>
                                        <% } %>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="mes">Mes</label>
                                    <select class="form-control" id="mes" name="mes">
                                        <option disabled selected value="">
                                            -- Seleccionar mes --
                                        </option>
                                        <option value="0">Enero</option>
                                        <option value="1">Febrero</option>
                                        <option value="2">Marzo</option>
                                        <option value="3">Abril</option>
                                        <option value="4">Mayo</option>
                                        <option value="5">Junio</option>
                                        <option value="6">Julio</option>
                                        <option value="7">Agosto</option>
                                        <option value="8">Septiembre</option>
                                        <option value="9">Octubre</option>
                                        <option value="10">Noviembre</option>
                                        <option value="11">Diciembre</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="fecha">Fecha</label>
                                    <input type="date" class="form-control" id="fecha" name="fecha" placeholder="Ingrese la fecha"/>
                                </div>
                                <div class="form-group">
                                    <label for="monto">Monto</label>
                                    <input type="text" class="form-control" id="monto" name="monto" placeholder="Ingrese el monto"/>
                                </div>
                                <button type="submit" class="btn btn-primary">
                                    Agregar pago
                                </button>
                            </form>
                        </div>
                        <div class="col-md-8">
                            <h3>Lista de pagos</h3>
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Inquilino</th>
                                        <th>Mes</th>
                                        <th>Fecha</th>
                                        <th>Monto</th>
                                        <th>Estado</th>
                                        <th>Acción</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%    
                                        PagosCtrl pagosCtrl = new PagosCtrl();

                                        List<Pago> pagos = pagosCtrl.consultarTodos();
                                        for (Pago pago : pagos) {
                                    %>
                                    <tr>
                                        <td><%= pago.getId() %></td>
                                        <td><%= inquilinosCtrl.consultar(String.valueOf(pago.getIdInquilino())).getNombre() %></td>
                                        <td>
                                            <% 
                                              switch(pago.getMes()) {
                                                case 0:
                                                  out.print("Enero");
                                                  break;
                                                case 1:
                                                  out.print("Febrero");
                                                  break;
                                                case 2:
                                                  out.print("Marzo");
                                                  break;
                                                case 3:
                                                  out.print("Abril");
                                                  break;
                                                case 4:
                                                  out.print("Mayo");
                                                  break;
                                                case 5:
                                                  out.print("Junio");
                                                  break;
                                                case 6:
                                                  out.print("Julio");
                                                  break;
                                                case 7:
                                                  out.print("Agosto");
                                                  break;
                                                case 8:
                                                  out.print("Septiembre");
                                                  break;
                                                case 9:
                                                  out.print("Octubre");
                                                  break;
                                                case 10:
                                                  out.print("Noviembre");
                                                  break;
                                                case 11:
                                                  out.print("Diciembre");
                                                  break;
                                              }
                                            %>
                                        </td>
                                        <td><%= pago.getFecha() %></td>
                                        <td>$<%= pago.getMonto() %></td>
                                        <td><%= pago.getEstado() == true ? "Pagado" : "Cancelado" %></td>
                                        <td>
                                            <a href="#" class="btn btn-primary" data-toggle="modal" data-target="#editarPagoModal" data-id="<%= pago.getId() %>" data-id-inquilino="<%= pago.getIdInquilino() %>" data-mes="<%= pago.getMes() %>" data-fecha="<%= pago.getFecha() %>" data-monto="<%= pago.getMonto() %>" data-estado="<%= pago.getEstado() %>"><i class="fas fa-edit"></i></a>
                                            <a href="#" class="btn btn-danger" data-toggle="modal" data-target="#confirmarPendienteModal" data-id="<%= pago.getId() %>"><i class="fas fa-trash"></i></a>  
                                        </td>
                                    </tr>
                                    <% } %>
                                </tbody>
                            </table>
                            <!-- Modal de Actualizar inquilino -->
                            <div class="modal fade" id="editarPagoModal" tabindex="-1" role="dialog" aria-labelledby="editarPagoModalLabel" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="editarPagoModalLabel">Editar Pago</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <form action="actualizarPago" method="PUT">
                                                <div class="form-group">
                                                    <label for="id">ID</label>
                                                    <input type="text" class="form-control" id="id" name="id" readonly>
                                                </div>
                                                <div class="form-group">
                                                    <%    
                                                       inquilinos = inquilinosCtrl.consultarTodos();
                                                    %>
                                                    <label for="idInquilino">Inquilino</label>
                                                    <select class="form-control" id="idInquilino" name="idInquilino">
                                                        <option disabled selected value="">-- Seleccionar inquilino --</option>
                                                        <% for (Inquilino inquilino: inquilinos) { %>
                                                        <option value="<%= inquilino.getId() %>"><%= inquilino.getNombre() %></option>
                                                        <% } %>
                                                    </select>
                                                </div>
                                                <div class="form-group">
                                                    <label for="mes">Mes</label>
                                                    <select class="form-control" id="mes" name="mes">
                                                        <option disabled selected value="">
                                                            -- Seleccionar mes --
                                                        </option>
                                                        <option value="0">Enero</option>
                                                        <option value="1">Febrero</option>
                                                        <option value="2">Marzo</option>
                                                        <option value="3">Abril</option>
                                                        <option value="4">Mayo</option>
                                                        <option value="5">Junio</option>
                                                        <option value="6">Julio</option>
                                                        <option value="7">Agosto</option>
                                                        <option value="8">Septiembre</option>
                                                        <option value="9">Octubre</option>
                                                        <option value="10">Noviembre</option>
                                                        <option value="11">Diciembre</option>
                                                    </select>
                                                </div>
                                                <div class="form-group">
                                                    <label for="fecha">Fecha</label>
                                                    <input type="date" class="form-control" id="fecha" name="fecha">
                                                </div>
                                                <div class="form-group">
                                                    <label for="monto">Monto</label>
                                                    <input type="text" class="form-control" id="monto" name="monto">
                                                </div>
                                                <div class="form-group">
                                                    <label for="estado">Estado</label>
                                                    <select class="form-control" id="estado" name="estado">
                                                        <option disabled selected value="">-- Seleccionar estado --</option>
                                                        <option value="false">Pendiente</option>
                                                        <option value="true">Pagado</option>
                                                    </select>
                                                </div>
                                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                                                <button type="submit" class="btn btn-primary">Actualizar Pago</button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Modal de poner pendiente pago -->
                            <div class="modal fade" id="confirmarPendienteModal" tabindex="-1" role="dialog" aria-labelledby="confirmarPendienteModalLabel" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <form id="confirmarPendienteForm" action="ponerPendientePago" method="PUT">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="confirmarPendienteModalLabel">Confirmar poner como pendiente</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                ¿Está seguro de poner pendiente el pago?
                                                <input type="hidden" name="id" id="id">
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                                                <input type="submit" class="btn btn-danger" value="Poner pendiente">
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
    $('#editarPagoModal').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget); // Button that triggered the modal
        var id = button.data('id'); // Extract info from data-* attributes
        var idInquilino = button.data('id-inquilino');
        var mes = button.data('mes');
        var fecha = button.data('fecha');
        var monto = button.data('monto');
        var estado = button.data('estado');

        var modal = $(this);
        modal.find('.modal-title').text('Editar Pago #' + id);
        modal.find('#id').val(id);
        modal.find('#idInquilino').val(idInquilino);
        modal.find('#mes').val(mes);
        modal.find('#fecha').val(fecha);
        modal.find('#monto').val(monto);
        modal.find('#estado').val(estado);
    });
</script>

<script>
    $('#confirmarPendienteModal').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget); // Button that triggered the modal
        var id = button.data('id'); // Extract info from data-* attributes

        var modal = $(this);
        modal.find('.modal-title').text('Poner pendiente pago #' + id);
        modal.find('#id').val(id);
    });
</script>