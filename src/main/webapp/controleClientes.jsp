<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en" ng-app="appCliente" ng-controller="controllerClientes">
    <head>
        <meta charset="utf-8">
        <title>SISTEX</title>

        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,400i,500,500i,600,600i,700" rel="stylesheet">

        <!-- Template Styles -->
        <link rel="stylesheet" href="resources/css/font-awesome.min.css">

        <!-- CSS Reset -->
        <link rel="stylesheet" href="resources/css/normalize.css">

        <!-- Milligram CSS minified -->
        <link rel="stylesheet" href="resources/css/milligram.min.css">

        <!-- Main Styles -->
        <link rel="stylesheet" href="resources/css/styles.css">


        <script src="resources/js/chart.min.js"></script>
        <script src="resources/js/chart-data.js"></script>
        <script src="resources/js/script.js"></script>

        <link rel="stylesheet" href="resources/css/animate.css">
        <link rel="stylesheet" href="resources/css/style.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
        <script src="${contextPath}/resources/js/bootstrap.min.js"></script>
        <script src="resources/jswow.min.js" type="text/javascript"></script>
        <script type="text/javascript" src="resources/js/MyJQ.js"></script>
        <script src="resources/js/jquery.localScroll.min.js" type="text/javascript"></script>
        <script src="resources/js/jquery.scrollTo.min.js" type="text/javascript"></script> 
        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
        <script type="text/javascript" src="resources/js/scrollfunction.js"></script>
        <script type="text/javascript" src="resources/js/wow.min.js"></script>
        <script type="text/javascript" src="resources/js/init.js"></script>
        <script type="text/javascript" src="resources/js/manipulaTela1.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
        <link href="https://fonts.googleapis.com/css?family=Lato:400,300,700" rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link rel="icon" href="resources/images/icon.png">

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.8/angular.min.js"></script>
        <script src="https://code.angularjs.org/1.5.8/angular-route.min.js"></script>
        <script src="resources/js/controllerClientes.js"></script>
    </head>

    <body>

        <c:if test="${pageContext.request.userPrincipal.name != null}">
            <h2 >Bem Vindo {{funcionario.nome}}</h2>
            <form id="logoutForm" method="POST" action="${contextPath}/logout">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            </form>

            <input type="text" class="hidden" ng-init=" rg = ${pageContext.request.userPrincipal.name}"  ng-model="rg" />
            <input type="button" class="hidden" value="atualizar" ng-init="buscarFuncionario()"/>
            <!--            <input type="button" class="hidden" value="atualizar" ng-init="Pedidos()"/>-->

            <form>
                <input type="button" value="Logout" onclick="document.forms['logoutForm'].submit()" />

            </form>


        </c:if>



        <div class="row">
            <div id="sidebar" class="column">
                <h4>Dados do funcion�rio<h4>
                        <div>
                            <h5>Nome:{{funcionario.nome}}</h5>
                            <h5>RG:{{funcionario.rg}}</h5>
                            <h5>Email:{{funcionario.email}}</h5>
                            <h5>Endere�o:{{funcionario.endereco}}</h5>
                            <h5>Telefone:{{funcionario.telefone}}</h5> 
                            <h5>Cargo:{{funcionario.cargo}}</h5> 
                        </div>
                        <h4>Navega��o</h4>

                        <ul>
                           <li><a href="conta.jsp"><em class="fa fa-home"></em> Inicio</a></li>
                            <li><a href="controlePedidos.jsp"><em class="fa fa-forward"></em>Pedidos</a></li>
                            <li><a href="controleClientes.jsp"><em class="fa fa-forward"></em>Clientes</a></li>
                            <li><a href="controleProdutos.jsp"><em class="fa fa-forward"></em>Produtos</a></li>
                        </ul>
                        <br>
                        <br>
                        <br>
                        </div>
                        <section id="main-content" class="column column-offset-20">
                            <h1 class="mt-2">Controle de Clientes   </h1><a class="anchor" name="widgets"></a>

                            <div class="row grid-responsive mt-1">
                                <div class="column">
                                    <div class="card">
                                        <div class="card-block">
                                            <form class="navbar-form" ng-click="buscarCliente()">
                                                <div class="form-group" style="display:inline;">
                                                    <div class="input-group" style="display:table;">
                                                        <span class="input-group-addon" style="width:1%;"><span class="glyphicon glyphicon-search"></span></span>
                                                        <input class="form-control" name="nome" placeholder="Coloque aqui o cpf do cliente" autocomplete="off" autofocus="autofocus" type="text" ng-model="cpf">
                                                        <input class="hidden" type="submit" />
                                                    </div>
                                                </div>
                                            </form>


                                            <div ng-repeat="cliente in clientes">
                                                <div class="mt-1">
                                                    <div class="float-left ml-1">
                                                        <h4>Nome do cliente: {{cliente.nome}} </h4>
                                                        <h4>Data de nascimento: {{cliente.datanascimento}}</h4>
                                                        <h4>ID: {{cliente.idcliente}}</h4>
                                                        <label class="alinha">Nome  <input type="text" class="form-control "  placeholder="Seu Nome" ng-model="cliente.nome" required/></label>
                                                        <label class="alinha">Telefone  <input type="text" class="form-control "  placeholder="Seu Nome" ng-model="cliente.telefone" required/></label>
                                                        <label class="alinha">Email  <input type="text" class="form-control "  placeholder="Seu Nome" ng-model="cliente.email" required/></label>
                                                        <label class="alinha">Endere�o  <input type="text" class="form-control "  placeholder="Seu Nome" ng-model="cliente.endereco" required/></label>
                                                        <label class="alinha">Data de nascimento  <input type="text" class="form-control "  placeholder="Seu Nome" ng-model="cliente.datanascimento" required/></label>
                                                        <label class="alinha">CPF  <input type="text" class="form-control "  placeholder="Seu Nome" ng-model="cliente.cpf" required/></label>
                                                        <form action="controleClientes.jsp">
                                                            <input type="button" value="Alterar" ng-click="alterarCliente(cliente)">
                                                            <input type="submit" value="Excluir" ng-click="excluirCliente(cliente)">
                                                            <input type="submit" value="Cadastrar" ng-click="salvarCliente(cliente)">

                                                        </form>

                                                        <br>
                                                        <br>
                                                        {{mensagemCliente}}
                                                    </div>
                                                    <div class="clearfix"></div>
                                                    <hr class="m-0 mb-2" />
                                                </div>

                                            </div>
                                        </div>

                                    </div>
                                </div>

                            </div>

                        </section>
                        </div>

                        </body>
                        </html> 
