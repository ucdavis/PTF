﻿using System;
using System.Collections.Generic;
using System.Text;
using CAESDO.CASH.Core.DataInterfaces;
using CAESDO.CASH.Core.Domain;
using CAESDO.CASH.Data;
using System.ComponentModel;

namespace CAESDO.PTF.BLL
{
    [DataObject]
    public class GenericBLL<T, IdT>
    {
        public static IDaoFactory daoFactory
        {
            get
            {
                return new CAESDO.CASH.Data.NHibernateDaoFactory();
            }
        }

        public GenericBLL()
        {

        }

        public static T GetByID(IdT id)
        {
            return daoFactory.GetGenericDao<T, IdT>().GetById(id, false);
        }

        public static T GetNullableByID(IdT id)
        {
            return daoFactory.GetGenericDao<T, IdT>().GetNullableByID(id);
        }

        public static List<T> GetAll()
        {
            return daoFactory.GetGenericDao<T, IdT>().GetAll();
        }

        public static List<T> GetAll(string propertyName, bool ascending)
        {
            return daoFactory.GetGenericDao<T, IdT>().GetAll(propertyName, ascending);
        }

        public static List<T> GetByExample(T exampleInstance, params string[] propertiesToExclude)
        {
            return daoFactory.GetGenericDao<T, IdT>().GetByExample(exampleInstance, propertiesToExclude);
        }

        public static T GetUniqueByExample(T exampleInstance, params string[] propertiesToExclude)
        {
            return daoFactory.GetGenericDao<T, IdT>().GetUniqueByExample(exampleInstance, propertiesToExclude);
        }

        public static List<T> GetByInclusionExample(T exampleInstance, params string[] propertiesToInclude)
        {
            return daoFactory.GetGenericDao<T, IdT>().GetByInclusionExample(exampleInstance, propertiesToInclude);
        }

        public static List<T> GetByInclusionExample(T exampleInstance, string sortPropertyName, bool ascending, params string[] propertiesToInclude)
        {
            return daoFactory.GetGenericDao<T, IdT>().GetByInclusionExample(exampleInstance, sortPropertyName, ascending, propertiesToInclude);
        }

        public static bool MakePersistent(ref T entity)
        {
            //Don't force a save
            return MakePersistent(ref entity, false);
        }

        public static bool MakePersistent(ref T entity, bool forceSave)
        {
            //If the entity is of type domainObject, call validation prior to persisting
            if (entity is DomainObject<T, IdT>)
            {
                DomainObject<T, IdT> obj = entity as DomainObject<T, IdT>;

                if (obj.isValid(entity) == false)
                {
                    NHibernateSessionManager.Instance.RollbackTransaction();
                    return false;
                }
            }
            
            //Perform the requested operation
            if (forceSave)
            {
                entity = daoFactory.GetGenericDao<T, IdT>().Save(entity);
            }
            else
            {
                entity = daoFactory.GetGenericDao<T, IdT>().SaveOrUpdate(entity);
            }

            return true;
        }

        public static void Remove(T entity)
        {
            daoFactory.GetGenericDao<T, IdT>().Delete(entity);
        }

        /// <summary>
        /// Calls the remove method on all entities in the given list collection
        /// </summary>
        /// <remarks>Could probably abstract out to IEnumerable later</remarks>
        public static void Remove(List<T> entities)
        {
            foreach (T entity in entities)
            {
                Remove(entity);
            }
        }
    }
}