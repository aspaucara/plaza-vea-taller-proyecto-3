using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using SPV.BL;

namespace SPV.WebApp
{
    public partial class GRH_CUS0015 : System.Web.UI.Page
    {

        ExamenBL oExamenBL = new ExamenBL();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack == true) {
                return;
            }
            this.ListarExamenes();
        }
        private void ListarExamenes() {
            dgvExamen.DataSource = new ExamenBL().ListarExamen();
            dgvExamen.DataBind();
        }

        protected void btnAgregarExamen_Click(object sender, EventArgs e)
        {
            Response.Redirect("./AgregarExamenView.aspx");
        }

        protected void dgvExamen_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridView gv = (GridView)sender;
            int filaSeleccionada = dgvExamen.SelectedIndex;
            String codigo = dgvExamen.Rows[filaSeleccionada].Cells[0].Text;
          //  string columnaSeleccionada = gv.SelectedValue.ToString() ;
            Response.Redirect("./EditarExamenView.aspx?id="+codigo+"");
            
          //  LinkButton lb = gv.Rows[filaSeleccionada].Cells[0].Controls[0] as LinkButton;
        }

        protected void dgvExamen_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            if (oExamenBL.EliminarExamen(dgvExamen.Rows[e.RowIndex].Cells[0].Text) == true)
            {
                Response.Write("El examen fue Eliminado");
                dgvExamen.DataSource = oExamenBL.ListarExamen();
                dgvExamen.DataBind();
            }
            else {
                Response.Write("Error: :V");
            }
        }

    }
}