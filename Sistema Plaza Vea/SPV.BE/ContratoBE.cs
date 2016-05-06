using System;

namespace SPV.BE
{
    public class ContratoBE
    {
        public DateTime InicioContrato { get; set; }
        public DateTime FinContrato { get; set; }
        public String TiempoContrato { get; set; }
        public String TipoContrato { get; set; }
        public DateTime FechaFirmaContrato { get; set; }
        public Double SueldoBase { get; set; }
        public String EstadoContrato { get; set; }
    }
}
