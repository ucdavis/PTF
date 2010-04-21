insert into ptf.dbo.plantselections (plantselection)
select distinct [plant selection] from [PTFExistingData].dbo.[constructinventory] where [plant selection] not in (select plantselection from ptf.dbo.plantselections ) and [plant selection] is not null

insert into ptf.dbo.agrostrains (agrostrain)
select distinct [agro strains] from [ptfexistingdata].dbo.[constructinventory] where [agro strains] not in (select agrostrain from ptf.dbo.agrostrains) and [agro strains] is not null

insert into ptf.dbo.crops (crop)
select distinct [target crop] from [ptfexistingdata].dbo.[constructinventory] where [target crop] not in ( select crop from ptf.dbo.crops ) and [target crop] is not null

insert into ptf.dbo.genotypes (genotype)
select distinct cultivar from ptfexistingdata.dbo.constructinventory where cultivar not in ( select genotype from ptf.dbo.genotypes ) and cultivar is not null

insert into ptf.dbo.constructs ( DateCreated, YearCode, SequenceNumber, SubSequenceNumber, OrderID
	, PlantsRequested, PlantsDelivered, TransformationInitiated, PIConstructName, PICode
	, AgroStrainID, BacterialSelection, Plasmid, Trait, GeneOfInterest, PlantSelectionID, ArchivedBox
	, Position, WorkingBox, Location, CropID, UCResearch, StatusID, DateReceived, InvoiceDate, RechargeAmount, ContractExecuted, GenoTypeID )
select
	CAST('1/1/20' + substring([Construct Code], 3, 2) as datetime) as DateCreated
	, cast(substring([Construct Code], 3, 2) as int) YearCode
	, cast(substring([Construct Code], 5, 3) as int) SequenceNumber
	, cast(substring([Construct Code], 9, 2) as int) SubSequenceNumber
	, -1 OrderID
	, cast(PlantsRequested as varchar(10)) as plantsrequested, cast(PlantsDelivered as int) as plantsdelivered
	, CASE
		WHEN dbo.ConvertDateTime([Transformation Initiated]) = CAST ('1/1/1900' as datetime) then null
		else dbo.ConvertDateTime([Transformation Initiated])
	  END TransformationInitiated
	, cast([PI Construct Name] as varchar(50)) PIConstructName, cast([PI Code] as varchar(100)) PICode
	, ags.agrostrainID
	, cast([Bacterial Selection] as varchar(50))
	, cast(Plasmid as varchar(50))
	, cast(Trait as varchar(100))
	, cast([Gene Of Interest] as varchar(200))
	, ps.plantselectionid, [archived box], position, [working box]
	, cast(location as varchar(50))
	, cropid
	, CAST (
		case
			when [available for uc researchers] = 'yes' then 1
			else 0
		end as bit ) UCResearch
	, case 
		when [status] = 'complete' then (select statusid from ptf.dbo.status where [status] = 'Complete')
		else null
	  end [Status]
	, [Date Received]
	, CASE
			WHEN dbo.ConvertDateTime([Invoice Sent]) = CAST('1/1/1900' as datetime) then null
			else dbo.ConvertDateTime([Invoice Sent])
	  END InvoiceDate
	, cast([Recharge Amount] as varchar(50))
	, cast([Contract Executed] as varchar(50))
	, genotypes.genotypeid
from constructinventory
	left outer join ptf.dbo.agrostrains ags on ags.agrostrain = constructinventory.[agro strains]
	left outer join ptf.dbo.plantselections ps on ps.plantselection = constructinventory.[plant selection]
	left outer join ptf.dbo.crops on crops.crop = constructinventory.[target crop]
	left outer join ptf.dbo.genotypes on genotypes.genotype = constructinventory.[cultivar]

insert into ptf.dbo.operators (operatorcode, operator)
select distinct substring(cast(experiment as varchar(15)), 2, 1) OperatorID, Operator
from InventoryOfExperiments
where operator is not null

insert into ptf.dbo.experiments (YearCode, operatorexperimentnum, datestarted, operatorid, seedlotnumber, agroselection, explant, trait, comments, targetnumplants, opticaldensity )
select cast(substring(CAST(experiment as varchar(15)), 1, 1) as int) YearCode
	, cast(substring(cast(experiment as varchar(15)), 3, 3) as int) OperatorExperimentNumber
	, Date DateStarted
	, ptf.dbo.operators.operatorid--, inventoryofexperiments.operator
	, cast([Seed Lot Number] as varchar(15)) SeedLotNumber
	, cast([Agro Selection] as varchar(50)) AgroSelection
	, cast(Explant as varchar(50))
	, cast(Trait as varchar(50))
	, cast(Comment as varchar(max))
	, cast([Targeted # of Plants] as int) TargetedNumPlants
	, [Optical Density]
from InventoryOfExperiments
	left outer join ptf.dbo.operators on ptf.dbo.operators.operatorcode + ptf.dbo.operators.operator = substring(cast(experiment as varchar(15)), 2, 1) + inventoryofexperiments.operator

 Associate the construct with the experiments
declare @experiment varchar(20), @cid int
declare @cur CURSOR

SET @cur = CURSOR FOR
	select experiment, cid
	from ptfexistingdata.dbo.inventoryofexperiments ioe
		inner join constructs on ioe.[agro code] like constructs.constructid + '%'

open @cur

FETCH NEXT FROM @cur INTO @Experiment, @cid

WHILE (@@FETCH_STATUS = 0)
begin
	
	update experiments
	set cid = @cid
	where experimentcode = @experiment	

	FETCH NEXT FROM @cur INTO @Experiment, @cid
end

close @cur
deallocate @cur


insert into ptf.dbo.genotypes (genotype)
select distinct genotype from planttransformationinventory where genotype is not null and genotype not in ( select genotype from ptf.dbo.genotypes )

insert into ptf.dbo.plantselections (plantselection)
select distinct selection from planttransformationinventory where selection is not null and selection not in ( select plantselection from ptf.dbo.plantselections )

insert into ptf.dbo.plants (sequenceNumber, eid, dateinitiated, dateentered, genotypeid, recallusingassay, rooting, comment, datedelivered, plantselectionid)
select 
	case 
		when eid is null then pedigree
		else substring(pedigree, charindex('-', pedigree) + 1, 15) 
	end SequenceNumber
	, eid
	, [Date Initiated]
	, CASE 
		WHEN [Date Entered]	is null then getdate()
		else [Date Entered]
	  END DateEntered
	, ptf.dbo.genotypes.genotypeid
	, cast (
		case
			when [Re-Callusing Assay] = '+' then 1
			else 0
		end as bit ) ReCallusingAssay
	, cast (
		case
			when Rooting = '+' then 1
			else 0
		end as bit ) Rooting
	, cast(Comment as varchar(max))
	, case
		when dbo.ConvertDateTime([Date Delivered]) = cast('1/1/1900' as datetime) then null
		else dbo.ConvertDateTime([Date Delivered])
	  end DateDelivered
	, ps.plantselectionid
from planttransformationinventory
	left outer join ptf.dbo.genotypes on ptf.dbo.genotypes.genotype = planttransformationinventory.genotype
	left outer join ptf.dbo.plantselections ps on ps.plantselection = planttransformationinventory.selection
	left outer join ptf.dbo.experiments ex on ex.experimentcode = planttransformationinventory.[transformation code]
where eid is null
 