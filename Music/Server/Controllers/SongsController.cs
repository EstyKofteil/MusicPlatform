using Microsoft.AspNetCore.Mvc;
using BL.BlApi;
using BL.Bo;

namespace Server.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class SongsController : ControllerBase
    {
        IsongRepoBl isongRepoBl;
        public SongsController(IsongRepoBl isongRepoBl)
        {
            this.isongRepoBl = isongRepoBl;
        }
        [HttpGet]
        public ActionResult<List<Song>> Get()
        {
            if (isongRepoBl.GetSongs() == null)
                return NotFound();
            return isongRepoBl.GetSongs();
        }
        [HttpGet("{SongId}")]
        public Song GetPublocationSong(int SongId)
        {
            return isongRepoBl.GetPublicationSong();
        }
    }
}
