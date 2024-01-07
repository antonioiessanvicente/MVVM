using MVVM_DEMO.Model;
using MVVM_DEMO.ViewModel.Base;
using MVVM_DEMO.Services;

namespace MVVM_DEMO.ViewModel
{
    public class TelefonosViewModel : BaseViewModel
    {
        private string ntelefono;
        private string nombre;
        private string direccion;
        private string observaciones;

        public RelayCommand GuardarCommand => new RelayCommand(execute=>PerformSaveTelefonos(), canExecute=>CanExecuteSaveTelefonos());
        public TelefonosViewModel()
        {
        
        }
        public string Ntelefono
        {
            get { return ntelefono; }
            set { ntelefono = value; OnPropertyChanged(); }
        }
        public string Nombre
        {
            get { return nombre; }
            set { nombre = value; OnPropertyChanged(); }
        }
        public string Direccion
        {
            get { return direccion; }
            set { direccion = value; OnPropertyChanged(); }
        }
        public string Observaciones
        {
            get { return observaciones; }
            set { observaciones = value; OnPropertyChanged(); }
        }
        private bool CanExecuteSaveTelefonos()
        {
            return !string.IsNullOrEmpty(Ntelefono);
        }
        private void PerformSaveTelefonos() =>
           TelefonosService.TelefonosServiceInsertar(new Telefono(ntelefono, nombre, direccion, observaciones));    
    }
}
