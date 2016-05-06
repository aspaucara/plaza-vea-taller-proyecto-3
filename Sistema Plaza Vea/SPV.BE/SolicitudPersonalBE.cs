using System;

namespace SPV.BE
{
    public class SolicitudPersonalBE
    {
        public DateTime FechaSolicitud { get; set; }
        public String TipoSolicitud { get; set; }
        public String Estado { get; set; }
        public DateTime FechaMaxAtenderse { get; set; }
    }
}
