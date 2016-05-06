using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SPV.BL;
using SPV.BE;

namespace SPV.WebApp
{
    public partial class EditarExamenView : System.Web.UI.Page
    {
        private Int16 codigo;
        private ExamenPreguntaBL oExamenPreguntaBL = new ExamenPreguntaBL();
        private ExamenBL oExamenBL = new ExamenBL();
        private PreguntaAlternativaBL oPreguntaAlternativaBL = new PreguntaAlternativaBL();

        private ExamenBE oExamen = new ExamenBE();
        private PreguntaAlternativaBE oPreguntaAlternativa = new PreguntaAlternativaBE();
        private ExamenPreguntaBE oExamenPregunta = new ExamenPreguntaBE();
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack == true) {
                return;
            }
            this.CargarDatosDLL();
            this.btnAgregarAlternativa.Attributes.Add("onclick", "javascript: return ValidarAlternativa();");
            this.btnPnlAlternativa.Attributes.Add("onclick", "javascript: return ValidarPregunta();");
            this.btnAgregarAlternativa.Attributes.Add("onclick", "javascript: return validarPnlAlternativa();");
            this.CargarDatos();
            
        }

        private void Obtener() {
            try
            {
               // codigo = Convert.ToInt16(Request.QueryString[0]);
                codigo = Convert.ToInt16(Request.QueryString["id"]);
                if (codigo == 0)
                {
                    Response.Redirect("./ListarExamenView.aspx");
                }
            }
            catch (Exception)
            {
                Response.Redirect("./ListarExamenView.aspx");
            }
        }

        private void CargarDatosDLL()
        {
            ddlEstadoExamen.Items.Add(new ListItem("Activo", "ACT"));
            ddlEstadoExamen.Items.Add(new ListItem("Inactivo", "INA"));
            ddlEstadoExamen.DataBind();

            ddlTipoExamen.Items.Add(new ListItem("1", "1"));
            ddlTipoExamen.DataBind();
        }

        private void CargarDatos() {
            this.Obtener();
            oExamen = new ExamenBE();
            //txtCodigo.Text = this.codigo.ToString();
            oExamen = oExamenBL.BuscarExamen(this.codigo.ToString());
            txtCodigo.Text = oExamen.Codigo.ToString();
            txtNombreExamen.Text = oExamen.Nombre;
            txtDescripcionExamen.Text = oExamen.Descripcion;
            ddlEstadoExamen.SelectedValue = oExamen.Estado;
            ddlTipoExamen.SelectedValue = oExamen.TipoExamen;

            dgvPregunta.DataSource = oExamenPreguntaBL.BuscarListaPregunta(oExamen.Codigo.ToString());
            dgvPregunta.DataBind();
            
        }

        protected void btnGuardarExamen_Click(object sender, EventArgs e)
        {
            for (int i = 0; i < dgvPregunta.Rows.Count; i++ )
            {
                Response.Write(dgvPregunta.Rows[i].Cells[0].Text);
                Response.Write("<br />");
            }
        }

        protected void btnAgregarPregunta_Click(object sender, EventArgs e)
        {
            txtCodigoPregunta.Text = oExamenPreguntaBL.GenerarCodigoPregunta(txtCodigo.Text);
            //txtCodigoAlternativa.Text = (lAlternativa.Count + 1).ToString();
            dgvAlternativa.DataSource = null;
            dgvAlternativa.DataBind();
            btnAgregarAlternativa.Visible = true;
            btnTerminarPregunta.Visible = true;
            btnPnlAlternativa.Visible = true;
            btnActualizarAlternativa.Visible = false;
            pnlExamen.Visible = false;
            pnlAlternativa.Visible = false;
            pnlPregunta.Visible = true;
        }

        protected void dgvPregunta_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            if (oExamenPreguntaBL.EliminarPregunta(txtCodigo.Text, dgvPregunta.Rows[e.RowIndex].Cells[0].Text)){
                Response.Write("Eliminado");
                dgvPregunta.DataSource = oExamenPreguntaBL.BuscarListaPregunta(txtCodigo.Text);
                dgvPregunta.DataBind();
            }
            else {
                Response.Write("Error");
            }
        }

        protected void btnPnlAlternativa_Click(object sender, EventArgs e)
        {
            oExamenPregunta = new ExamenPreguntaBE();
            oExamenPregunta.CodigoPregunta = Convert.ToInt16(txtCodigoPregunta.Text);
            oExamenPregunta.Pregunta = txtPregunta.Text;
            oExamenPregunta.TipoPregunta = ddlTipoPregunta.SelectedValue;
            //oExamenPregunta.TipoPregunta = ddlTipoPregunta.SelectedValue;
            if (oExamenPreguntaBL.AgregarPregunta(txtCodigo.Text, oExamenPregunta) == false){
                return;
            }

            txtCodigoAlternativa.Text = oPreguntaAlternativaBL.GenerarCodigoAlternativa(txtCodigo.Text, txtCodigoPregunta.Text);
            
            pnlExamen.Visible = false;
            pnlPregunta.Visible = false;
            pnlAlternativa.Visible = true;
        }

        protected void btnCancelarPregunta_Click(object sender, EventArgs e)
        {
            txtCodigoPregunta.Text = "";
            txtPregunta.Text = "";
            ddlTipoPregunta.SelectedIndex = 0;
            ddlEstadoPregunta.SelectedIndex = 0;
            pnlPregunta.Visible = false;
            pnlAlternativa.Visible = false;
            pnlExamen.Visible = true;
        }

        protected void btnAgregarAlternativa_Click(object sender, EventArgs e)
        {

            oPreguntaAlternativa = new PreguntaAlternativaBE();
            oPreguntaAlternativa.CodigoAlternativa = Convert.ToInt16(txtCodigoAlternativa.Text);
            oPreguntaAlternativa.EsCorrecta = Convert.ToInt16(cbkCorrecta.Checked);
            oPreguntaAlternativa.Alternativa = txtAlternativa.Text;
            oPreguntaAlternativa.Puntaje = Convert.ToInt16(txtPuntaje.Text);
            if (oPreguntaAlternativaBL.AgregarAlternativa(txtCodigo.Text, txtCodigoPregunta.Text, oPreguntaAlternativa))
            {
                Response.Write("Se Guardo");
            }
            else {
                return;
            }

            txtAlternativa.Text = "";
            cbkCorrecta.Checked = false;
            txtPuntaje.Text = "0";
            txtAlternativa.Focus();
            txtCodigoAlternativa.Text = oPreguntaAlternativaBL.GenerarCodigoAlternativa(txtCodigo.Text, txtCodigoPregunta.Text);

            dgvAlternativa.DataSource = oPreguntaAlternativaBL.BuscarListaAlternativa(txtCodigo.Text, txtCodigoPregunta.Text);
            dgvAlternativa.DataBind();
        }

        protected void btnTerminarPregunta_Click(object sender, EventArgs e)
        {
            dgvPregunta.DataSource = oExamenPreguntaBL.BuscarListaPregunta(txtCodigo.Text);
            dgvPregunta.DataBind();
            pnlExamen.Visible = true;
            pnlAlternativa.Visible = false;
            pnlPregunta.Visible = false;
        }

        protected void btnTerminarActualizarPregunta_Click(object sender, EventArgs e)
        {
        }

        protected void dgvPregunta_SelectedIndexChanged(object sender, EventArgs e)
        {
            //txtCodigoPregunta.Text = oExamenPreguntaBL.ObtenerCodigoPregunta(txtCodigo.Text);
            //txtCodigoAlternativa.Text = (lAlternativa.Count + 1).ToString();
            oExamenPregunta = new ExamenPreguntaBE();
            oExamenPregunta = oExamenPreguntaBL.BuscarPregunta(txtCodigo.Text, dgvPregunta.Rows[dgvPregunta.SelectedIndex].Cells[0].Text);
            txtCodigoPregunta.Text = oExamenPregunta.CodigoPregunta.ToString();
            txtPregunta.Text = oExamenPregunta.Pregunta;
            ddlTipoPregunta.SelectedValue = oExamenPregunta.TipoPregunta;
            ddlEstadoPregunta.SelectedValue = oExamenPregunta.EstadoPregunta;
            //oPreguntaAlternativa = oPreguntaAlternativaBL.

            btnTerminarPregunta.Visible = true;
            btnActualizarAlternativa.Visible = true;
            btnPnlAlternativa.Visible = false;
            pnlExamen.Visible = false;
            pnlAlternativa.Visible = false;
            pnlPregunta.Visible = true;
        }

        protected void btnActualizarAlternativa_Click(object sender, EventArgs e)
        {
            txtCodigoAlternativa.Text = oPreguntaAlternativaBL.GenerarCodigoAlternativa(txtCodigo.Text, txtCodigoPregunta.Text);
            dgvAlternativa.DataSource = oPreguntaAlternativaBL.BuscarListaAlternativa(txtCodigo.Text, txtCodigoPregunta.Text);
            dgvAlternativa.DataBind();
            
            pnlExamen.Visible = false;
            pnlPregunta.Visible = false;
            pnlAlternativa.Visible = true;
        }

        protected void dgvAlternativa_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            if (oPreguntaAlternativaBL.EliminarAlternativa(txtCodigo.Text, txtCodigoPregunta.Text, dgvAlternativa.Rows[e.RowIndex].Cells[0].Text))
            {
                Response.Write("Eliminado");
                dgvAlternativa.DataSource = oPreguntaAlternativaBL.BuscarListaAlternativa(txtCodigo.Text, txtCodigoPregunta.Text);
                dgvAlternativa.DataBind();
            }
            else {
                Response.Write("Error");
            }
        }

    }
}