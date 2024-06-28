using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MySql.Data.MySqlClient;

namespace PrototypeApp.Logic
{
    internal class EquipmentBroker: SystemDB
    {
        private readonly MySqlConnection? connection;

        SystemDB systemDB;

        public List<Equipment> equipmentList;

        public EquipmentBroker(SystemDB systemDB)
        {
            this.systemDB = systemDB;
            this.systemDB.Initialize();
            equipmentList = new List<Equipment>();
        }

        public Equipment AddEquipment(int equipmentId, string name, string description, double dailyCost, int categoryId)
        {
            Equipment newEquipment = new(equipmentId, name, description, dailyCost, categoryId);

            systemDB.AddEquipmentToDB(equipmentId, categoryId, name, description, dailyCost);
            return newEquipment;
        }

        public void SellEquipment(int equipmentId)
        {
          systemDB.RemoveUsedEquipment(equipmentId);
        }

        public void EquipmentToParts(int equipmentId)
        {

        }

        public Equipment SearchEquipment(int equipmentId)
        {
            return systemDB.SearchEquipment(equipmentId);
        }

        public List<Equipment> GetAllEquipments()
        {
            List<Equipment> equipments = new List<Equipment>();

            string query = "SELECT * FROM Equipment";

            try
            {
                SystemDB.OpenConnection(systemDB.connection);

                using (MySqlCommand cmd = new MySqlCommand(query, systemDB.connection))
                {
                    // Execute reader
                    using (MySqlDataReader reader = cmd.ExecuteReader())
                    {
                        while(reader.Read())
                        {
                            int equipmentId =
                                Convert.ToInt32(reader["equipment_id"]);

                            string name = 
                                reader.IsDBNull(reader.GetOrdinal("name")) ? string.Empty : 
                                    reader.GetString(reader.GetOrdinal("name"));

                            string description = 
                                reader.IsDBNull(reader.GetOrdinal("description")) ? string.Empty : 
                                    reader.GetString(reader.GetOrdinal("description"));

                            double dailyCost = 
                                Convert.ToDouble(reader["daily_cost"]);

                            int categoryId = 
                                reader.IsDBNull(reader.GetOrdinal("category_id")) ? 0 : 
                                    Convert.ToInt32(reader["category_id"]);                            

                            Equipment equipment = new(equipmentId, name, description, dailyCost, categoryId);
                            equipments.Add(equipment);
                        }
                    }
                }
            }
            catch (MySqlException ex)
            {
                Console.WriteLine("Error when getting all equipments: " + ex.Message);
            }
            finally
            {
                SystemDB.CloseConnection(systemDB.connection);
            }
            return equipments;
        }
    }
}

