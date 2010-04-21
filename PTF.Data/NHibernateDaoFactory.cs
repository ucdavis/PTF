using CAESDO.PTF.Core.DataInterfaces;
using CAESDO.PTF.Core.Domain;
using System.Collections.Generic;
using NHibernate;
using NHibernate.Expression;
using System.ComponentModel;
using System.Web;

namespace CAESDO.PTF.Data
{
    /// <summary>
    /// Exposes access to NHibernate DAO classes.  Motivation for this DAO
    /// framework can be found at http://www.hibernate.org/328.html.
    /// </summary>
    public class NHibernateDaoFactory : IDaoFactory
    {
        #region Dao Retrieval Operations

        public IGenericDao<T, IdT> GetGenericDao<T, IdT>()
        {
            return new GenericDao<T, IdT>();
        }

        public IConstructDao GetConstructDao()
        {
            return new ConstructDao();
        }

        public IExperimentDao GetExperimentDao()
        {
            return new ExperimentDao();
        }

        #endregion

        #region Inline DAO implementations

        public class GenericDao<T, IdT> : AbstractNHibernateDao<T, IdT>, IGenericDao<T, IdT> { }

        public class ConstructDao : AbstractNHibernateDao<Construct, int>, IConstructDao 
        {
            public List<Construct> GetByOrder(CAESDO.PTF.Core.Domain.Order Order)
            {
                ICriteria criteria = NHibernateSessionManager.Instance.GetSession().CreateCriteria(typeof(Construct))
                    .Add(Expression.Eq("Order", Order));

                return criteria.List<Construct>() as List<Construct>;
            }
        }

        public class ExperimentDao : AbstractNHibernateDao<Experiment, int>, IExperimentDao
        {
            public List<Experiment> GetByConstruct(Construct Construct)
            {
                ICriteria criteria = NHibernateSessionManager.Instance.GetSession().CreateCriteria(typeof(Experiment))
                    .Add(Expression.Eq("Construct", Construct));

                return criteria.List<Experiment>() as List<Experiment>;
   
            }
        }

        #endregion

    }
}
