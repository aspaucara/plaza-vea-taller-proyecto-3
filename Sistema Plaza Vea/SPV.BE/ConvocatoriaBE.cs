using System;

namespace SPV.BE
{
    public class ConvocatoriaBE
    {
        public String NombreConvocatoria { get; set; }
        public DateTime FechaInicio { get; set; }
        public DateTime FechaFin { get; set; }
        public String Estado { get; set; }
        public String FechaMaxRecepcionCV { get; set; }
        public DateTime FechaPublicacionConvocatoria { get; set; }
        public String ListaDocumentosContrato { get; set; }
    }
}
