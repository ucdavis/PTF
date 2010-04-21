using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CAESDO.PTF.Core.Domain
{
    public class Note : DomainObject<Note, int>
    {
        public virtual string NoteText { get; set; }
        public virtual NoteType NoteType { get; set; }
        public virtual Experiment Experiment { get; set; }
        public virtual DateTime DateNote { get; set; }

        public enum ExpNoteTypes { Induction, ElongationGermination, Recallusing, Rooting };

        /// <summary>
        /// Tells you whether or not the note is of a certain type
        /// </summary>
        /// <param name="noteType"></param>
        /// <returns></returns>
        public virtual bool IsNotetype(ExpNoteTypes noteType)
        {
            switch (noteType)
            {
                case Note.ExpNoteTypes.Induction:
                    if (this.NoteType.Name == NoteTypes.STR_Induction)
                    {
                        return true;
                    }
                    break;
                case Note.ExpNoteTypes.ElongationGermination:
                    if (this.NoteType.Name == NoteTypes.STR_ElongationGermination)
                    {
                        return true;
                    }
                    break;
                case Note.ExpNoteTypes.Recallusing:
                    if (this.NoteType.Name == NoteTypes.STR_Recallusing)
                    {
                        return true;
                    }
                    break;
                case Note.ExpNoteTypes.Rooting:
                    if (this.NoteType.Name == NoteTypes.STR_Rooting)
                    {
                        return true;
                    }
                    break;
            }

            return false;
        }
    }
}
