using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CAESDO.PTF.Core.Domain;
using System.ComponentModel;
using CAESDO.PTF.Data;

namespace CAESDO.PTF.BLL
{
    [DataObject]
    public class NoteBLL : GenericBLL<Note, int>
    {
        [DataObjectMethod(DataObjectMethodType.Insert)]
        public static void Insert(Note newNote)
        {
            newNote.DateNote = DateTime.Now;

            using (var ts = new TransactionScope())
            {
                EnsurePersistent(ref newNote);

                ts.CommittTransaction(); //commit the transaction
            }
        }
    }
}
