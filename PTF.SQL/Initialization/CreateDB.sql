 USE [PTF]
GO
/****** Object:  Table [dbo].[PlantSelections]    Script Date: 09/02/2008 14:25:36 ******/
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
/****** Object:  Table [dbo].[TransGenes]    Script Date: 09/02/2008 14:25:39 ******/
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
/****** Object:  Table [dbo].[AgroStrains]    Script Date: 09/02/2008 14:24:46 ******/
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
/****** Object:  Table [dbo].[NoteTypes]    Script Date: 09/02/2008 14:25:13 ******/
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
/****** Object:  Table [dbo].[Operators]    Script Date: 09/02/2008 14:25:15 ******/
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
 CONSTRAINT [PK_Operators] PRIMARY KEY CLUSTERED 
(
	[OperatorID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Status]    Script Date: 09/02/2008 14:25:37 ******/
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
/****** Object:  Table [dbo].[Cultivars]    Script Date: 09/02/2008 14:25:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Cultivars](
	[CultivarID] [int] IDENTITY(1,1) NOT NULL,
	[Cultivar] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Cultivatars] PRIMARY KEY CLUSTERED 
(
	[CultivarID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Genotypes]    Script Date: 09/02/2008 14:25:08 ******/
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
/****** Object:  Table [dbo].[Crops]    Script Date: 09/02/2008 14:25:00 ******/
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
/****** Object:  Table [dbo].[Constructs]    Script Date: 09/02/2008 14:24:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Constructs](
	[CID] [int] IDENTITY(1,1) NOT NULL,
	[ConstructID] [varchar](50) NULL,
	[SequenceNumber] [int] NULL,
	[DateCreated] [datetime] NOT NULL CONSTRAINT [DF_Constructs_DateCreated]  DEFAULT (getdate()),
	[OrderID] [int] NULL,
	[PlantsRequested] [int] NULL,
	[PlantsDelivered] [int] NULL,
	[TransformationInitiated] [datetime] NULL,
	[PIConstructName] [varchar](50) NULL,
	[AgroStrainID] [int] NULL,
	[PICode] [varchar](50) NULL,
	[BacterialSelection] [varchar](50) NULL,
	[Plasmid] [varchar](50) NULL,
	[Trait] [varchar](50) NULL,
	[GeneOfInterest] [varchar](50) NULL,
	[PlantSelectionID] [int] NULL,
	[ArchivedBox] [varchar](10) NULL,
	[Position] [varchar](10) NULL,
	[WorkingBox] [varchar](10) NULL,
	[Location] [varchar](10) NULL,
	[CropID] [int] NULL,
	[CultivarID] [int] NULL,
	[UCResearch] [bit] NULL,
	[Comment] [varchar](max) NULL,
	[StatusID] [int] NULL,
	[DateReceived] [datetime] NULL,
	[InvoiceDate] [datetime] NULL,
	[RechargeAmount] [varchar](10) NULL,
	[ContractExecuted] [varchar](50) NULL,
 CONSTRAINT [PK_Constructs] PRIMARY KEY CLUSTERED 
(
	[CID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Plants]    Script Date: 09/02/2008 14:25:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Plants](
	[PID] [int] IDENTITY(1,1) NOT NULL,
	[Pedigree] [varchar](50) NULL,
	[SequenceNumber] [int] NULL,
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
/****** Object:  Table [dbo].[Orders]    Script Date: 09/02/2008 14:25:28 ******/
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
/****** Object:  Table [dbo].[Notes]    Script Date: 09/02/2008 14:25:11 ******/
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
/****** Object:  Table [dbo].[Experiments]    Script Date: 09/02/2008 14:25:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Experiments](
	[EID] [int] IDENTITY(1,1) NOT NULL,
	[ExperimentCode] [varchar](50) NULL,
	[DateStarted] [datetime] NULL,
	[OperatorID] [int] NOT NULL,
	[SeedLotNumber] [varchar](15) NULL,
	[CID] [int] NOT NULL,
	[AgroSelection] [varchar](50) NULL,
	[Explant] [varchar](50) NULL,
	[Trait] [varchar](50) NULL,
	[Comments] [varchar](max) NULL,
	[TargetNumPlants] [int] NULL,
	[OpticalDensity] [varchar](15) NULL,
 CONSTRAINT [PK_Experiments] PRIMARY KEY CLUSTERED 
(
	[EID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  ForeignKey [FK_Constructs_AgroStrains]    Script Date: 09/02/2008 14:24:58 ******/
ALTER TABLE [dbo].[Constructs]  WITH CHECK ADD  CONSTRAINT [FK_Constructs_AgroStrains] FOREIGN KEY([AgroStrainID])
REFERENCES [dbo].[AgroStrains] ([AgroStrainID])
GO
ALTER TABLE [dbo].[Constructs] CHECK CONSTRAINT [FK_Constructs_AgroStrains]
GO
/****** Object:  ForeignKey [FK_Constructs_Crops]    Script Date: 09/02/2008 14:24:58 ******/
ALTER TABLE [dbo].[Constructs]  WITH CHECK ADD  CONSTRAINT [FK_Constructs_Crops] FOREIGN KEY([CropID])
REFERENCES [dbo].[Crops] ([CropID])
GO
ALTER TABLE [dbo].[Constructs] CHECK CONSTRAINT [FK_Constructs_Crops]
GO
/****** Object:  ForeignKey [FK_Constructs_Cultivar]    Script Date: 09/02/2008 14:24:58 ******/
ALTER TABLE [dbo].[Constructs]  WITH CHECK ADD  CONSTRAINT [FK_Constructs_Cultivar] FOREIGN KEY([CultivarID])
REFERENCES [dbo].[Cultivars] ([CultivarID])
GO
ALTER TABLE [dbo].[Constructs] CHECK CONSTRAINT [FK_Constructs_Cultivar]
GO
/****** Object:  ForeignKey [FK_Constructs_PlantSelections]    Script Date: 09/02/2008 14:24:59 ******/
ALTER TABLE [dbo].[Constructs]  WITH CHECK ADD  CONSTRAINT [FK_Constructs_PlantSelections] FOREIGN KEY([PlantSelectionID])
REFERENCES [dbo].[PlantSelections] ([PlantSelectionID])
GO
ALTER TABLE [dbo].[Constructs] CHECK CONSTRAINT [FK_Constructs_PlantSelections]
GO
/****** Object:  ForeignKey [FK_Constructs_Status]    Script Date: 09/02/2008 14:24:59 ******/
ALTER TABLE [dbo].[Constructs]  WITH CHECK ADD  CONSTRAINT [FK_Constructs_Status] FOREIGN KEY([StatusID])
REFERENCES [dbo].[Status] ([StatusID])
GO
ALTER TABLE [dbo].[Constructs] CHECK CONSTRAINT [FK_Constructs_Status]
GO
/****** Object:  ForeignKey [FK_Experiments_Constructs]    Script Date: 09/02/2008 14:25:07 ******/
ALTER TABLE [dbo].[Experiments]  WITH CHECK ADD  CONSTRAINT [FK_Experiments_Constructs] FOREIGN KEY([CID])
REFERENCES [dbo].[Constructs] ([CID])
GO
ALTER TABLE [dbo].[Experiments] CHECK CONSTRAINT [FK_Experiments_Constructs]
GO
/****** Object:  ForeignKey [FK_Experiments_Operators]    Script Date: 09/02/2008 14:25:07 ******/
ALTER TABLE [dbo].[Experiments]  WITH CHECK ADD  CONSTRAINT [FK_Experiments_Operators] FOREIGN KEY([OperatorID])
REFERENCES [dbo].[Operators] ([OperatorID])
GO
ALTER TABLE [dbo].[Experiments] CHECK CONSTRAINT [FK_Experiments_Operators]
GO
/****** Object:  ForeignKey [FK_Notes_Experiments]    Script Date: 09/02/2008 14:25:11 ******/
ALTER TABLE [dbo].[Notes]  WITH CHECK ADD  CONSTRAINT [FK_Notes_Experiments] FOREIGN KEY([EID])
REFERENCES [dbo].[Experiments] ([EID])
GO
ALTER TABLE [dbo].[Notes] CHECK CONSTRAINT [FK_Notes_Experiments]
GO
/****** Object:  ForeignKey [FK_Notes_NoteTypes]    Script Date: 09/02/2008 14:25:11 ******/
ALTER TABLE [dbo].[Notes]  WITH CHECK ADD  CONSTRAINT [FK_Notes_NoteTypes] FOREIGN KEY([NoteTypeID])
REFERENCES [dbo].[NoteTypes] ([NoteTypeID])
GO
ALTER TABLE [dbo].[Notes] CHECK CONSTRAINT [FK_Notes_NoteTypes]
GO
/****** Object:  ForeignKey [FK_Orders_Crops]    Script Date: 09/02/2008 14:25:28 ******/
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Crops] FOREIGN KEY([CropID])
REFERENCES [dbo].[Crops] ([CropID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Crops]
GO
/****** Object:  ForeignKey [FK_Orders_TransGenes]    Script Date: 09/02/2008 14:25:29 ******/
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_TransGenes] FOREIGN KEY([TransGeneID])
REFERENCES [dbo].[TransGenes] ([TransGeneID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_TransGenes]
GO
/****** Object:  ForeignKey [FK_Plants_Experiments]    Script Date: 09/02/2008 14:25:35 ******/
ALTER TABLE [dbo].[Plants]  WITH CHECK ADD  CONSTRAINT [FK_Plants_Experiments] FOREIGN KEY([EID])
REFERENCES [dbo].[Experiments] ([EID])
GO
ALTER TABLE [dbo].[Plants] CHECK CONSTRAINT [FK_Plants_Experiments]
GO
/****** Object:  ForeignKey [FK_Plants_Genotypes]    Script Date: 09/02/2008 14:25:35 ******/
ALTER TABLE [dbo].[Plants]  WITH CHECK ADD  CONSTRAINT [FK_Plants_Genotypes] FOREIGN KEY([GenoTypeID])
REFERENCES [dbo].[Genotypes] ([GenotypeID])
GO
ALTER TABLE [dbo].[Plants] CHECK CONSTRAINT [FK_Plants_Genotypes]
GO
/****** Object:  ForeignKey [FK_Plants_PlantSelections]    Script Date: 09/02/2008 14:25:35 ******/
ALTER TABLE [dbo].[Plants]  WITH CHECK ADD  CONSTRAINT [FK_Plants_PlantSelections] FOREIGN KEY([PlantSelectionID])
REFERENCES [dbo].[PlantSelections] ([PlantSelectionID])
GO
ALTER TABLE [dbo].[Plants] CHECK CONSTRAINT [FK_Plants_PlantSelections]
GO
