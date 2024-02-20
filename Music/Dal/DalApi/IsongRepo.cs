using Dal.Do;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dal.DalApi
{
    public interface IsongRepo
    {

        public List<Song> GetAll();
        public Song Add(Song song);
        public Song Update(Song song, int songCode);
        public Song Delete(int code);

    }
}
