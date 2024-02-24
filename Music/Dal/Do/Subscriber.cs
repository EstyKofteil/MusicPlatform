using System;
using System.Collections.Generic;

namespace Dal.Do;

public partial class Subscriber
{
    public int Code { get; set; }

    public string Id { get; set; } = null!;

    public string FirstName { get; set; } = null!;

    public string LastName { get; set; } = null!;
}
