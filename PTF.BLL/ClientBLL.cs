using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Security;
using System.ComponentModel;

namespace CAESDO.PTF.BLL
{
    [DataObject]
    public class ClientBLL
    {
        [DataObjectMethod(DataObjectMethodType.Select)]
        public static MembershipUserCollection GetAll()
        {
            return Membership.GetAllUsers();
        }
    }
}
