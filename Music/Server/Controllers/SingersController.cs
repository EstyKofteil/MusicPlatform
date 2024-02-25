using BL.BlApi;
using BL.Bo;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;

namespace Server.Controllers
{
    public class SingersController:BaseController
    {
        ISingerRepoBl singerRepoBl;
        public SingersController(ISingerRepoBl singerRepoBl)
        {
            this.singerRepoBl = singerRepoBl;
        }
        [HttpGet]
        public ActionResult<List<Singer>> GetSingers()
        {
            if (singerRepoBl.GetAll() == null)
                return NotFound();
            return singerRepoBl.GetAll();
        }
    }
}
