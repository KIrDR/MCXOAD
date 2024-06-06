using System;
using System.Data;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.IO;
using Microsoft.SqlServer.Server;

public partial class FileIO
{
    [Microsoft.SqlServer.Server.SqlProcedure]
    public static void WriteDataToFile(SqlString data, SqlString filePath)
    {
        try
        {
            // Проверка наличия данных и пути к файлу
            if (data.IsNull || filePath.IsNull)
            {
                throw new ArgumentException("Data and file path cannot be null.");
            }

            // Преобразование данных в строку и получение пути к файлу
            string dataString = data.Value;
            string path = filePath.Value;

            // Запись данных в файл
            using (StreamWriter writer = new StreamWriter(path, true))
            {
                writer.WriteLine(dataString);
            }
        }
        catch (Exception ex)
        {
            // Обработка ошибок и запись в логи или выброс исключения
            SqlContext.Pipe.Send($"Error: {ex.Message}");
        }
    }
}
