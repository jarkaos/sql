USE [RKAPP_Childnet_test]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

--APPLICATION TABLE

IF EXISTS (SELECT *
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE CONSTRAINT_TYPE = 'PRIMARY KEY'
AND TABLE_NAME = 'Application'
AND TABLE_SCHEMA ='dbo' )
BEGIN
	ALTER TABLE Application 
	DROP CONSTRAINT PK_Application_1;   
	EXEC sp_rename 'Application.Ano', 'ApplicationID', 'COLUMN';
END;
GO 

IF NOT EXISTS (SELECT *
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE CONSTRAINT_TYPE = 'PRIMARY KEY'
AND TABLE_NAME = 'Application'
AND TABLE_SCHEMA ='dbo' )
BEGIN
    ALTER TABLE Application
    ADD CONSTRAINT PK_ApplicationId PRIMARY KEY (ApplicationID); 
END;
GO

--AUTHORITY TABLE

-- Drop CONSTRAINT
IF EXISTS (SELECT *
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE CONSTRAINT_TYPE = 'PRIMARY KEY'
AND TABLE_NAME = 'Authority'
AND TABLE_SCHEMA ='dbo' )
BEGIN
	ALTER TABLE Authority 
	DROP CONSTRAINT PK_Authority;   
END;
GO 

-- Drop COLUMN Authority_ID
IF EXISTS(SELECT 1 FROM sys.columns 
          WHERE Name = N'Authority_ID'
          AND Object_ID = Object_ID(N'Authority'))
BEGIN
	ALTER TABLE Authority 
	DROP COLUMN Authority_ID;   
END;
GO 

--Create field 'AuthorityID' on table 'Authority' 
IF NOT EXISTS(SELECT 1
FROM sys.columns
WHERE Name = N'AuthorityID'
    AND Object_ID = Object_ID(N'dbo.Authority'))
BEGIN
    ALTER TABLE [dbo].[Authority] 
	ADD [AuthorityID] INT IDENTITY(1,1)  NOT NULL
END
GO

--Set PRIMARY_KEY on AuthorityID field and instantiate with autoincrement
IF NOT EXISTS (SELECT *
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE CONSTRAINT_TYPE = 'PRIMARY KEY'
AND TABLE_NAME = 'Authority'
AND TABLE_SCHEMA ='dbo' )
BEGIN
    ALTER TABLE Authority
    ADD CONSTRAINT PK_AuthorityID PRIMARY KEY (AuthorityID); 
END;
GO

--CATEGORY Table

IF EXISTS (SELECT *
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE CONSTRAINT_TYPE = 'PRIMARY KEY'
AND TABLE_NAME = 'Category'
AND TABLE_SCHEMA ='dbo' )
BEGIN
	ALTER TABLE Category 
	DROP CONSTRAINT PK_CATEGORY;   
END;
GO 

IF EXISTS(SELECT 1 FROM sys.columns 
          WHERE Name = N'Category_ID'
          AND Object_ID = Object_ID(N'Category'))
BEGIN
	ALTER TABLE Category 
	DROP COLUMN Category_ID;   
END;
GO 

--/* Create field 'CategoryID' on table 'Category' */
IF NOT EXISTS(SELECT 1
FROM sys.columns
WHERE Name = N'CategoryID'
    AND Object_ID = Object_ID(N'dbo.Category'))
BEGIN
    ALTER TABLE [dbo].[Category] 
	ADD [CategoryID] INT IDENTITY(1,1)  NOT NULL
END
GO

IF NOT EXISTS (SELECT *
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE CONSTRAINT_TYPE = 'PRIMARY KEY'
AND TABLE_NAME = 'Category'
AND TABLE_SCHEMA ='dbo' )
BEGIN
    ALTER TABLE Category
    ADD CONSTRAINT PK_CATEGORY PRIMARY KEY (CategoryID); 
END;
GO

--CHILDREN Table

IF EXISTS (SELECT *
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE CONSTRAINT_TYPE = 'PRIMARY KEY'
AND TABLE_NAME = 'Children'
AND TABLE_SCHEMA ='dbo' )
BEGIN
	ALTER TABLE Children 
	DROP CONSTRAINT PK_CHILDREN;   
