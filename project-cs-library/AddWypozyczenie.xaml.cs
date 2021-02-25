using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace project_cs_library
{
    /// <summary>
    /// Logika interakcji dla klasy AddWypozyczenie.xaml
    /// </summary>
    public partial class AddWypozyczenie : Window
    {
        private bibliotekaEntities context;
        public AddWypozyczenie(bibliotekaEntities context)
        {
            InitializeComponent();
            this.context = context;
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            System.Windows.Data.CollectionViewSource klientViewSource = ((System.Windows.Data.CollectionViewSource)(this.FindResource("klientViewSource")));
            System.Windows.Data.CollectionViewSource ksiazkaViewSource = ((System.Windows.Data.CollectionViewSource)(this.FindResource("ksiazkaViewSource")));
            // Załaduj dane poprzez ustawienie właściwości CollectionViewSource.Source:
            ksiazkaViewSource.Source = GetAvailableBooks();
            klientViewSource.Source = context.klient.ToList();
            newClientGrid.DataContext = new klient();
            mainGrid.DataContext = new wypozyczenie();
        }

        private List<ksiazka> GetAvailableBooks()
        {
            var wypozyczenia = (from wypozyczenie in context.wypozyczenie
                               where wypozyczenie.data_oddania == null
                               select wypozyczenie).ToList();
            var ksiazki = context.ksiazka.ToList();
            foreach (var w in wypozyczenia)
            {
                ksiazki.Remove(w.ksiazka);
            }
            return ksiazki;
        }

        private void ChangeKlientType(object sender, RoutedEventArgs e)
        {
            if ((bool)newClientRadio.IsChecked)
            {
                existingClientGrid.Visibility = Visibility.Hidden;
                newClientGrid.Visibility = Visibility.Visible;
            }
            else
            {
                existingClientGrid.Visibility = Visibility.Visible;
                newClientGrid.Visibility = Visibility.Hidden;
            }
        }

        private void Add(object sender, RoutedEventArgs e)
        {
            klient k;
            if ((bool)newClientRadio.IsChecked)
            {
                k = (klient)newClientGrid.DataContext;
                context.klient.Add(k);
            }
            else
            {
                k = (klient)existingClientCombo.SelectedItem;
            }
            ksiazka book = (ksiazka)ksiazkaCombo.SelectedItem;
            wypozyczenie w = (wypozyczenie)mainGrid.DataContext;
            w.klient_id = k.klient_id;
            w.ksiazka_id = book.ksiazka_id;
            context.wypozyczenie.Add(w);
            context.SaveChanges();
            Close();
        }
    }
}
