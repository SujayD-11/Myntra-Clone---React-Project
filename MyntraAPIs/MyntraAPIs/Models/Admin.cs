﻿using System;
using System.Collections.Generic;

namespace MyntraAPIs.Models;

public partial class Admin
{
    public int AdminId { get; set; }

    public string? Username { get; set; }

    public string? Password { get; set; }
}
