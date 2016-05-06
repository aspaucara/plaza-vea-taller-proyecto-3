<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AgregarExamenView.aspx.cs" Inherits="SPV.WebApp.AgregarExamenView" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="./../css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <script src="./../js/bootstrap.min.js" type="text/javascript"></script>
    <script src="./../js/jquery.js" type="text/javascript"></script>
    <script type="text/javascript">


        $(document).ready(function () {
            $("#txtPuntaje, #txtCodigoAlternativa, #txtCodigoPregunta").keypress(function (e) {
                if (e.which >= 48 && e.which <= 57) {
                    return true;

                } else {
                    return false;
                }
            });
        });

        function validarPnlExamen() {
            var nombre = $("#txtNombreExamen").val();
            if(nombre == null || nombre == ""){
                $("#txtNombreExamen").focus();
                return false;
            }
            var descripcion = $("#txtDescripcion").val();
            if (descripcion == null || descripcion == "") {
                $("#txtDescripcion").focus();
                return false;
            }
        }

        function validarPnlPregunta() {
            var Pregunta = $("#txtPregunta").val();
            if(Pregunta == null || Pregunta == ""){
                $("#txtPregunta").focus();
                return false;
            }
            var CodigoPregunta = $("#txtCodigoPregunta").val();

            if (CodigoPregunta == "" || CodigoPregunta == null) {
                $("#txtCodigoPregunta").focus();
                return false;
            }
            if (isNaN(CodigoPregunta)) {
                alert('El codigo de la Pregunta debe ser un numero');
                $("#txtCodigoPregunta").focus();
                return false;
             }
        }

        function validarPnlAlternativa() {
            var Alternativa = $("#txtAlternativa").val();

            if (Alternativa == null || Alternativa == "") {
                $("#txtAlternativa").focus();
                return false;
            }

            var CodigoAlternativa = $("#txtCodigoAlternativa").val();

            if (CodigoAlternativa == "" || CodigoAlternativa == null) {
                $("#txtCodigoAlternativa").focus()
                return false;
            }

            if (isNaN(CodigoAlternativa)) {
                alert("Recuerde el codigo de la alternativa debe ser un numero");
                $("#txtCodigoAlternativa").focus(); ;
                return false;
            }

            var Puntaje = $("#txtPuntaje").val();
            if (isNaN(Puntaje)) {
                alert("El puntaje debe ser numerico");
            }
            if (Puntaje == "" || Puntaje == null) {
                $("#txtPuntaje").focus()
                return false;
            }
         }

    </script>
    <style type="text/css">
        #btnCancelarPregunta, #btnTerminarPregunta{
            float: right;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">

    <asp:Panel ID="pnlExamen" runat="server">
        <div class="panel panel-default"  style="width: 600px;">
            <div class="panel-heading" style= "background-color: Silver;">
                <div class="panel-title" style="text-align: center;">
                    <asp:Label ID="lblTitulo" runat="server" Text="Agregar Examen"></asp:Label>
                </div>
            </div>
            <div class="panel-body">
                <div class="panel-collapse">
                    <asp:Label ID="lblNombre" runat="server" Text="Nombre"></asp:Label>
                    <asp:TextBox ID="txtNombreExamen" runat="server" CssClass="form-control"></asp:TextBox>
                    <br />
                    <asp:Label ID="lblDescripcion" runat="server" Text="Descripcion"></asp:Label>
                    <asp:TextBox ID="txtDescripcion" runat="server" CssClass="form-control"></asp:TextBox>
                    <br />
                    <asp:Label ID="lblTipo" runat="server" Text="Tipo"></asp:Label>
                    <asp:DropDownList ID="ddlTipoExamen" runat="server" CssClass="form-control">
                        <asp:ListItem Value="1">1</asp:ListItem>
                    </asp:DropDownList>
                    <br />
                    <asp:Label ID="Label8" runat="server" Text="Estado"></asp:Label>
                    <asp:DropDownList ID="ddlEstadoExamen" runat="server" CssClass="form-control">
                        <asp:ListItem Value="ACT">Activo</asp:ListItem>
                        <asp:ListItem Value="INA">Inactivo</asp:ListItem>
                    </asp:DropDownList>
                    <br />
                    <div style="text-align: right;">
                        <asp:Button ID="btnAgregar" runat="server" Text="(+) Agregar Pregunta" 
                            CssClass="btn btn-default" onclick="btnAgregar_Click"/>
                        <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" 
                            CssClass="btn btn-default" onclick="btnCancelar_Click"/>
                    </div>
                    <br />
                    <br />
                    <br />
                    <asp:GridView ID="dgvPregunta" runat="server" CssClass="table" 
                    AutoGenerateColumns="False">
                    <Columns>
                        <asp:BoundField DataField="CodigoPregunta" HeaderText="Codigo" />
                        <asp:BoundField DataField="Pregunta" HeaderText="Pregunta" />
                        <asp:BoundField DataField="TipoPregunta" HeaderText="Tipo" />
                        <asp:BoundField DataField="EstadoPregunta" HeaderText="Estado" />
                        <asp:CommandField HeaderText="Editar" SelectText="Editar" 
                        ShowSelectButton="True" />
                        <asp:CommandField HeaderText="Eliminar" ShowDeleteButton="True" />
                    </Columns>
                    </asp:GridView>
                    <br />
                    <div style="text-align: right;">
                        <asp:Button ID="btnAgregarExamen" runat="server" Text="Guardar Examen" 
                            CssClass="btn btn-default" onclick="btnAgregarExamen_Click" />  
                    </div>
                </div>
            </div>
        </div>
    </asp:Panel>

    <asp:Panel ID="pnlPregunta" runat="server" Visible="false">
        <div class="panel panel-default" style="width: 450px; height: auto;">
            <div class="panel-heading">
                     <asp:Button ID="btnCancelarPregunta" runat="server" Text="X" 
                         onclick="btnCancelarPregunta_Click" />
                     <asp:Label ID="Label5" runat="server" Text="Pregunta"></asp:Label>
            </div>
            <div class="panel-body">
                <asp:Label ID="Label1" runat="server" Text="Codigo"></asp:Label>
                <asp:TextBox ID="txtCodigoPregunta" runat="server" CssClass="form-control"></asp:TextBox>
                <br />
                <asp:Label ID="Label2" runat="server" Text="Pregunta"></asp:Label>
                <asp:TextBox ID="txtPregunta" runat="server" CssClass="form-control"></asp:TextBox>
                <br />
                <asp:Label ID="Label3" runat="server" Text="Tipo"></asp:Label>
                <asp:DropDownList ID="ddlTipoPregunta" runat="server" CssClass="form-control">
                <asp:ListItem Value="MUL">Multiple</asp:ListItem>
                <asp:ListItem Value="UNI">Unica</asp:ListItem>
                </asp:DropDownList>
                <br />
                <asp:Label ID="Label4" runat="server" Text="Estado"></asp:Label>
                <asp:DropDownList ID="ddlEstadoPregunta" runat="server" CssClass="form-control" 
                    Enabled="False">
                <asp:ListItem Value="ACT">Activo</asp:ListItem>
                <asp:ListItem Value="INA">Inactivo</asp:ListItem>
                </asp:DropDownList>
                <br />
                 <asp:Button ID="btnPnlAlternativa" runat="server" 
                Text="(+) Agregar" 
                CssClass="btn btn-default" onclick="btnPnlAlternativa_Click" />

            </div>
        </div>
    </asp:Panel>

    <asp:Panel ID="pnlAlternativa" runat="server" Visible="false">
        <div class="panel panel-default" style="width: 550px; height: auto;">
            <div class="panel-heading">
                <asp:Button ID="btnTerminarPregunta" runat="server" Text="X" 
                    
                    onclientclick="return confirm('Al cerrar esta pestañan estaras guardando la pregunta con su(s) alternativa(s) \n ¿Estas Seguro?')" 
                    onclick="btnTerminarPregunta_Click" />
                <asp:Label ID="lblAlternativa" runat="server" Text="Alternativa"></asp:Label>
            </div>
            <div class="panel-body">
                <asp:Label ID="Label6" runat="server" Text="Codigo"></asp:Label>
                <asp:TextBox ID="txtCodigoAlternativa" runat="server" CssClass="form-control"></asp:TextBox>
                <br />
                <asp:Label ID="Label7" runat="server" Text="Alternativa"></asp:Label>
                <asp:TextBox ID="txtAlternativa" runat="server" CssClass="form-control"></asp:TextBox>
                <br />
                <asp:CheckBox ID="cbkCorrecta" runat="server" Text="Alternativa Correcta?" CssClass="checkbox checkbox-inline"/>
                <br />
                <br />
                <asp:Label ID="Label9" runat="server" Text="Puntaje"></asp:Label>
                <asp:TextBox ID="txtPuntaje" runat="server" CssClass="form-control"></asp:TextBox>
                <br />
                <asp:Button ID="btnAgregarAlternativa" runat="server" Text="(+) Agregar" 
                    CssClass="btn btn-default" onclick="btnAgregarAlternativa_Click"/>
                <br />
                <br />
                <br />
                <asp:GridView ID="dgvAlternativa" runat="server" CssClass="table">
                </asp:GridView>
            </div>
        </div>
    </asp:Panel>

    </form>
</body>
</html>
