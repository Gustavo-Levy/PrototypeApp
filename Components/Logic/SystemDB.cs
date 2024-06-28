using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.Maui.Controls;
using MySql.Data.MySqlClient;

namespace PrototypeApp.Logic
{
    public class SystemDB
    {

        public MySqlConnection connection;
        public const string Server = "host";
        public const string Port = "3306";
        public const string Database = "equipment_rental_db";
        public const string Uid = "root";
        public const string Password = "password";

        public SystemDB()
        {
            Initialize();
        }

        public void Initialize()
        {

            string connectionString = GetConnectionString();
            connection = new MySqlConnection(connectionString);
            connection.Open();
        }

        public static string GetConnectionString()
        {
                return $"SERVER={Server};PORT={Port};DATABASE={Database};UID={Uid};PASSWORD={Password};";
        }

        public static bool OpenConnection(MySqlConnection connection)
        {
            try
            {
                connection.Open();
                Console.WriteLine("Successfully connected to Database");
                return true;
            }
            catch (MySqlException ex)
            {
                //When handling errors, you can your application's response based 
                //on the error number.
                //The two most common error numbers when connecting are as follows:
                //0: Cannot connect to server.
                //1045: Invalid user name and/or password.
                switch (ex.Number)
                {
                    case 0:
                        Console.WriteLine("Cannot connect to server.  Contact administrator");
                        break;

                    case 1045:
                        Console.WriteLine("Invalid username/password, please try again");
                        break;
                }
                return false;
            }
        }

        public static bool CloseConnection(MySqlConnection connection)
        {
            try
            {
                connection.Close();
                return true;
            }
            catch (MySqlException ex)
            {
                Console.WriteLine(ex.Message);
                return false;
            }
        }

        internal List<Customer> LoadCustomer()
        {
            List<Customer> customerList = new List<Customer>();

            string query = "SELECT * FROM Customer;";

            try
            {
                SystemDB.OpenConnection(connection);
                using (MySqlCommand cmd = new(query, connection))
                {
                    MySqlDataReader reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        int customerId = reader.GetInt32("customer_id");
                        string lastName = reader.GetString("last_name");
                        string firstName = reader.GetString("first_name");
                        string phoneNumber = reader.GetString("contact_phone");
                        string emailAddress = reader.GetString("email");
                        bool banned = reader.GetBoolean("banned");

                        Customer customer = new(customerId, lastName, firstName, phoneNumber, emailAddress, banned);
                        customerList.Add(customer);
                    }
                    reader.Close();
                } 
            }
            catch (MySqlException ex)
            {
                Console.WriteLine("Error while reading data from the database:" + ex.Message);
            }
            finally
            {
                CloseConnection(connection);
            }
            return customerList;
        }

