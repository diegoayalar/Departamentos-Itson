<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Index</title>
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
    </head>
    <body>
        <div class="container-fluid">
            <div class="row">
                <!-- Left Navigation Bar -->
                <nav class="navbar navbar-expand-md navbar-dark bg-dark position-fixed w-100">
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
                                    <a class="nav-link" data-toggle="modal" data-target="#loginModal" style="cursor: pointer;">
                                        <i class="fas fa-sign-in-alt mr-2"></i>
                                        Iniciar sesión
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a
                                        class="nav-link"
                                        href="registro.jsp"
                                        >
                                        <i class="fas fa-user-plus mr-2"></i>
                                        Registrarse
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>

                <!-- Content -->
                <main class="col-md-9 ml-sm-auto col-lg-12 pt-3 px-4" style="margin-top: 60px">
                    <div class="text-center">
                        <img src="https://departamentositson.000webhostapp.com/logo.png" style="border-radius: 10px" alt="Logo Departamentos">
                    </div>
                    <h1 class="text-center mt-4"><strong>Administración de recursos y clientes</strong></h1>
                </main>

                <div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered" role="document">
                        <div class="modal-content">
                            <div class="modal-header border-bottom-0">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <div class="form-title text-center">
                                    <h4>Bienvenido</h4>
                                </div>
                                <div class="d-flex flex-column text-center">
                                    <form action="iniciarSesion" method="GET">
                                        <div class="form-group">
                                            <input name="usuario" type="text" class="form-control" id="email1" placeholder="Usuario">
                                        </div>
                                        <div class="form-group">
                                            <input name="password" type="password" class="form-control" id="password1" placeholder="Contraseña">
                                        </div>
                                        <input type="submit" class="btn btn-primary btn-block btn-round" value="Iniciar sesión">
                                    </form>


                                </div>
                            </div>
                            <div class="modal-footer d-flex justify-content-center">
                                <div class="signup-section">¿Aún no tienes cuenta? <a href="registro.jsp" class="text-info">Registrarse</a></div>
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
