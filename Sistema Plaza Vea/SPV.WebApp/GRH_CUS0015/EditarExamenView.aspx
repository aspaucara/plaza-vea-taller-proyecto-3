<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditarExamenView.aspx.cs" Inherits="SPV.WebApp.EditarExamenView" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="./../css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <script src="./../js/bootstrap.min.js" type="text/javascript"></script>
    <script src="./../js/jquery.js" type="text/javascript"></script>
    <style type="text/css">
        #btnCancelarPregunta, #btnTerminarPregunta{
            float: right;
        }
    </style>
    <script type="text/javascript">
        function ValidarAlternativa() {
            var Alternativa = $("#txtAlternativa").val();
            if(Alternativa == null || Alternativa == ""){
                $("#txtAlternativa").focus();
                return false;
            }
            var Puntaje = $("#txtPuntaje").val();
            if (Puntaje == "" || Puntaje == null) {
                $("#txtPuntaje").val("0");
                $("#txtPuntaje").focus();
                return false;
            }
            if (isNaN(Puntaje)) {
                $("#txtPuntaje").val("0");
                $("#txtPuntaje").focus();
                return false;
            }
        }

        function ValidarPregunta() {
            var Pregunta = $("#txtPregunta").val();
            if(Pregunta == null || Pregunta == ""){
                $("#txtPregunta").focus();
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
</head>
<body>
    <form id="form1" runat="server">
            
    <asp:Panel ID="pnlExamen" runat="server" Visible="true">
        <div class="container" style="width: 600px; float: left; padding-left: 30px; padding-top: 20px;">
        <div class="form-inline">
            <label>Codigo</label>
            <asp:TextBox ID="txtCodigo" runat="server" CssClass="form-control" 
            Enabled="False"></asp:TextBox>
        </div>
        <br />
        <div class="form-group">
            <label>Nombre</label>
            <asp:TextBox ID="txtNombreExamen" runat="server" CssClass="form-control" 
            Enabled="False"></asp:TextBox>
        </div>
        <div class="form-group">
            <label>Descripcion</label>
            <asp:TextBox ID="txtDescripcionExamen" runat="server" CssClass="form-control" 
            Enabled="False"></asp:TextBox>
        </div>
        <div class="form-group">
            <label>Estado</label>
            <asp:DropDownList ID="ddlEstadoExamen" runat="server" CssClass="form-control" 
            Enabled="true">
            </asp:DropDownList>
        </div>
        <div class="form-group">
            <label>Tipo</label>
            <asp:DropDownList ID="ddlTipoExamen" runat="server"  CssClass="form-control" 
            Enabled="true">
            </asp:DropDownList>
        </div>
        <asp:Button ID="btnAgregarPregunta" runat="server" Text="(+) Agregar Pregunta" 
        CssClass="btn btn-default" onclick="btnAgregarPregunta_Click"/>

        <div class="container form-group" style="padding-top: 20px;">
            <asp:Label ID="lblListaPreguntas" runat="server" Text="Preguntas" 
            Font-Size="X-Large"></asp:Label>
            <br />
            <% 
            /*  List<SPV.BE.ExamenPreguntaBE> lPregunta = new List<SPV.BE.ExamenPreguntaBE>();
            lPregunta = new SPV.BL.ExamenPreguntaBL().ListaPregunta(Request.QueryString["id"]);

            Response.Write("<table class='table' id='tblLista'>");
            Response.Write("<thead>");
            Response.Write("<tr>");
            Response.Write("<td> Codigo </td>");
            Response.Write("<td> Pregunta </td>");
            Response.Write("<td> Tipo </td>");
            Response.Write("<td> Estado </td>");
            Response.Write("<td> Editar </td>");
            Response.Write("<td> Eliminar </td>");
            Response.Write("</tr>");
            Response.Write("</thead>");

            Response.Write("<tbody>");
                        
            foreach (SPV.BE.ExamenPreguntaBE oPregunta in lPregunta)
            {

            Response.Write("<tr>");
            Response.Write("<td>" + oPregunta.CodigoPregunta + "</td>");
            Response.Write("<td>" + oPregunta.Pregunta + "</td>");
                            
            if (oPregunta.TipoPregunta == "MUL")
            {
            Response.Write("<td>Multiple</td>");
            }
            else
            {
            Response.Write("<td>Unica</td>");
            }
                            

            if (oPregunta.Pregunta == "ACT")
            {
            Response.Write("<td>Activo</td>");
            }
            else
            {
            Response.Write("<td>Inactivo</td>");
            }

            Response.Write("<td><a href='#'>Editar</a></td>");
            Response.Write("<td><a href='#'>Eliminar</a></td>");
                            
            Response.Write("</tr>");
            }
            Response.Write("</tbody>");
            Response.Write("</table>");
            */
            %>
            <asp:GridView ID="dgvPregunta" runat="server" CssClass="table" 
                AutoGenerateColumns="False" onrowdeleting="dgvPregunta_RowDeleting" 
                onselectedindexchanged="dgvPregunta_SelectedIndexChanged">
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
            <asp:Button ID="btnGuardarExamen" runat="server" Text="Guardar" 
            onclick="btnGuardarExamen_Click" 
            onclientclick="return confirm('¿Esta Seguro?')" CssClass="btn btn-default" />
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
                <asp:TextBox ID="txtCodigoPregunta" runat="server" CssClass="form-control" 
                    Enabled="False"></asp:TextBox>
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
                CssClass="btn btn-default" onclick="btnPnlAlternativa_Click" Visible="false" />

                <asp:Button ID="btnActualizarAlternativa" runat="server" 
                Text="Actualizar" 
                CssClass="btn btn-default" Visible="false" 
                    onclick="btnActualizarAlternativa_Click"/>
            </div>
        </div>
    </asp:Panel>

    <asp:Panel ID="pnlAlternativa" runat="server" Visible="false">
        <div class="panel panel-default" style="width: 550px; height: auto;">
            <div class="panel-heading">
                <asp:Button ID="btnTerminarPregunta" runat="server" Text="X" 
                    onclick="btnTerminarPregunta_Click" 
                    onclientclick="return confirm('Al cerrar esta pestañan estaras guardando la pregunta con su(s) alternativa(s) \n ¿Estas Seguro?')" Visible="false" />
                <asp:Label ID="lblAlternativa" runat="server" Text="Alternativa"></asp:Label>
            </div>
            <div class="panel-body">
                <asp:Label ID="Label6" runat="server" Text="Codigo"></asp:Label>
                <asp:TextBox ID="txtCodigoAlternativa" runat="server" CssClass="form-control" 
                    Enabled="False"></asp:TextBox>
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
                <asp:GridView ID="dgvAlternativa" runat="server" CssClass="table" 
                    AutoGenerateColumns="False" onrowdeleting="dgvAlternativa_RowDeleting">
                    <Columns>
                        <asp:BoundField DataField="CodigoAlternativa" HeaderText="Codigo" />
                        <asp:BoundField DataField="Alternativa" HeaderText="Alternativa" />
                        <asp:BoundField DataField="EsCorrecta" HeaderText="EsCorrecta" />
                        <asp:BoundField DataField="Puntaje" HeaderText="Puntaje" />
                        <asp:BoundField DataField="Estado" HeaderText="Estado" />
                        <asp:CommandField HeaderText="Eliminar" ShowDeleteButton="True" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </asp:Panel>

    </form>
</body>
</html>
