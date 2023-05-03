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
                            <form>
                                <div class="form-group">
                                    <label for="Arrendatario">Arrendatario</label>
                                    <select class="form-control" id="Arrendatario">
                                        <option disabled selected value="">
                                            -- Seleccionar Arrendatario --
                                        </option>
                                        <option value="1">1, Juan Lopez</option>
                                        <option value="2">
                                            2, Maria Acevedo
                                        </option>
                                        <option value="3">3, John Wick</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="mes">Mes</label>
                                    <select class="form-control" id="mes">
                                        <option disabled selected value="">
                                            -- Seleccionar mes --
                                        </option>
                                        <option value="01">Enero</option>
                                        <option value="02">Febrero</option>
                                        <option value="03">Marzo</option>
                                        <option value="04">Abril</option>
                                        <option value="05">Mayo</option>
                                        <option value="06">Junio</option>
                                        <option value="07">Julio</option>
                                        <option value="08">Agosto</option>
                                        <option value="09">Septiembre</option>
                                        <option value="10">Octubre</option>
                                        <option value="11">Noviembre</option>
                                        <option value="12">Diciembre</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="fecha">Fecha</label>
                                    <input
                                        type="date"
                                        class="form-control"
                                        id="fecha"
                                        placeholder="Ingrese la fecha"
                                    />
                                </div>
                                <div class="form-group">
                                    <label for="monto">Monto</label>
                                    <input
                                        type="text"
                                        class="form-control"
                                        id="monto"
                                        placeholder="Ingrese el monto"
                                    />
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
                                        <th>Arrendatario</th>
                                        <th>Mes</th>
                                        <th>Fecha</th>
                                        <th>Monto</th>
                                        <th>Acción</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>1</td>
                                        <td>1, Juan López</td>
                                        <td>Febrero</td>
                                        <td>02/03/23</td>
                                        <td>$1450</td>
                                        <td>
                                            <a href="#" class="btn btn-primary"
                                                ><i class="fas fa-edit"></i
                                            ></a>
                                            <a href="#" class="btn btn-danger"
                                                ><i class="fas fa-trash"></i
                                            ></a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>2</td>
                                        <td>2, Maria Acevedo</td>
                                        <td>Febrero</td>
                                        <td>04/03/23</td>
                                        <td>$1450</td>
                                        <td>
                                            <a href="#" class="btn btn-primary"
                                                ><i class="fas fa-edit"></i
                                            ></a>
                                            <a href="#" class="btn btn-danger"
                                                ><i class="fas fa-trash"></i
                                            ></a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>3</td>
                                        <td>3, John Wick</td>
                                        <td>Febrero</td>
                                        <td>07/03/23</td>
                                        <td>$1450</td>
                                        <td>
                                            <a href="#" class="btn btn-primary"
                                                ><i class="fas fa-edit"></i
                                            ></a>
                                            <a href="#" class="btn btn-danger"
                                                ><i class="fas fa-trash"></i
                                            ></a>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
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
