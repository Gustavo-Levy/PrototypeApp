namespace PrototypeApp.Logic
{
    internal class Customer
    {
        public int CustomerId { get; set; }
        public string LastName { get; set; }
        public string FirstName { get; set; }
        public string PhoneNumber { get; set; }
        public string EmailAddress { get; set; }
        public bool Banned { get; set; }
        internal Customer(int customerId, string lastName, string firstName, string phoneNumber, string emailAddress, bool banned)
        {
            CustomerId = customerId;
            LastName = lastName;
            FirstName = firstName;
            PhoneNumber = phoneNumber;
            EmailAddress = emailAddress;
            Banned = banned;
        }

        public override string ToString()
        {
            return $"{CustomerId}, {LastName}, {FirstName}, {PhoneNumber}, {EmailAddress}";
        }
    }
}