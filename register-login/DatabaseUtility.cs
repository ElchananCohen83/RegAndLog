using System;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Configuration;


public static class DatabaseUtility
{
    private static readonly string connectionString = WebConfigurationManager.ConnectionStrings["connectionString"].ConnectionString;

    public static bool InsertUserToDatabase(string firstName, string lastName, string email, string hashedPassword)
    {
        string insertQuery = "INSERT INTO Users (FirstName, LastName, Email, Password) VALUES (@FirstName, @LastName, @Email, @Password)";

        try
        {

            using (var connection = new SqlConnection(connectionString))
            {
                connection.Open();
                using (var cmd = new SqlCommand(insertQuery, connection))
                {
                    cmd.Parameters.AddWithValue("@FirstName", firstName);
                    cmd.Parameters.AddWithValue("@LastName", lastName);
                    cmd.Parameters.AddWithValue("@Email", email);
                    cmd.Parameters.AddWithValue("@Password", hashedPassword);

                    int rowsAffected = cmd.ExecuteNonQuery();

                    return rowsAffected > 0;
                }
            }
        }
        catch (SqlException sqlEx)
        {
            Console.WriteLine($"SQL Error saving user to database: {sqlEx.Message}");
            return false;
        }
        catch (Exception ex)
        {
            Console.WriteLine($"Error saving user to database: {ex.Message}");
            return false;
        }
    }


    public static int ValidateLogin(string email, string password)
    {
        string selectUserDetails = "SELECT Password, Role FROM Users WHERE Email = @Email";

        try
        {
            using (var connection = new SqlConnection(connectionString))
            {
                connection.Open();
                using (var cmd = new SqlCommand(selectUserDetails, connection))
                {
                    cmd.Parameters.AddWithValue("@Email", email);

                    using (var reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            string storedPassword = reader["Password"].ToString();
                            string selectRole = reader["Role"].ToString();

                            // Use BCrypt's Verify method to check if the passwords match
                            bool isAuthenticated = BCrypt.Net.BCrypt.Verify(password, storedPassword);

                            if (isAuthenticated)
                            {
                                HttpContext.Current.Session["UserRole"] = selectRole;

                                Random random = new Random();
                                int key = random.Next(1000, 10001);

                                InsertKeyToDatabase(key, email);

                                return key;
                            }
                        }
                    }

                    // Email not found or authentication failed
                    return 0;
                }
            }
        }
        catch (Exception ex)
        {
            // Log the exception
            Console.WriteLine($"Error validating login: {ex.Message}");
            return 0;
        }
    }


    public static bool InsertKeyToDatabase(int key, string email)
    {
        try
        {
            using (var connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string insertQuery = "INSERT INTO [Keys] ([Key], Email) VALUES (@Key, @Email)";

                using (var cmd = new SqlCommand(insertQuery, connection))
                {
                    cmd.Parameters.AddWithValue("@Key", key);
                    cmd.Parameters.AddWithValue("@Email", email);

                    // Execute the query
                    cmd.ExecuteNonQuery();

                    return true;
                }
            }
        }
        catch (SqlException sqlEx)
        {
            Console.WriteLine($"SQL Error saving key to database: {sqlEx.Message}");
            return false;
        }
        catch (Exception ex)
        {
            Console.WriteLine($"Error saving key to database: {ex.Message}");
            return false;
        }
    }

    public static bool ValidateKeyFromDatabase(int key, string email)
    {
        try
        {
            using (var connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string selectKeyQuery = "SELECT TOP 1 1 FROM [Keys] WHERE Email = @Email AND [Key] = @Key ORDER BY UserID DESC";

                using (var cmd = new SqlCommand(selectKeyQuery, connection))
                {
                    cmd.Parameters.AddWithValue("@Email", email);
                    cmd.Parameters.AddWithValue("@Key", key);

                    var result = cmd.ExecuteScalar();

                    if (result != null)
                    {
                        return true;
                    }
                    return false;
                }
            }
        }
        catch (Exception ex)
        {
            // Log the exception
            Console.WriteLine($"Error getting last key from database: {ex.Message}");
            return false; // Or some default value indicating an error
        }
    }
}
