IF EXISTS (SELECT * FROM sysobjects WHERE type = 'TR' AND name = 'GenerateExperimentCodeInfo')
	BEGIN
		DROP  Trigger GenerateExperimentCodeInfo
	END
GO

CREATE Trigger [dbo].[GenerateExperimentCodeInfo] ON [dbo].[Experiments]
FOR INSERT

	declare @id int, @start datetime, @operator int
	declare @yearcode int, @experimentnum int

	select @id = eid, @start = datestarted, @operator = operatorid from inserted

	-- get the year code
	declare @year varchar(4)
	select @year = datepart(yy, @start)
	set @year = substring(@year, 3, 2)
	set @yearCode = cast(@year as int)

	-- get the operator experiment number
	select @experimentnum = max(operatorexperimentnum) from Experiments where effectiveoperatorid = dbo.udf_geteffectiveid(@operator) and yearcode = @yearcode

	if (@experimentnum is null)
		set @experimentnum = 1
	else
		SET @experimentnum = @experimentnum + 1

	-- update the row
	update Experiments
	set yearcode = @yearcode, operatorexperimentnum = @experimentnum
	where eid = @id

GO

