<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="DommarcoWeb.Login" %>

<!DOCTYPE>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Dommarco </title>
    <!-- Bootstrap core CSS -->
    <link href="bootstrap-3.2.0-dist/css/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="login_bootsrap/css/animate.css" rel="stylesheet" type="text/css" />
    <!-- Custom styles for this template -->
    <link href="login_bootsrap/css/login.css" rel="stylesheet" type="text/css" />
    <link href="login_bootsrap/css/animate-custom.css" rel="stylesheet" type="text/css" />
    <link rel="icon" type="image/png" href="images/favicon-matanza-icono.ico" />
    <link rel="shortcut icon" type="image/png" href="images/favicon-matanza-icono.ico" />
    <!--[if IE]>
     <style type="text/css">
        /*Clases para el fondo.*/
        html {
        
        filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#000000', endColorstr='#7bc0eb',GradientType=1 ); /* IE6-9 fallback on horizontal gradient */
        }
         .login-logo a {
            -ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=75)";
    filter: progid:DXImageTransform.Microsoft.Alpha(Opacity=75);
        }
        </style>
        <![endif]-->
    <style type="text/css">
        html {
            height: 100%;
            width: 100%;
        }

        .login-form input {
            margin: 0 auto 7px;
            display: block;
            margin: 0 auto 15px;
            width: 97% !important;
            background: #d6d6d6;
            border: 0px solid #FAFFBD;
            color: #6c6c6c;
            padding: 8px;
            /*border-radius: 0px;*/
            font-family: Raleway !important;
        }

        .btn {
            margin-bottom: 14px;
            padding: 4px 16px;
            background-color: #428bca;
            border-color: #357ebd;
            color: #fff;
        }

        input.btn {
            margin-bottom: 14px;
            padding: 4px 16px;
            background-color: #428bca;
            border-color: #357ebd;
            color: #fff;
            width: auto !important;
        }

        input.btn-primary {
            color: #fff;
            background-color: #428bca;
            border-color: #357ebd;
        }

        .login-links a {
            font-family: Lato !important;
            color: #464343;
            font-size: 15px;
        }

            .login-links a:hover {
                text-decoration: none;
                color: #1E5B8E;
            }

        #cambio {
            height ="auto";
        }

        .col-lg-6 {
            width: 42%;
        }

        .mensaje-error {
            text-align: center;
        }

        .concipass {
            text-align: center;
        }




        .login-box {
            max-width: 480px;
            background: #EBF0F4 url(../img/login-bg.png) repeat;
            border: 0px solid rgba(255, 255, 255, 0.31);
            -webkit-background-clip: padding-box;
            -moz-background-clip: padding-box;
            -o-background-clip: padding-box;
            background-clip: padding-box;
            -webkit-border-radius: 15px;
            -moz-border-radius: 15px;
            border-radius: 8px;
            padding-bottom: 20px;
            box-shadow: 0px 0px 1pc #000;
        }

        .input-group-addon:not(:first-child):not(:last-child), .input-group-btn:not(:first-child):not(:last-child), .input-group .form-control:not(:first-child):not(:last-child) {
            border-bottom-left-radius: 0;
            border-top-left-radius: 0;
            border-bottom-right-radius: 4px;
            border-top-right-radius: 4px;
        }

        .input-group-addon:first-child {
            border-right: 0;
            border: 0;
            background: #CCCBCB;
        }


        #botones {
            margin-left: 39px;
        }

        html {
            background: #004682 !important;
        }

        .login-box hr {
            margin: 10px auto 20px;
            width: 70%;
            border-top: 1px solid #C5C5C5;
            border-bottom: 0px solid #B5ABAB;
        }

        .alert {
            margin: 10px auto;
            width: 25%;
            border-radius: 0px;
            font-family: Lato;
            box-shadow: 0px 0px 1pc #000;
        }

        .login-logo a:hover {
            opacity: 0.7;
        }

        .login-logo a {
            opacity: 0.6;
        }

        #lblsist {
            display: inline-block;
            max-width: 100%;
            margin-bottom: 5px;
            font-weight: bold;
            font-family: Lato;
            font-size: 30px;
            padding-left: 47px;
            color:#444343;
        }

        /*#usuaricon
        {
            background:#357ebd;
            height:10px;
            width:10px;
        }*/
    </style>
    <script src="login_bootsrap/js/jquery.min.js" type="text/javascript"></script>
    <script type="text/javascript">        window.jQuery || document.write('<script src="login_bootsrap/js/jquery-1.9.1.min.js" ><\/script>')</script>
    <script src="login_bootsrap/js/jquery-1.9.1.min.js" type="text/javascript" ></script>
    <script src="login_bootsrap/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="login_bootsrap/js/placeholder-shim.min.js" type="text/javascript"></script>
    <script src="Scripts/validador.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            $('[data-toggle="tooltip"]').tooltip()
        })
        $(function () {
            $('[data-toggle="tooltip2"]').tooltip()
        })
    </script>
