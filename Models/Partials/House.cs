using System;
using System.Collections.Generic;
using System.IO;

namespace HuntingFarm.Models
{
    public partial class House
    {
        public string GetHouseImage
        {
            get
            {
                if (Image is null)
                    return Directory.GetCurrentDirectory() + @"\Images\default.png";
                return Directory.GetCurrentDirectory() + @"\Images\Houses\" + Image.Trim();
            }
        }
    }
}
