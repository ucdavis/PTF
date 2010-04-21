USE [PTF]
GO
/****** Object:  Table [dbo].[PlantSelections]    Script Date: 09/05/2008 11:01:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PlantSelections](
	[PlantSelectionID] [int] IDENTITY(1,1) NOT NULL,
	[PlantSelection] [varchar](50) NOT NULL,
 CONSTRAINT [PK_PlantSelections] PRIMARY KEY CLUSTERED 
(
	[PlantSelectionID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TransGenes]    Script Date: 09/05/2008 11:01:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TransGenes](
	[TransGeneID] [int] IDENTITY(1,1) NOT NULL,
	[TransGene] [varchar](50) NOT NULL,
 CONSTRAINT [PK_TransGenes] PRIMARY KEY CLUSTERED 
(
	[TransGeneID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AgroStrains]    Script Date: 09/05/2008 11:00:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AgroStrains](
	[AgroStrainID] [int] IDENTITY(1,1) NOT NULL,
	[AgroStrain] [varchar](50) NOT NULL,
 CONSTRAINT [PK_AgroStrains] PRIMARY KEY CLUSTERED 
(
	[AgroStrainID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NoteTypes]    Script Date: 09/05/2008 11:01:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NoteTypes](
	[NoteTypeID] [int] IDENTITY(1,1) NOT NULL,
	[NoteType] [varchar](50) NOT NULL,
 CONSTRAINT [PK_NoteTypes] PRIMARY KEY CLUSTERED 
(
	[NoteTypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Status]    Script Date: 09/05/2008 11:01:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Status](
	[StatusID] [int] IDENTITY(1,1) NOT NULL,
	[Status] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[StatusID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Operators]    Script Date: 09/05/2008 11:01:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Operators](
	[OperatorID] [int] IDENTITY(1,1) NOT NULL,
	[Operator] [varchar](100) NOT NULL,
	[OperatorCode] [varchar](5) NULL,
	[IsStudent] [bit] NOT NULL CONSTRAINT [DF_Operators_IsStudent]  DEFAULT ((0)),
	[IsSelectable] [bit] NOT NULL CONSTRAINT [DF_Operators_IsSelectable]  DEFAULT ((0)),
	[EffectiveID]  AS (case when [operatorcode] IS NULL then [operatorid] else [operatorcode] end),
 CONSTRAINT [PK_Operators] PRIMARY KEY CLUSTERED 
(
	[OperatorID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Genotypes]    Script Date: 09/05/2008 11:00:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Genotypes](
	[GenotypeID] [int] IDENTITY(1,1) NOT NULL,
	[Genotype] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Genotypes] PRIMARY KEY CLUSTERED 
(
	[GenotypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Crops]    Script Date: 09/05/2008 11:00:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Crops](
	[CropID] [int] IDENTITY(1,1) NOT NULL,
	[Crop] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Crops] PRIMARY KEY CLUSTERED 
(
	[CropID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Constructs]    Script Date: 09/05/2008 11:00:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Constructs](
	[CID] [int] IDENTITY(1,1) NOT NULL,
	[ConstructID] [nvarchar](50) NULL,
	[YearCode] [int] NOT NULL,
	[SequenceNumber] [int] NOT NULL,
	[SubSequenceNumber] [int] NULL CONSTRAINT [DF_Constructs_SubSequenceNumber]  DEFAULT ((-1)),
	[DateCreated] [datetime] NOT NULL CONSTRAINT [DF_Constructs_DateCreated]  DEFAULT (getdate()),
	[OrderID] [int] NULL,
	[PlantsRequested] [varchar](10) NULL,
	[PlantsDelivered] [int] NULL,
	[TransformationInitiated] [datetime] NULL,
	[PIConstructName] [varchar](50) NULL,
	[AgroStrainID] [int] NULL,
	[PICode] [varchar](100) NULL,
	[BacterialSelection] [varchar](50) NULL,
	[Plasmid] [varchar](50) NULL,
	[Trait] [varchar](100) NULL,
	[GeneOfInterest] [varchar](200) NULL,
	[PlantSelectionID] [int] NULL,
	[ArchivedBox] [int] NULL,
	[Position] [int] NULL,
	[WorkingBox] [int] NULL,
	[Location] [varchar](50) NULL,
	[CropID] [int] NULL,
	[GenotypeID] [int] NULL,
	[UCResearch] [bit] NULL,
	[Comment] [varchar](max) NULL,
	[StatusID] [int] NULL,
	[DateReceived] [datetime] NULL,
	[InvoiceDate] [datetime] NULL,
	[RechargeAmount] [varchar](50) NULL,
	[ContractExecuted] [varchar](50) NULL,
 CONSTRAINT [PK_Constructs] PRIMARY KEY CLUSTERED 
(
	[CID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 09/05/2008 11:01:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[DateRequested] [datetime] NOT NULL CONSTRAINT [DF_Orders_DateRequested]  DEFAULT (getdate()),
	[PI] [varchar](100) NULL,
	[Contact] [varchar](100) NOT NULL,
	[ContactPhone] [varchar](20) NOT NULL,
	[ContactEmail] [varchar](50) NOT NULL,
	[CropID] [int] NOT NULL,
	[NumberOfPlants] [int] NOT NULL,
	[Plasmid] [varchar](50) NULL,
	[BacterialSelection] [varchar](50) NULL,
	[AgroBacteriumStrain] [varchar](50) NULL,
	[PlantSelection] [varchar](50) NULL,
	[Construct] [varchar](50) NOT NULL,
	[NameOfYourConstruct] [varchar](50) NOT NULL,
	[TransGeneID] [int] NOT NULL,
	[GeneOfInterestPromoter] [varchar](50) NOT NULL,
	[GeneOfInterestGene] [varchar](50) NOT NULL,
	[GeneOfInterestTerminator] [varchar](50) NOT NULL,
	[SelectableMarkerPromoter] [varchar](50) NULL,
	[SelectableMarkerGene] [varchar](50) NOT NULL,
	[SelectableMarkerTerminator] [varchar](50) NOT NULL,
	[ScorableMarkerPromoter] [varchar](50) NOT NULL,
	[ScorableMarkerGene] [varchar](50) NOT NULL,
	[ScorableMarkerTerminator] [varchar](50) NOT NULL,
	[AdditionalInformation] [varchar](max) NULL,
	[OtherUCResearch] [bit] NOT NULL CONSTRAINT [DF_Orders_OtherUCResearch]  DEFAULT ((0)),
	[UserID] [uniqueidentifier] NOT NULL,
	[RechargeNumber] [varchar](20) NULL,
	[ContractNumber] [varchar](50) NULL,
	[Cultivar] [varchar](50) NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Notes]    Script Date: 09/05/2008 11:00:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Notes](
	[NoteID] [int] IDENTITY(1,1) NOT NULL,
	[Note] [varchar](max) NOT NULL,
	[NoteTypeID] [int] NOT NULL,
	[EID] [int] NOT NULL,
	[DateNote] [datetime] NOT NULL CONSTRAINT [DF_Notes_DateNote]  DEFAULT (getdate()),
 CONSTRAINT [PK_Notes] PRIMARY KEY CLUSTERED 
(
	[NoteID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  UserDefinedFunction [dbo].[udf_GetEffectiveID]    Script Date: 09/05/2008 11:01:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[udf_GetEffectiveID]
(
	@OperatorID int
)
RETURNS int
AS
BEGIN
	-- Declare the return variable here
	DECLARE @effective int

	select @effective = effectiveid from operators where operatorid = @operatorid

	-- Return the result of the function
	RETURN @effective

END
GO
/****** Object:  Table [dbo].[Experiments]    Script Date: 09/05/2008 11:00:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Experiments](
	[EID] [int] IDENTITY(1,1) NOT NULL,
	[ExperimentCode]  AS ([dbo].[udf_ExperimentCode]([YearCode],[dbo].[udf_GetEffectiveID]([OperatorID]),[OperatorExperimentNum])),
	[DateStarted] [datetime] NULL,
	[YearCode] [int] NULL,
	[OperatorExperimentNum] [int] NULL,
	[OperatorID] [int] NULL,
	[SeedLotNumber] [varchar](15) NULL,
	[CID] [int] NULL,
	[AgroSelection] [varchar](50) NULL,
	[Explant] [varchar](50) NULL,
	[Trait] [varchar](50) NULL,
	[Comments] [varchar](max) NULL,
	[TargetNumPlants] [int] NULL,
	[OpticalDensity] [float] NULL,
 CONSTRAINT [PK_Experiments] PRIMARY KEY CLUSTERED 
(
	[EID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  UserDefinedFunction [dbo].[udf_GetExperimentCode]    Script Date: 09/05/2008 11:01:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[udf_GetExperimentCode]
(
	@eid int
)
RETURNS varchar(20)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @experimentCode varchar(20)

	SELECT @experimentCode = experimentCode from Experiments where EID = @EID

	-- Return the result of the function
	RETURN @experimentCode

END
GO
/****** Object:  Table [dbo].[Plants]    Script Date: 09/05/2008 11:01:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Plants](
	[PID] [int] IDENTITY(1,1) NOT NULL,
	[Pedigree]  AS (case when [eid] IS NOT NULL then ([dbo].[udf_GetExperimentCode]([eid])+'-')+[SequenceNumber] else [SequenceNumber] end),
	[SequenceNumber] [varchar](15) NULL,
	[EID] [int] NULL,
	[DateInitiated] [datetime] NULL,
	[DateEntered] [datetime] NOT NULL CONSTRAINT [DF_Plants_DateEntered]  DEFAULT (getdate()),
	[GenoTypeID] [int] NULL,
	[ReCallusingAssay] [bit] NOT NULL CONSTRAINT [DF_Plants_ReCallusingAssay]  DEFAULT ((0)),
	[Rooting] [bit] NOT NULL CONSTRAINT [DF_Plants_Rooting]  DEFAULT ((0)),
	[Comment] [varchar](max) NULL,
	[DateDelivered] [datetime] NULL,
	[PlantSelectionID] [int] NULL,
 CONSTRAINT [PK_Plants] PRIMARY KEY CLUSTERED 
(
	[PID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  ForeignKey [FK_Constructs_AgroStrains]    Script Date: 09/05/2008 11:00:46 ******/
