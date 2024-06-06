using System;
using Microsoft.SqlServer.Server;
using System.Data.SqlTypes;
using System.IO;

[Serializable]
[SqlUserDefinedType(Format.UserDefined, MaxByteSize = 100)]
public struct PhoneNumber : INullable, IBinarySerialize
{
    private string phoneNumber;

    // Конструктор для создания экземпляра PhoneNumber
    public PhoneNumber(string phoneNumber)
    {
        this.phoneNumber = ValidatePhoneNumber(phoneNumber);
    }

    // Метод для проверки и форматирования телефонного номера
    private static string ValidatePhoneNumber(string phoneNumber)
    {
        // Ваша логика проверки телефонного номера может быть добавлена здесь
        // В данном примере, просто присваиваем без дополнительной проверки
        return phoneNumber;
    }

    // Метод для представления телефонного номера в виде строки
    public override string ToString()
    {
        return phoneNumber;
    }

    // Свойство для проверки наличия значения
    public bool IsNull
    {
        get { return string.IsNullOrEmpty(phoneNumber); }
    }

    // Метод для создания экземпляра PhoneNumber со значением NULL
    public static PhoneNumber Null
    {
        get
        {
            PhoneNumber phone = new PhoneNumber();
            return phone;
        }
    }

    // Метод для преобразования строки в PhoneNumber
    [SqlMethod(OnNullCall = false)]
    public static PhoneNumber Parse(SqlString s)
    {
        if (s.IsNull)
            return Null;

        return new PhoneNumber(s.Value);
    }

    // Метод для сериализации типа
    public void Write(BinaryWriter writer)
    {
        writer.Write(phoneNumber);
    }

    // Метод для десериализации типа
    public void Read(BinaryReader reader)
    {
        phoneNumber = reader.ReadString();
    }
}
