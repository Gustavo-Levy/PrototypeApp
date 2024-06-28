using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MySql.Data.MySqlClient;

namespace PrototypeApp.Logic
{
    internal class RentalItemBroker
    {
        private MySqlConnection connection;

        public RentalItemBroker()
        {
            Initialize();
        }

        private void Initialize()
        {
            string connectionString = GetConnectionString();
            connection = new MySqlConnection(connectionString);
        }

        private string GetConnectionString()
        {
            // Define your connection string here
            return "your_connection_string";
        }

        private bool OpenConnection()
        {
            try
            {
                connection.Open();
                Console.WriteLine("Successfully connected to Database");
                return true;
            }
            catch (MySqlException ex)
            {
                // Handle connection errors
                Console.WriteLine("Error: " + ex.Message);
                return false;
            }
        }

        private bool CloseConnection()
        {
            try
            {
                connection.Close();
                return true;
            }
            catch (MySqlException ex)
            {
                Console.WriteLine("Error: " + ex.Message);
                return false;
            }
        }

        public Dictionary<DateTime, double> ReportSalesByDate(DateTime date)
        {
            Dictionary<DateTime, double> salesByDate = new Dictionary<DateTime, double>();

            string query = "SELECT rental_date, SUM(total) AS total_sales FROM RentalItem WHERE rental_date = @rental_date GROUP BY rental_date";

            try
            {
                OpenConnection();

                using (MySqlCommand cmd = new MySqlCommand(query, connection))
                {
                    // Add parameter
                    cmd.Parameters.AddWithValue("@rental_date", date);

                    // Execute reader
                    using (MySqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            salesByDate.Add(Convert.ToDateTime(reader["rental_date"]), Convert.ToDouble(reader["total_sales"]));
                        }
                    }
                }
            }
            catch (MySqlException ex)
            {
                Console.WriteLine("Error when generating sales by date report: " + ex.Message);
            }
            finally
            {
                CloseConnection();
            }

            return salesByDate;
        }

        public Dictionary<int, double> ReportSalesByCustomer(int customerId)
        {
            Dictionary<int, double> salesByCustomer = new Dictionary<int, double>();

            string query = "SELECT customer_id, SUM(total) AS total_sales FROM RentalItem WHERE customer_id = @customer_id GROUP BY customer_id";

            try
            {
                OpenConnection();

                using (MySqlCommand cmd = new MySqlCommand(query, connection))
                {
                    // Add parameter
                    cmd.Parameters.AddWithValue("@customer_id", customerId);

                    // Execute reader
                    using (MySqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            salesByCustomer.Add(Convert.ToInt32(reader["customer_id"]), Convert.ToDouble(reader["total_sales"]));
                        }
                    }
                }
            }
            catch (MySqlException ex)
            {
                Console.WriteLine("Error when generating sales by customer report: " + ex.Message);
            }
            finally
            {
                CloseConnection();
            }

            return salesByCustomer;
        }

        public List<RentalItem> ReportItemsByCategory(string category)
        {
            List<RentalItem> itemsByCategory = new List<RentalItem>();

            string query = "SELECT * FROM RentalItem WHERE category = @category";

            try
            {
                OpenConnection();

                using (MySqlCommand cmd = new MySqlCommand(query, connection))
                {
                    // Add parameter
                    cmd.Parameters.AddWithValue("@category", category);

                    // Execute reader
                    using (MySqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            RentalItem item = new RentalItem(
                                Convert.ToInt32(reader["equipment_id"]),
                                Convert.ToDateTime(reader["rental_date"]),
                                Convert.ToDateTime(reader["return_date"]),
                                Convert.ToDouble(reader["total"])
                            );
                            itemsByCategory.Add(item);
                        }
                    }
                }
            }
            catch (MySqlException ex)
            {
                Console.WriteLine("Error when generating items by category report: " + ex.Message);
            }
            finally
            {
                CloseConnection();
            }

            return itemsByCategory;
        }
    }
}