</head>
<body>
    <!-- start Login box -->
    <form id="login" runat="server">
        <asp:Panel ID="Window1" runat="server" Style="font-size: small">
            <div class="container login-block">
                <div class="row">
                    <div class="col-sm-6 col-md-4 col-sm-offset-3 col-md-offset-4">
                        <div class="login-box clearfix animated flipInX">
                            <div class="login-logo">
                                <a href="#">
                                    <%--<img src="login_bootsrap/img/escudo_catastro.jpg" alt="Company Logo" /></a>--%>
                                    <%--<img src="login_bootsrap/img/escudogris.png" />--%>
                                   <%-- <img src="login_bootsrap/img/EscudoLM2.png" />--%>
                                </a><%--<img src="_style/Escudoefecto9.png" /></a>--%>
                            </div>
                            <div class="text-center">
                                <label id="lblsist" style="font-size: 28px; padding-left:0;">Dommarco Hnos.</label>
                            </div>
                            <hr />
                            <div class="login-form form-horizontal">
                                <%-- <div class="alert alert-error hide">
                                <button type="button" class="close" data-dismiss="alert">
                                    &times;</button>
                                <h4>
                                    Error!</h4>
                                Your Error Message goes here
                            </div>--%>
                                <%--<form action="#" method="get">--%>
                                <div style="margin-bottom: 25px; margin-left: 10px;" class="input-group">
                                    <span class="input-group-addon" style="cursor:pointer" ><i class="glyphicon glyphicon-user" data-toggle="tooltip" data-placement="left" title="Ingrese Usuario"></i></span>
                                    <input id="txtUsername" class="form-control" runat="server" type="text" placeholder="Usuario" />
                                    <asp:RequiredFieldValidator ID="rfvUS_NAME" runat="server" ControlToValidate="txtUsername"
                                        ErrorMessage="Ingrese Usuario" ForeColor="red" ValidationGroup="a">&nbsp</asp:RequiredFieldValidator>
                                </div>
                                <div style="margin-bottom: 25px; margin-left: 10px;" class="input-group">
                                    <span class="input-group-addon" style="cursor:pointer"><i class="glyphicon glyphicon-lock" data-toggle="tooltip2" data-placement="left" title="Ingrese Contraseña"></i></span>
                                    <input id="txtPassword" class="form-control" runat="server" type="password" placeholder="Contraseña" />
                                    <asp:RequiredFieldValidator ID="rfvUS_NAME0" runat="server" ControlToValidate="txtPassword"
                                        ErrorMessage="Ingrese Contraseña" ForeColor="red" ValidationGroup="a">&nbsp</asp:RequiredFieldValidator>
                                </div>

                                <div>
                                    <asp:ValidationSummary ID="ValidationSummary2" runat="server" ForeColor="Red" ShowMessageBox="True"
                                        ShowSummary="False" Style="height: auto" ValidationGroup="a" />
                                </div>
                                <div id="botones" class="fb-login col-lg-3 col-md-12 col-sm-offset-1 animated bounceInLeft">
                                    <asp:Button ID="btnLogin" runat="server" CssClass="btn btn-primary" Text="Aceptar"
                                        OnClick="btnLogin_Click" ValidationGroup="a" OnClientClick="validador.validar();" />
                                </div>
                                <div class="fb-login col-lg-6 col-md-12 animated bounceInRight">
                                    <asp:Button ID="btnCambiarPass" runat="server" CssClass="btn btn-primary" OnClick="btnCambiarPass_Click"
                                        Text="Cambiar Contraseña" />
                                </div>
                                <div class="login-links">
                                    <%--<a href="#">Reporte de Recursos </a>--%>
                                    <asp:LinkButton ID="lnkRepPerf" runat="server" OnClick="lnkRepPerf_Click">Reporte de Perfiles</asp:LinkButton>
                                </div>
                                <%--</form>--%>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </asp:Panel>
        <asp:Panel ID="wnNuevaPass" runat="server" Visible="false" Style="font-size: small">
            <div class="container login-block">
                <div class="row">
                    <div class="col-sm-6 col-md-4 col-sm-offset-3 col-md-offset-4">
                        <div class="login-box clearfix animated flipInX">
                            <div class="login-form">
                                <%--<div class="alert alert-error hide">
                                <button type="button" class="close" data-dismiss="alert">
                                    &times;</button>
                                <h4>
                                    Error!</h4>
                                Your Error Message goes here
                            </div>--%>
                                <%--<form action="#" method="get">--%>
                                <br />

                                <input id="txtNewUsuario" class="form-control" runat="server" type="text" placeholder="Usuario" />
                                <asp:RequiredFieldValidator ID="rfvUS_NAME1" runat="server" ControlToValidate="txtNewUsuario"
                                    ErrorMessage="Ingrese Usuario" ForeColor="red" ValidationGroup="b">&nbsp</asp:RequiredFieldValidator>
                                <input id="txtActual" class="form-control" runat="server" type="password" placeholder="Contraseña" />
                                <asp:RequiredFieldValidator ID="rfvUS_NAME2" runat="server" ControlToValidate="txtActual"
                                    ErrorMessage="Ingrese Contraseña" ForeColor="Black" ValidationGroup="b">&nbsp</asp:RequiredFieldValidator>
                                <input id="txtNewPass" class="form-control" runat="server" type="password" placeholder="Nueva Contraseña" />
                                <asp:RequiredFieldValidator ID="rfvUS_NAME3" runat="server" ControlToValidate="txtNewPass"
                                    ErrorMessage="Ingrese Nueva Contraseña" ForeColor="Black" ValidationGroup="b">&nbsp</asp:RequiredFieldValidator>
                                <input id="txtNewPassConf" class="form-control" runat="server" type="password" placeholder=" Confirmar Nueva Contraseña" />
                                <asp:RequiredFieldValidator ID="rfvUS_NAME4" runat="server" ControlToValidate="txtNewPassConf"
                                    ErrorMessage="Ingrese Confirmación de Nueva Contraseña" ForeColor="Black" ValidationGroup="b">&nbsp</asp:RequiredFieldValidator>
                                <div>
                                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtNewPass"
                                        ControlToValidate="txtNewPassConf" ErrorMessage="Las contraseñas no coinciden"
                                        ForeColor="Black" Style="color: #CC0000" CssClass="concipass">Las contraseñas no coinciden</asp:CompareValidator>
                                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" ShowMessageBox="True"
                                        ShowSummary="False" Style="height: auto" ValidationGroup="b" />
                                </div>
                                <div>
                                    <div class="fb-login col-lg-3 col-md-12 col-sm-offset-2 animated bounceInLeft">
                                        <asp:Button ID="btnAceptarNew" runat="server" CssClass="btn btn-primary" OnClick="btnAceptarNew_Click"
                                            OnClientClick="validador.validar();" Text="Aceptar" ValidationGroup="b" />
                                    </div>
                                    <div class="fb-login col-lg-6 col-md-12 animated bounceInRight">
                                        <asp:Button ID="btnCancelarNew" runat="server" CssClass="btn btn-primary" OnClick="btnCancelarNew_Click"
                                            Text="Cancelar" CausesValidation="False" />
                                    </div>
                                </div>
                                <%-- </form>--%>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </asp:Panel>
        <asp:Panel ID="pnlMensaje" runat="server" CssClass="alert alert-danger mensaje-error"
            Visible="false">
            <asp:Literal ID="ltrMensaje" runat="server" Text="Este es un texto de prueba...."></asp:Literal>
        </asp:Panel>
        <asp:Label ID="lblMessage" runat="server" />
        <!-- End Login box -->
    </form>
    <!--[if IE]>
     <script src="login_bootsrap/js/html5shiv.min.js"></script>
     <script src="login_bootsrap/js/respond.js"></script>
     <script src="login_bootsrap/js/jquery.html5-placeholder-shim.js" type="text/javascript"></script>
            <![endif]-->
    <!-- <script src="./js/custom.js" type="text/javascript"></script>-->
</body>
</html>
