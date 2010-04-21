using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CAESDO.PTF.Core.Domain;
using CAESDO.PTF.Data;

namespace CAESDO.PTF.BLL
{
    public class UserProfileBLL : GenericBLL<UserProfile, int>
    {
        public static void CreateProfile(Guid userID)
        {
            UserProfile up = new UserProfile()
            {
                UserID = userID
            };

            using (var ts = new TransactionScope())
            {
                EnsurePersistent(ref up);

                ts.CommittTransaction(); //commit the transaction
            }
        }

        public static void Update(UserProfile profile)
        {
            using (var ts = new TransactionScope())
            {
                EnsurePersistent(ref profile);

                ts.CommittTransaction();
            }
        }

        public static UserProfile GetByUserID(Guid userID)
        {
            var up = new UserProfile();
            up.UserID = userID;

            List<UserProfile> profiles = UserProfileBLL.GetByInclusionExample(up, "UserID");

            if (profiles.Count > 0)
            {
                return profiles[0];
            }
            else
            {
                throw new Exception("Profile not found.");
            }
        }
    }
}
