using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SPV.BE;
using SPV.BL;

namespace SPV.WebApp
{
    public partial class AgregarExamenView : System.Web.UI.Page
    {
        private ExamenBL oExamenBL = new ExamenBL();
        private ExamenPreguntaBL oExamenPreguntaBL = new ExamenPreguntaBL();
        private PreguntaAlternativaBL oPreguntaAlternativaBL = new PreguntaAlternativaBL();

        private static ExamenBE oExamenBE = new ExamenBE();
        private static ExamenPreguntaBE oExamenPreguntaBE = new ExamenPreguntaBE();
        private PreguntaAlternativaBE oPreguntaAlternativaBE = new PreguntaAlternativaBE();

        private static List<PreguntaAlternativaBE> lAlternativa = new List<PreguntaAlternativaBE>();
        private static List<ExamenPreguntaBE> lPregunta = new List<ExamenPreguntaBE>();

        protected void Page_Load(object sender, EventArgs e)
            {
            if (Page.IsPostBack == true) {
                return;
            }
            oExamenBE = new ExamenBE();
            oExamenPreguntaBE = new ExamenPreguntaBE();
            btnAgregar.Attributes.Add("onclick", "javascript: return validarPnlExamen();");
            btnPnlAlternativa.Attributes.Add("onclick", "javascript: return validarPnlPregunta();");
            btnAgregarAlternativa.Attributes.Add("onclick", "javascript: return validarPnlAlternativa();");
        }

        private void ListarDGVPregunta()
        {
            dgvPregunta.DataSource = lPregunta;
            dgvPregunta.DataBind();
        }

        private void LimpiarPanelPregunta() {
            txtCodigoPregunta.Text = "";
            txtPregunta.Text = "";
            ddlEstadoPregunta.SelectedIndex = 0;
            ddlTipoPregunta.SelectedIndex = 0;
        }

        private void LimpiarPanelAlternativa() {
            txtCodigoAlternativa.Text = "";
            cbkCorrecta.Checked = false;
            txtPuntaje.Text = "";
            txtAlternativa.Text = "";

            dgvAlternativa.DataSource = null;
            dgvAlternativa.DataBind();
        }
       
        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            pnlExamen.Visible = false;
            pnlAlternativa.Visible = false;
            pnlPregunta.Visible = true;
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("./ListarExamenView.aspx");
        }

        protected void btnPnlAlternativa_Click(object sender, EventArgs e)
        {
            pnlExamen.Visible = false;
            pnlPregunta.Visible = false;
            pnlAlternativa.Visible = true;
        }

        protected void btnTerminarPregunta_Click(object sender, EventArgs e)
        {
            oExamenPreguntaBE.CodigoPregunta = Convert.ToInt16(txtCodigoPregunta.Text);
            oExamenPreguntaBE.Pregunta = txtPregunta.Text;
            oExamenPreguntaBE.TipoPregunta = ddlTipoPregunta.SelectedValue;
           // oExamenPreguntaBE.EstadoPregunta = ddlEstadoPregunta.SelectedValue;

         /*   for (int i = 0; i < dgvAlternativa.Rows.Count; i++ ){
                oPreguntaAlternativaBE = new PreguntaAlternativaBE();
                oPreguntaAlternativaBE.CodigoAlternativa = Convert.ToInt16(dgvAlternativa.Rows[i].Cells[0].Text);
                oPreguntaAlternativaBE.Alternativa = dgvAlternativa.Rows[i].Cells[1].Text;
                oPreguntaAlternativaBE.EsCorrecta = Convert.ToInt16(dgvAlternativa.Rows[i].Cells[2].Text);
                //Response.Write(dgvAlternativa.Rows[i].Cells[2].Controls.GetType());
                oPreguntaAlternativaBE.Puntaje = Convert.ToInt16(dgvAlternativa.Rows[i].Cells[3].Text);
                lAlternativa.Add(oPreguntaAlternativaBE);
            }*/
            oExamenPreguntaBE.ListaAlternativa = lAlternativa;

            lPregunta.Add(oExamenPreguntaBE);
            oExamenPreguntaBE = new ExamenPreguntaBE();
            this.ListarDGVPregunta();
            //Response.Write(i);
            this.LimpiarPanelAlternativa();
            this.LimpiarPanelPregunta();
            lAlternativa = new List<PreguntaAlternativaBE>();
            pnlExamen.Visible = true;
            pnlPregunta.Visible = false;
            pnlAlternativa.Visible = false;
        }

        protected void btnCancelarPregunta_Click(object sender, EventArgs e)
        {
            pnlExamen.Visible = true;
            pnlPregunta.Visible = false;
            pnlAlternativa.Visible = false;
        }

        protected void btnAgregarAlternativa_Click(object sender, EventArgs e)
        {
            oPreguntaAlternativaBE = new PreguntaAlternativaBE();
            oPreguntaAlternativaBE.CodigoAlternativa = Convert.ToInt16(txtCodigoAlternativa.Text);
            oPreguntaAlternativaBE.Alternativa = txtAlternativa.Text;
            oPreguntaAlternativaBE.EsCorrecta = Convert.ToInt16(cbkCorrecta.Checked);
            oPreguntaAlternativaBE.Puntaje = Convert.ToInt16(txtPuntaje.Text);
            oPreguntaAlternativaBE.Estado = "ACT";
            lAlternativa.Add(oPreguntaAlternativaBE);

            txtCodigoAlternativa.Text = "";
            txtPuntaje.Text = "0";
            txtAlternativa.Text = "";
            cbkCorrecta.Checked = false;

            dgvAlternativa.DataSource = lAlternativa;
            dgvAlternativa.DataBind();
        }

        protected void btnAgregarExamen_Click(object sender, EventArgs e)
        {
            Boolean ok = false;
            oExamenBE.Nombre = txtNombreExamen.Text;
            oExamenBE.Descripcion = txtDescripcion.Text;
            oExamenBE.Estado = ddlEstadoExamen.SelectedValue;
            oExamenBE.TipoExamen = ddlTipoExamen.SelectedValue;
            oExamenBE.Codigo = Convert.ToInt16(oExamenBL.AgregarExamen(oExamenBE));
            oExamenBE.ListaPregunta = lPregunta;

            foreach (ExamenPreguntaBE oPre in oExamenBE.ListaPregunta)
            {
                oExamenPreguntaBL.AgregarPregunta(oExamenBE.Codigo.ToString(), oPre);
                    foreach(PreguntaAlternativaBE oAlt in oPre.ListaAlternativa){
                       ok =  oPreguntaAlternativaBL.AgregarAlternativa(oExamenBE.Codigo.ToString(), oPre.CodigoPregunta.ToString(), oAlt);
                    }
            }

            if (ok)
            {
                Response.Redirect("./ListarExamenView.aspx");
            }
            else {
                Response.Write("Error");
            }
        }

    }
}