        internal List<Equipment> LoadEquipment()
        {
            List<Equipment> equipmentList = new List<Equipment>();

            string query = "SELECT * FROM Equipment;";

            try
            {
                OpenConnection(connection);
                using (MySqlCommand cmd = new(query, connection))
                {
                    MySqlDataReader reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        int equipmentId = reader.GetInt32("equipment_id");
                        string equipmentName = reader.GetString("equipment_name");
                        string description = reader.GetString("description");
                        double dailyCost = reader.GetDouble("daily_cost");
                        int category = reader.GetInt32("category");

                        Equipment equipment = new Equipment(equipmentId, equipmentName, description, dailyCost, category );
                        equipmentList.Add(equipment);
                    }
                    reader.Close();
                }
            }
            catch (MySqlException ex)
            {
                Console.WriteLine("Error while reading data from the database: " + ex.Message);
            }
            finally
            {
                CloseConnection(connection);
            }
            return equipmentList;
        }

        internal List<Rental> LoadRental()
        {
            List<Rental> rentalList = new List<Rental>();

            string query = "SELECT * FROM Customer;" +
                            "GROUP BY rental_id;";

            try
            {
                OpenConnection(connection);
                using (MySqlCommand cmd = new(query, connection))
                {
                    MySqlDataReader reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        int rentalId = reader.GetInt32("rental_id");
                        int customerId = reader.GetInt32("customer_id");
                        int equipmentId = reader.GetInt32("equipment_id");
                        string lastName = reader.GetString("last_name");
                        DateTime rentalDate = reader.GetDateTime("rental_date");
                        DateTime returnDate = reader.GetDateTime("return_date");
                        double totalCost = reader.GetDouble("total_cost");

                        Rental rental = new Rental(rentalId, customerId, equipmentId, lastName, rentalDate, returnDate, totalCost);
                        rentalList.Add(rental);
                    }
                    reader.Close();
                }
            }
            catch (MySqlException ex)
            {
                Console.WriteLine("Error while reading data from the database: " + ex.Message);
            }
            finally
            {
                CloseConnection(connection);
            }
            return rentalList;
        }

        public void AddEquipmentToDB(int equipment_id, int category_id, string equipment_name, string description, double daily_cost)
        {
            string query = "INSERT INTO Equipment (equipment_id, category_id, equipment_name, description, daily_cost) " +
                           "VALUES (@equipment_id, @category_id, @equipment_name, @description, @daily_cost)";

            try
            {
                SystemDB.OpenConnection(connection);

                using (MySqlCommand cmd = new MySqlCommand(query, connection))
                {
                    // Add parameters
                    cmd.Parameters.AddWithValue("@equipment_id", equipment_id);
                    cmd.Parameters.AddWithValue("@category_id", category_id);
                    cmd.Parameters.AddWithValue("@equipment_name", equipment_name);
                    cmd.Parameters.AddWithValue("@description", description);
                    cmd.Parameters.AddWithValue("@daily_cost", daily_cost);

                    // Execute command
                    cmd.ExecuteNonQuery();
                }
            }
            catch (MySqlException ex)
            {
                Console.WriteLine("Error when writing to table: " + ex.Message);
            }
            finally
            {
                CloseConnection(connection);
            }
        }

        public void RemoveUsedEquipment(int equipmentId)
        {
            string query = "DELETE FROM Equipment WHERE equipment_id = @equipment_id";

            try
            {
                SystemDB.OpenConnection(connection);

                using (MySqlCommand cmd = new MySqlCommand(query, connection))
                {
                    // Add parameters
                    cmd.Parameters.AddWithValue("@equipment_id", equipmentId);

                    // Execute command
                    cmd.ExecuteNonQuery();
                }
            }
            catch (MySqlException ex)
            {
                Console.WriteLine("Error when removing equipment: " + ex.Message);
            }
            finally
            {
                SystemDB.CloseConnection(connection);
            }
        }
        internal Equipment SearchEquipment(int equipmentId)
        {
            string query = "SELECT * FROM Equipment WHERE equipment_id = @equipment_id";

            try
            {
                OpenConnection(connection);
                using (MySqlCommand cmd = new MySqlCommand(query, connection))
                {
                    cmd.Parameters.AddWithValue("@equipment_id", equipmentId);

                    using (MySqlDataReader reader = cmd.ExecuteReader())
                    {
                        string description = Convert.ToString(reader["description"]);
                        int categoryId = Convert.ToInt32(reader["category_id"]);

                        if (reader.Read())
                        {
                            return new Equipment(
                            Convert.ToInt32(reader[0]),
                            Convert.ToString(reader[1]),
                            Convert.ToString(reader[2]),
                            Convert.ToDouble(reader[3]),
                            Convert.ToInt32(reader[4])
                            );
                        }
                        else
                        {
                            Console.WriteLine("Equipment with ID {0} not found.", equipmentId);
                            return null;
                        }
                    }
                }
            }

            catch (MySqlException ex)
            {
                Console.WriteLine("Error when searching for equipment: " + ex.Message);
                return null;
            }
            finally
            {
                CloseConnection(connection);
            }
        }
        public void UpdateCustomerInfo(int customerId, string lastName, string firstName, string contactPhone, string email)
        {
            string query = "UPDATE Customer SET last_name = @last_name, first_name = @first_name, contact_phone = @contact_phone, email = @email WHERE customer_id = @customer_id";

            try
            {
                SystemDB.OpenConnection(connection);

                using (MySqlCommand cmd = new MySqlCommand(query, connection))
                {
                    // Add parameters
                    cmd.Parameters.AddWithValue("@customer_id", customerId);
                    cmd.Parameters.AddWithValue("@last_name", lastName);
                    cmd.Parameters.AddWithValue("@first_name", firstName);
                    cmd.Parameters.AddWithValue("@contact_phone", contactPhone);
                    cmd.Parameters.AddWithValue("@email", email);

                    // Execute command
                    cmd.ExecuteNonQuery();
                }
            }
            catch (MySqlException ex)
            {
                Console.WriteLine("Error when updating customer info: " + ex.Message);
            }
            finally
            {
                SystemDB.CloseConnection(connection);
            }
        }
        public void CreateNewCustomer( string lastName, string firstName, string contactPhone, string email)
        {
            string query = "INSERT INTO Customer (customer_id, last_name, first_name, contact_phone, email) " +
                           "VALUES (@customer_id, @last_name, @first_name, @contact_phone, @email)";

            try
            {
                OpenConnection(connection);

                int customerId = CustomerBroker.GetNewCustomerId();
                using (MySqlCommand cmd = new MySqlCommand(query, connection))
                {
                    // Add parameters
                    cmd.Parameters.AddWithValue("@customer_id", customerId);
                    cmd.Parameters.AddWithValue("@last_name", lastName);
                    cmd.Parameters.AddWithValue("@first_name", firstName);
                    cmd.Parameters.AddWithValue("@contact_phone", contactPhone);
                    cmd.Parameters.AddWithValue("@email", email);

                    // Execute command
                    cmd.ExecuteNonQuery();
                }
            }
            catch (MySqlException ex)
            {
                Console.WriteLine("Error when creating new customer: " + ex.Message);
            }
            finally
            {
                CloseConnection(connection);
            }
        }

        internal Customer SearchCustomer(int customerId)
        {
            string query = "SELECT * FROM Customer WHERE customer_id = @customer_id";

            try
            {
                OpenConnection(connection);

                
                using (MySqlCommand cmd = new MySqlCommand(query, connection))
                {
                    cmd.Parameters.AddWithValue("@customer_id", customerId);
                        using (MySqlDataReader reader = cmd.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                return new Customer(
                                    Convert.ToInt32(reader["customer_id"]),
                                    reader.IsDBNull(reader.GetOrdinal("last_name")) ? string.Empty : reader.GetString(reader.GetOrdinal("last_name")),
                                    reader.IsDBNull(reader.GetOrdinal("first_name")) ? string.Empty : reader.GetString(reader.GetOrdinal("first_name")),
                                    reader.IsDBNull(reader.GetOrdinal("contact_phone")) ? string.Empty : reader.GetString(reader.GetOrdinal("contact_phone")),
                                    reader.IsDBNull(reader.GetOrdinal("email")) ? string.Empty : reader.GetString(reader.GetOrdinal("email")),
                                    Convert.ToBoolean(reader["banned"])
                                );
                        }
                            else
                            {
                                Console.WriteLine($"Customer with ID {customerId} not found");
                                return null;
                            }
                        }
                    }

            }
            catch (MySqlException ex)
            {
                Console.WriteLine("Error when searching for customer: " + ex.Message);
                return null;
            }
        }

        internal Rental SearchRental(int rentalId)
        {
            string query = "SELECT * FROM Rental WHERE rental_id = @rental_id";

            try
            {
                OpenConnection(connection);

                using (MySqlCommand cmd = new MySqlCommand(query, connection))
                {
                    // Add parameter
                    cmd.Parameters.AddWithValue("@rental_id", rentalId);

                    // Execute reader
                    using (MySqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            return new Rental(
                                Convert.ToInt32(reader[0]),
                                Convert.ToInt32(reader[1]),
                                Convert.ToInt32(reader[2]),
                                Convert.ToString(reader[3]),
                                Convert.ToDateTime(reader[4]),
                                Convert.ToDateTime(reader[5]),
                                Convert.ToDouble(reader[6])
                            );
                        }
                        else
                        {
                            Console.WriteLine("Rental with ID {0} not found.", rentalId);
                            return null;
                        }
                    }
                }
            }
            catch (MySqlException ex)
            {
                Console.WriteLine("Error when searching for rental: " + ex.Message);
                return null;
            }
            finally
            {
                CloseConnection(connection);
            }
        }
        internal Rental CreateNewRental( int rentalId, int customerId, int equipmentId, string lastName, DateTime rentalDate, DateTime returnDate, double totalCost)
        {
            Console.WriteLine("Enter customer Id: ");
            int id = int.Parse(Console.ReadLine());
            Customer customer = SearchCustomer(id);
            if (customer == null)
            {
                return null;
            }


            try
            {
                OpenConnection(connection);

                string query = "INSERT INTO Rental (rental_id, customer_id, equipment_id, last_name, rental_date, return_date, total_cost) " +
                           "VALUES (@rental_id, @customer_id, @equipment_id, @last_name, @rental_date, @return_date, @total_cost); SELECT LAST_INSERT_ID();";


                using (MySqlCommand cmd = new MySqlCommand(query, connection))
                {
                    int rentId = Convert.ToInt32(cmd.ExecuteScalar());
                    rentId = rentalId;
                    

                    cmd.Parameters.AddWithValue("rental_id", rentalId);
                    cmd.Parameters.AddWithValue("@customer_id", customerId);
                    cmd.Parameters.AddWithValue("@equipment_id", equipmentId);
                    cmd.Parameters.AddWithValue("@last_name", customer.LastName);
                    cmd.Parameters.AddWithValue("@rental_date", rentalDate);
                    cmd.Parameters.AddWithValue("@return_date", returnDate);
                    cmd.Parameters.AddWithValue("@total_cost", totalCost);

                    Console.WriteLine("New rental created successfully. Rental ID: " + rentalId);
                    return new Rental(rentalId, id, equipmentId, customer.LastName, rentalDate, returnDate, totalCost);
                }
            }
            catch (MySqlException ex)
            {
                Console.WriteLine("Error when creating new rental: " + ex.Message);
                return null; 
            }
            finally
            {
                CloseConnection(connection);
            }
        }

        public void GenerateSalesByDateReport(DateTime startDate, DateTime endDate)
        {
            string query = "SELECT rental_date, SUM(total_cost) AS total_sales FROM Rental WHERE rental_date BETWEEN @start_date AND @end_date GROUP BY rental_date";

            try
            {
                OpenConnection(connection);

                using (MySqlCommand cmd = new MySqlCommand(query, connection))
                {
                    // Add parameters
                    cmd.Parameters.AddWithValue("@start_date", startDate);
                    cmd.Parameters.AddWithValue("@end_date", endDate);

                    // Execute reader
                    using (MySqlDataReader reader = cmd.ExecuteReader())
                    {
                        Console.WriteLine("Sales by Date Report:");
                        while (reader.Read())
                        {
                            Console.WriteLine("Date: {0}, Total Sales: {1}",
                                reader["rental_date"], reader["total_sales"]);
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
                CloseConnection(connection);
            }
        }

        public void GenerateSalesByCustomerReport()
        {
            string query = "SELECT c.customer_id, CONCAT(c.first_name, ' ', c.last_name) AS customer_name, SUM(r.total_cost) AS total_sales " +
                           "FROM Rental r " +
                           "JOIN Customer c ON r.customer_id = c.customer_id " +
                           "GROUP BY c.customer_id, customer_name";

            try
            {
                OpenConnection(connection);

                using (MySqlCommand cmd = new MySqlCommand(query, connection))
                {
                    // Execute reader
                    using (MySqlDataReader reader = cmd.ExecuteReader())
                    {
                        Console.WriteLine("Sales by Customer Report:");
                        while (reader.Read())
                        {
                            Console.WriteLine("Customer ID: {0}, Customer Name: {1}, Total Sales: {2}",
                                reader["customer_id"], reader["customer_name"], reader["total_sales"]);
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
                CloseConnection(connection);
            }
        }

        public void ListItemsByCategory()
        {
            string query = "SELECT c.description AS category, e.equipment_name " +
                           "FROM Equipment e " +
                           "JOIN Category c ON e.category_id = c.category_id " +
                           "ORDER BY c.description, e.equipment_name";

            try
            {
                OpenConnection(connection);

                using (MySqlCommand cmd = new MySqlCommand(query, connection))
                {
                    // Execute reader
                    using (MySqlDataReader reader = cmd.ExecuteReader())
                    {
                        Console.WriteLine("List of Items by Category:");
                        while (reader.Read())
                        {
                            Console.WriteLine("Category: {0}, Equipment Name: {1}",
                                reader["category"], reader["equipment_name"]);
                        }
                    }
                }
            }
            catch (MySqlException ex)
            {
                Console.WriteLine("Error when listing items by category: " + ex.Message);
            }
            finally
            {
                CloseConnection(connection);
            }
        }

    }
}