END;
GO 

IF EXISTS(SELECT 1 FROM sys.columns 
          WHERE Name = N'Children_ID'
          AND Object_ID = Object_ID(N'Children'))
BEGIN
	ALTER TABLE Children 
	DROP COLUMN Children_ID;   
END;
GO 

--/* Create field 'ChildrenID' on table 'Children' */
IF NOT EXISTS(SELECT 1
FROM sys.columns
WHERE Name = N'ChildrenID'
    AND Object_ID = Object_ID(N'dbo.Children'))
BEGIN
    ALTER TABLE [dbo].[Children] 
	ADD [ChildrenID] INT IDENTITY(1,1)  NOT NULL
END
GO

IF NOT EXISTS (SELECT *
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE CONSTRAINT_TYPE = 'PRIMARY KEY'
AND TABLE_NAME = 'Children'
AND TABLE_SCHEMA ='dbo' )
BEGIN
    ALTER TABLE Children
    ADD CONSTRAINT PK_Children_ID PRIMARY KEY (ChildrenID); 
END;
GO

--CloseStatus Table

IF EXISTS (SELECT *
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE CONSTRAINT_TYPE = 'PRIMARY KEY'
AND TABLE_NAME = 'CloseStatus'
AND TABLE_SCHEMA ='dbo' )
BEGIN
	ALTER TABLE CloseStatus 
	DROP CONSTRAINT PK_CloseStatus;   
END;
GO 

IF EXISTS(SELECT 1 FROM sys.columns 
          WHERE Name = N'CloseStatus_ID'
          AND Object_ID = Object_ID(N'CloseStatus'))
BEGIN
	ALTER TABLE CloseStatus 
	DROP COLUMN CloseStatus_ID;   
END;
GO 

--/* Create field 'CloseStatusID' on table 'CloseStatus' */
IF NOT EXISTS(SELECT 1
FROM sys.columns
WHERE Name = N'CloseStatusID'
    AND Object_ID = Object_ID(N'dbo.CloseStatus'))
BEGIN
    ALTER TABLE [dbo].[CloseStatus] 
	ADD [CloseStatusID] INT IDENTITY(1,1)  NOT NULL
END
GO

IF NOT EXISTS (SELECT *
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE CONSTRAINT_TYPE = 'PRIMARY KEY'
AND TABLE_NAME = 'CloseStatus'
AND TABLE_SCHEMA ='dbo' )
BEGIN
    ALTER TABLE CloseStatus
    ADD CONSTRAINT PK_CloseStatus_ID PRIMARY KEY (CloseStatusID); 
END;
GO

-- COUNTRY Table

IF EXISTS (SELECT *
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE CONSTRAINT_TYPE = 'PRIMARY KEY'
AND TABLE_NAME = 'Country'
AND TABLE_SCHEMA ='dbo' )
BEGIN
	ALTER TABLE Country 
	DROP CONSTRAINT PK_COUNTRY;   
END;
GO 

IF EXISTS(SELECT 1 FROM sys.columns 
          WHERE Name = N'Country_ID'
          AND Object_ID = Object_ID(N'Country'))
BEGIN
	ALTER TABLE Country 
	DROP COLUMN Country_ID;   
END;
GO 

--/* Create field 'CountryID' on table 'Country' */
IF NOT EXISTS(SELECT 1
FROM sys.columns
WHERE Name = N'CountryID'
    AND Object_ID = Object_ID(N'dbo.Country'))
BEGIN
    ALTER TABLE [dbo].[Country] 
	ADD [CountryID] INT IDENTITY(1,1)  NOT NULL
END
GO

IF NOT EXISTS (SELECT *
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE CONSTRAINT_TYPE = 'PRIMARY KEY'
AND TABLE_NAME = 'Country'
AND TABLE_SCHEMA ='dbo' )
BEGIN
    ALTER TABLE Country
    ADD CONSTRAINT PK_Country_ID PRIMARY KEY (CountryID); 
END;
GO


-- COURT Table

