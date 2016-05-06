<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ListarExamenView.aspx.cs" Debug="true" Inherits="SPV.WebApp.GRH_CUS0015" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="./../css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <script src="./../js/bootstrap.min.js" type="text/javascript"></script>
    <script src="./../js/jquery.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            //alert("we're here!!");
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div style="padding-top: 20px;" class="form-group">
                <asp:Label ID="lblLista" runat="server" Text="Lista de Examenes" 
                    Font-Size="Large"></asp:Label>
            </div>
            <div style="padding-top: 20px;" class="form-group">
                <asp:Button ID="btnAgregarExamen" runat="server" Text="(+) AgregarExamen" 
                    CssClass="btn btn-default" onclick="btnAgregarExamen_Click" />
            </div>
            <div style="padding-top: 20px;" class="form-group">
                <asp:GridView ID="dgvExamen" runat="server" AutoGenerateColumns="False" 
                    CssClass="table" onselectedindexchanged="dgvExamen_SelectedIndexChanged" 
                    onrowdeleting="dgvExamen_RowDeleting">
                    <Columns>
                        <asp:BoundField HeaderText="Código" DataField="Codigo" />
                        <asp:BoundField HeaderText="Examen" DataField="Nombre" />
                        <asp:BoundField HeaderText="Descripción" DataField="Descripcion" />
                        <asp:BoundField HeaderText="Tipo" DataField="TipoExamen" />
                        <asp:BoundField HeaderText="Estado" DataField="Estado" />
                        <asp:CommandField HeaderText="Editar" InsertText="Editar" SelectText="Editar" 
                            ShowSelectButton="True" />
                        <asp:TemplateField HeaderText="Eliminar" ShowHeader="False">
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                                    CommandName="Delete" Text="Eliminar" OnClientClick="return confirm('Esta seguro de Eliminar')"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </form>
</body>
</html>
