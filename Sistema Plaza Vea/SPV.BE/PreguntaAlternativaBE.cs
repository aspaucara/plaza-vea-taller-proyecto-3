using System;

namespace SPV.BE
{
    public class PreguntaAlternativaBE
    {
        public Int16 CodigoAlternativa { get; set; }
        public String Alternativa { get; set; }
        public Int16 EsCorrecta { get; set; }
        public Int16 Puntaje { get; set; }
        public String Estado { get; set; }
    }
}
