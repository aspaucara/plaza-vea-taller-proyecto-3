using System;
using System.Collections.Generic;

namespace SPV.BE
{
    public class ExamenBE
    {
        // inio compo
        private Int16 codigo;

        public Int16 Codigo
        {
            get { return codigo; }
            set { codigo = value; }
        }
        private List<ExamenPreguntaBE> listaPregunta;

        public List<ExamenPreguntaBE> ListaPregunta
        {
            get { return listaPregunta; }
            set { listaPregunta = value; }
        }

        /*public ExamenBE(Int16 p_Codigo) {
            this.codigo = p_Codigo;
            listaPregunta = new List<ExamenPreguntaBE>();
        }*/

        public void remove(ExamenPreguntaBE e)
        {
            this.ListaPregunta.Remove(e);
        }
        public void add(ExamenPreguntaBE e)
        {
            this.ListaPregunta.Add(e);
        }
        //fin compo

        //public Int16 Codigo { get; set; }
        public String TipoExamen { get; set; }
        public String Nombre { get; set; }
        public String Descripcion { get; set; }
        public String Estado { get; set; }
        //public List<ExamenPreguntaBE> ListaPregunta { get; set; }
        

    }
}
