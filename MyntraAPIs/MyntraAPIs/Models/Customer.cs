using System;
using System.Collections.Generic;

namespace MyntraAPIs.Models;

public partial class Customer
{
    public string? Email { get; set; }

    public string? Password { get; set; }

    public string? HouseNo { get; set; }

    public string? StreetName { get; set; }

    public string? City { get; set; }

    public string? State { get; set; }

    public int? Pincode { get; set; }

    public int CustomersId { get; set; }
}
