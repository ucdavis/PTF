using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CAESDO.PTF.Core.Domain
{
    public class User : DomainObject<User, int>
    {
        public virtual IList<Login> LoginIDs { get; set; }
        public virtual IList<Unit> Units { get; set; }
        public virtual string FirstName { get; set; }
        public virtual string LastName { get; set; }
        public virtual string EmployeeID { get; set; }
        public virtual string StudentID { get; set; }
        public virtual string SID { get; set; }
        public virtual Guid UserKey { get; set; }
        public virtual bool Inactive { get; set; }

        public static List<string> FindUCDKerberosIDs(string NameToMatch)
        {
            throw new System.NotImplementedException();
        }

        public User()
        {

        }
    }

    public class Login : DomainObject<Login, string>
    {
        public virtual User User { get; set; }

        public Login()
        {

        }
    }

    public class Unit : DomainObject<Unit, string>
    {
        public virtual string ShortName { get; set; }
        public virtual string FullName { get; set; }
        public virtual string PPSCode { get; set; }
        public virtual string FISCode { get; set; }
        public virtual int UnitID { get; set; }

        public Unit()
        {

        }
    }
}