ALTER TABLE [dbo].[Constructs]  WITH CHECK ADD  CONSTRAINT [FK_Constructs_AgroStrains] FOREIGN KEY([AgroStrainID])
REFERENCES [dbo].[AgroStrains] ([AgroStrainID])
GO
ALTER TABLE [dbo].[Constructs] CHECK CONSTRAINT [FK_Constructs_AgroStrains]
GO
/****** Object:  ForeignKey [FK_Constructs_Crops]    Script Date: 09/05/2008 11:00:46 ******/
ALTER TABLE [dbo].[Constructs]  WITH CHECK ADD  CONSTRAINT [FK_Constructs_Crops] FOREIGN KEY([CropID])
REFERENCES [dbo].[Crops] ([CropID])
GO
ALTER TABLE [dbo].[Constructs] CHECK CONSTRAINT [FK_Constructs_Crops]
GO
/****** Object:  ForeignKey [FK_Constructs_Genotypes]    Script Date: 09/05/2008 11:00:46 ******/
ALTER TABLE [dbo].[Constructs]  WITH CHECK ADD  CONSTRAINT [FK_Constructs_Genotypes] FOREIGN KEY([GenotypeID])
REFERENCES [dbo].[Genotypes] ([GenotypeID])
GO
ALTER TABLE [dbo].[Constructs] CHECK CONSTRAINT [FK_Constructs_Genotypes]
GO
/****** Object:  ForeignKey [FK_Constructs_PlantSelections]    Script Date: 09/05/2008 11:00:46 ******/
ALTER TABLE [dbo].[Constructs]  WITH CHECK ADD  CONSTRAINT [FK_Constructs_PlantSelections] FOREIGN KEY([PlantSelectionID])
REFERENCES [dbo].[PlantSelections] ([PlantSelectionID])
GO
ALTER TABLE [dbo].[Constructs] CHECK CONSTRAINT [FK_Constructs_PlantSelections]
GO
/****** Object:  ForeignKey [FK_Constructs_Status]    Script Date: 09/05/2008 11:00:46 ******/
ALTER TABLE [dbo].[Constructs]  WITH CHECK ADD  CONSTRAINT [FK_Constructs_Status] FOREIGN KEY([StatusID])
REFERENCES [dbo].[Status] ([StatusID])
GO
ALTER TABLE [dbo].[Constructs] CHECK CONSTRAINT [FK_Constructs_Status]
GO
/****** Object:  ForeignKey [FK_Experiments_Operators]    Script Date: 09/05/2008 11:00:54 ******/
ALTER TABLE [dbo].[Experiments]  WITH CHECK ADD  CONSTRAINT [FK_Experiments_Operators] FOREIGN KEY([OperatorID])
REFERENCES [dbo].[Operators] ([OperatorID])
GO
ALTER TABLE [dbo].[Experiments] CHECK CONSTRAINT [FK_Experiments_Operators]
GO
/****** Object:  ForeignKey [FK_Notes_Experiments]    Script Date: 09/05/2008 11:00:58 ******/
ALTER TABLE [dbo].[Notes]  WITH CHECK ADD  CONSTRAINT [FK_Notes_Experiments] FOREIGN KEY([EID])
REFERENCES [dbo].[Experiments] ([EID])
GO
ALTER TABLE [dbo].[Notes] CHECK CONSTRAINT [FK_Notes_Experiments]
GO
/****** Object:  ForeignKey [FK_Notes_NoteTypes]    Script Date: 09/05/2008 11:00:58 ******/
ALTER TABLE [dbo].[Notes]  WITH CHECK ADD  CONSTRAINT [FK_Notes_NoteTypes] FOREIGN KEY([NoteTypeID])
REFERENCES [dbo].[NoteTypes] ([NoteTypeID])
GO
ALTER TABLE [dbo].[Notes] CHECK CONSTRAINT [FK_Notes_NoteTypes]
GO
/****** Object:  ForeignKey [FK_Orders_Crops]    Script Date: 09/05/2008 11:01:16 ******/
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Crops] FOREIGN KEY([CropID])
REFERENCES [dbo].[Crops] ([CropID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Crops]
GO
/****** Object:  ForeignKey [FK_Orders_TransGenes]    Script Date: 09/05/2008 11:01:16 ******/
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_TransGenes] FOREIGN KEY([TransGeneID])
REFERENCES [dbo].[TransGenes] ([TransGeneID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_TransGenes]
GO
/****** Object:  ForeignKey [FK_Plants_Experiments]    Script Date: 09/05/2008 11:01:22 ******/
ALTER TABLE [dbo].[Plants]  WITH CHECK ADD  CONSTRAINT [FK_Plants_Experiments] FOREIGN KEY([EID])
REFERENCES [dbo].[Experiments] ([EID])
GO
ALTER TABLE [dbo].[Plants] CHECK CONSTRAINT [FK_Plants_Experiments]
GO
/****** Object:  ForeignKey [FK_Plants_Genotypes]    Script Date: 09/05/2008 11:01:22 ******/
ALTER TABLE [dbo].[Plants]  WITH CHECK ADD  CONSTRAINT [FK_Plants_Genotypes] FOREIGN KEY([GenoTypeID])
REFERENCES [dbo].[Genotypes] ([GenotypeID])
GO
ALTER TABLE [dbo].[Plants] CHECK CONSTRAINT [FK_Plants_Genotypes]
GO
/****** Object:  ForeignKey [FK_Plants_PlantSelections]    Script Date: 09/05/2008 11:01:22 ******/
ALTER TABLE [dbo].[Plants]  WITH CHECK ADD  CONSTRAINT [FK_Plants_PlantSelections] FOREIGN KEY([PlantSelectionID])
REFERENCES [dbo].[PlantSelections] ([PlantSelectionID])
GO
ALTER TABLE [dbo].[Plants] CHECK CONSTRAINT [FK_Plants_PlantSelections]
GO
