using System;
using System.Collections.Generic;

namespace MyntraAPIs.Models;

public partial class Product
{
    public string Pname { get; set; } = null!;

    public string? Category { get; set; }

    public string? SubCategory { get; set; }

    public string Brand { get; set; } = null!;

    public decimal Price { get; set; }

    public string? ProductPicture { get; set; }

    public int ProductId { get; set; }
}
