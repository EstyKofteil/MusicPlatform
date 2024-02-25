using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BL.BlApi
{
    public interface IRepoBl<T>
    {
        public List<T> GetAll();
    }
}
