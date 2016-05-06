using System;
using System.Collections.Generic;

namespace SPV.BE
{
    public class ExamenPreguntaBE
    {
        public Int16 CodigoPregunta { get; set; }
        public String Pregunta { get; set; }
        public String TipoPregunta { get; set; }
        public String EstadoPregunta { get; set; }
        public List<PreguntaAlternativaBE> ListaAlternativa { get; set; }

        public void remove(PreguntaAlternativaBE e) {
            this.ListaAlternativa.Remove(e);
        }

        public void add(PreguntaAlternativaBE e) {
            this.ListaAlternativa.Add(e);
        }
    }
}
