using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.Practices.EnterpriseLibrary.Validation.Validators;

namespace CAESDO.PTF.Core.Domain
{
    public class Experiment : DomainObject<Experiment, int>
    {
        public virtual string ExperimentCode { get; set; }
        public virtual DateTime? DateStarted { get; set; }
        public virtual Operator Operator { get; set; }
        [IgnoreNulls]
        [StringLengthValidator(15)]
        public virtual string SeedLotNumber { get; set; }
        public virtual Construct Construct { get; set; }

        [IgnoreNulls]
        [StringLengthValidator(50)]
        public virtual string Explant { get; set; }
        public virtual string Comments { get; set; }
        public virtual float OpticalDensity { get; set; }

        public virtual IList<Plant> Plants { get; set; }
        public virtual IList<Note> Notes { get; set; }

        /// <summary>
        /// Return all notes that fall under a specified note type
        /// </summary>
        /// <param name="noteType"></param>
        /// <returns></returns>
        public virtual List<Note> GetNotesbyType(Note.ExpNoteTypes noteType)
        {       
            var results = new List<Note>();

            if (Notes == null)
            {
                return results;
            }

            foreach (Note n in Notes)
            {
                if (n.IsNotetype(noteType))
                {
                    results.Add(n);
                }
            }

            return results;
        }
    }
}
