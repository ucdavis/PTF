using System;
using System.Collections.Generic;
using System.Text;

namespace CAESDO.PTF.Data
{
    public class TransactionScope : IDisposable
    {
        public TransactionScope()
        {
            NHibernateSessionManager.Instance.GetSession();

            NHibernateSessionManager.Instance.BeginTransaction();
        }

        public void RollBackTransaction()
        {
            NHibernateSessionManager.Instance.RollbackTransaction();
        }

        public bool HasOpenTransaction
        {
            get { return NHibernateSessionManager.Instance.HasOpenTransaction(); }
        }

        #region IDisposable Members

        public void Dispose()
        {
            try
            {
                NHibernateSessionManager.Instance.CommitTransaction();
            }
            finally
            {
                //NHibernateSessionManager.Instance.CloseSession();
            }
        }

        #endregion
    }
}
