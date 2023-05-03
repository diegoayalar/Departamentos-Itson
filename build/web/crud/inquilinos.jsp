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
                            <form>
                                <div class="form-group">
                                    <label for="nombre">Nombre</label>
                                    <input type="text" class="form-control" id="nombre" placeholder="Ingrese el nombre">
                                </div>
                                <div class="form-group">
                                    <label for="numeroTelefono">Número de teléfono</label>
                                    <input type="text" class="form-control" id="numeroTelefono" placeholder="Ingrese el número">
                                </div>
                                <div class="form-group">
                                    <label for="inicioContrato">Fecha de inicio de contrato</label>
                                    <input type="date" class="form-control" id="inicioContrato">
                                </div>
                                <div class="form-group">
                                    <label for="montoPago">Monto a pagar</label>
                                    <input type="text" class="form-control" id="montoPago" placeholder="Ingrese el monto">
                                </div>
                                <div class="form-group">
                                    <label for="departamento">Departamento</label>
                                    <select class="form-control" id="Arrendatario">
                                        <option disabled selected value="">-- Seleccionar departamento --</option>
                                        <option value="1">A1</option>
                                        <option value="2">A2</option>
                                        <option value="3">A3</option>                                        <option value="1">A1</option>
                                        <option value="4">A4</option>
                                        <option value="5">A5</option>
                                        <option value="6">A6</option>
                                        <option value="7">B1</option>
                                        <option value="8">B2</option>
                                        <option value="9">B3</option>
                                        <option value="10">B4</option>
                                        <option value="11">B5</option>
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
                                    <tr>
                                        <td>1</td>
                                        <td>Juan López</td>
                                        <td>6441061933</td>
                                        <td>12/02/23</td>
                                        <td>$1450</td>
                                        <td>A1</td>
                                        <td>1</td>
                                        <td>
                                            <a href="#" class="btn btn-primary"><i class="fas fa-edit"></i></a>
                                            <a href="#" class="btn btn-danger"><i class="fas fa-trash"></i></a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>2</td>
                                        <td>Maria Acevedo</td>
                                        <td>6442963305</td>
                                        <td>17/02/23</td>
                                        <td>$1450</td>
                                        <td>A1</td>
                                        <td>1</td>
                                        <td>
                                            <a href="#" class="btn btn-primary"><i class="fas fa-edit"></i></a>
                                            <a href="#" class="btn btn-danger"><i class="fas fa-trash"></i></a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>3</td>
                                        <td>John Wick</td>
                                        <td>6444811040</td>
                                        <td>01/03/23</td>
                                        <td>$1450</td>
                                        <td>A1</td>
                                        <td>0</td>
                                        <td>
                                            <a href="#" class="btn btn-primary"><i class="fas fa-edit"></i></a>
                                            <a href="#" class="btn btn-danger"><i class="fas fa-trash"></i></a>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
            </div>
            <!-- Bootstrap JS -->
            <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    </body>
</html>