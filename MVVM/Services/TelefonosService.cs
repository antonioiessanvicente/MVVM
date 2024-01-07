using MVVM_DEMO.Model;

namespace MVVM_DEMO.Services
{
    public class TelefonosService
    {
        private Telefono tado;
    
        static public void TelefonosServiceInsertar(Telefono t)
        {
            using (TelefonosADO tado = new TelefonosADO())
            {
                tado.Insertar(t);
            }
        }

    }
}
