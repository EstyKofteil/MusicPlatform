using BL.BlApi;
using BL.Bo;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dal;
using Dal.DalApi;
using BL.BlApi;
namespace BL.BlImplementaion
{
    public class SongServiceBl :IsongRepoBl
    {
        IsongRepo songRepo;
        public SongServiceBl(IsongRepo songRepo)
        {
            this.songRepo = songRepo;
        }

        public List<Song> GetSongs()
        {
            List<Song> list = new();
            var data = songRepo.GetAll();
            foreach(var item in data)
            {
                Song song = new Song();
                song.Id = item.Id;
                song.Name = item.Name;
                song.SingerId = item.SingerId;
                song.PublicationDate = item.PublicationDate;
                list.Add(song);
            }
            return list;
        }
        public Song GetPublicationSong()
        {
            DateTime lastDate = DateTime.MinValue;
            var data = songRepo.GetAll();
            Song lastSong = new();
            foreach (var item in data)
            {
                if (item.PublicationDate > lastDate)
                {
                    lastDate = item.PublicationDate;
               
                    lastSong.Id = item.Id;
                    lastSong.Name=item.Name;
                    lastSong.SingerId = item.SingerId;
                    lastSong.PublicationDate = item.PublicationDate;
                }
            }
            return lastSong;
        }
    }
}