IF EXISTS (SELECT *
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE CONSTRAINT_TYPE = 'PRIMARY KEY'
AND TABLE_NAME = 'Court'
AND TABLE_SCHEMA ='dbo' )
BEGIN
	ALTER TABLE Court 
	DROP CONSTRAINT PK_COURT;   
END;
GO 

IF EXISTS(SELECT 1 FROM sys.columns 
          WHERE Name = N'Court_ID'
          AND Object_ID = Object_ID(N'Court'))
BEGIN
	ALTER TABLE Court 
	DROP COLUMN Court_ID;   
END;
GO 

--/* Create field 'CourtID' on table 'Court' */
IF NOT EXISTS(SELECT 1
FROM sys.columns
WHERE Name = N'CourtID'
    AND Object_ID = Object_ID(N'dbo.Court'))
BEGIN
    ALTER TABLE [dbo].[Court] 
	ADD [CourtID] INT IDENTITY(1,1)  NOT NULL
END
GO

IF NOT EXISTS (SELECT *
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE CONSTRAINT_TYPE = 'PRIMARY KEY'
AND TABLE_NAME = 'Court'
AND TABLE_SCHEMA ='dbo' )
BEGIN
    ALTER TABLE Court
    ADD CONSTRAINT PK_Court_ID PRIMARY KEY (CourtID); 
END;
GO

--DECISION Table

IF EXISTS (SELECT *
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE CONSTRAINT_TYPE = 'PRIMARY KEY'
AND TABLE_NAME = 'Decision'
AND TABLE_SCHEMA ='dbo' )
BEGIN
	ALTER TABLE Decision 
	DROP CONSTRAINT PK_DECISION;   
END;
GO 

IF EXISTS(SELECT 1 FROM sys.columns 
          WHERE Name = N'Decision_ID'
          AND Object_ID = Object_ID(N'Decision'))
BEGIN
	ALTER TABLE Decision 
	DROP COLUMN Decision_ID;   
END;
GO 

--/* Create field 'DecisionID' on table 'Decision' */
IF NOT EXISTS(SELECT 1
FROM sys.columns
WHERE Name = N'DecisionID'
    AND Object_ID = Object_ID(N'dbo.Decision'))
BEGIN
    ALTER TABLE [dbo].[Decision] 
	ADD [DecisionID] INT IDENTITY(1,1)  NOT NULL
END
GO

IF NOT EXISTS (SELECT *
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE CONSTRAINT_TYPE = 'PRIMARY KEY'
AND TABLE_NAME = 'Decision'
AND TABLE_SCHEMA ='dbo' )
BEGIN
    ALTER TABLE Decision
    ADD CONSTRAINT PK_Decision_ID PRIMARY KEY (DecisionID); 
END;
GO

--STATUS Table

IF EXISTS (SELECT *
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE CONSTRAINT_TYPE = 'PRIMARY KEY'
AND TABLE_NAME = 'Status'
AND TABLE_SCHEMA ='dbo' )
BEGIN
	ALTER TABLE Status 
	DROP CONSTRAINT PK_Status;   
END;
GO 

IF EXISTS(SELECT 1 FROM sys.columns 
          WHERE Name = N'Status_ID'
          AND Object_ID = Object_ID(N'Status'))
BEGIN
	ALTER TABLE Status 
	DROP COLUMN Status_ID;   
END;
GO 

--/* Create field 'StatusID' on table 'Status' */
IF NOT EXISTS(SELECT 1
FROM sys.columns
WHERE Name = N'StatusID'
    AND Object_ID = Object_ID(N'dbo.Status'))
BEGIN
    ALTER TABLE [dbo].[Status] 
	ADD [StatusID] INT IDENTITY(1,1)  NOT NULL
END
GO

IF NOT EXISTS (SELECT *
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE CONSTRAINT_TYPE = 'PRIMARY KEY'
AND TABLE_NAME = 'Status'
AND TABLE_SCHEMA ='dbo' )
BEGIN
    ALTER TABLE Status
    ADD CONSTRAINT PK_Status_ID PRIMARY KEY (StatusID); 
END;
GO
