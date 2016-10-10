using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using EMS.Model.Enums;
using EMS.Repository;
using System.Data;

/// <summary>
/// Student is the base class containing the basic attributes and properties.
/// </summary>

namespace EMS.Model
{
    public abstract class Student
    {
       
        #region Properties
        public string Name { get; set; }
        public string EmailID { get; set; }
        public string ContactNo { get; set; }       
        public string StudentNo { get; set; }    
        public GenderType Gender { get; set; }
        public BranchType Branch { get; set; }
        public int Year { get; set; }
        public int CollegeID { get; set; }      
        #endregion        
    }
}
