--ALTER DATABASE [DatabaseName] SET TRUSTWORTHY ON
--EXEC sp_configure 'clr enabled', 1;
--RECONFIGURE WITH OVERRIDE;

DECLARE @InstallPath nvarchar(1024);
Select @InstallPath = 'c:\temp\';

if object_id('dbo.GetDataByLocationV200806', N'PC') is not null
	drop procedure dbo.GetDataByLocationV200806
if object_id('dbo.GetAuditDataByLocationV200806', N'PC') is not null
	drop procedure dbo.GetAuditDataByLocationV200806
if exists (select * from sys.assemblies where name = N'Citect.Ampla.Public.MSSQL.Data.V200806.XmlSerializers')
	drop assembly [Citect.Ampla.Public.MSSQL.Data.V200806.XmlSerializers]
if exists (select * from sys.assemblies where name = N'Citect.Ampla.Public.MSSQL.Data.V200806')
	drop assembly [Citect.Ampla.Public.MSSQL.Data.V200806]

CREATE ASSEMBLY [Citect.Ampla.Public.MSSQL.Data.V200806] FROM @InstallPath + 'Citect.Ampla.Public.MSSQL.Data.V200806.dll' WITH PERMISSION_SET = UNSAFE;
CREATE ASSEMBLY [Citect.Ampla.Public.MSSQL.Data.V200806.XmlSerializers] FROM @InstallPath + 'Citect.Ampla.Public.MSSQL.Data.V200806.XmlSerializers.dll' WITH PERMISSION_SET = UNSAFE;
GO

CREATE PROCEDURE [dbo].[GetDataByLocationV200806]
  @module [nvarchar](128),
  @location [nvarchar](4000),
  @samplePeriod [nvarchar](4000) = null,
  @startDateLocalTime [datetime] = N'',
  @endDateLocalTime [datetime] = N'',
  @viewName [nvarchar](4000) = null,
  @fields [nvarchar](4000) = null,
  @modelFields [nvarchar](4000) = null,
  @filters [nvarchar](4000) = null,
  @inclusiveDataRange [int] = 1,
  @session[nvarchar](128) = null,
  @username[nvarchar](512) = N'ReportUser',
  @password[nvarchar](512) = N'password',
  @serverName[nvarchar](4000) = N'http://localhost:8889/',
  @resolveIdentifiers[bit] = 0,
  @pivotResults[bit] = 1,
  @language [nvarchar](128) = null
WITH EXECUTE AS CALLER
AS
EXTERNAL NAME [Citect.Ampla.Public.MSSQL.Data.V200806].[Citect.Ampla.Public.MSSQL.Data.V200806.DataStoredProcedure].[GetDataByLocationV200806]
GO
EXEC sys.sp_addextendedproperty @name=N'AutoDeployed', @value=N'yes' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'PROCEDURE',@level1name=N'GetDataByLocationV200806'
GO
EXEC sys.sp_addextendedproperty @name=N'SqlAssemblyFile', @value=N'DataStoredProcedure.cs' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'PROCEDURE',@level1name=N'GetDataByLocationV200806'
GO
EXEC sys.sp_addextendedproperty @name=N'SqlAssemblyFileLine', @value=27 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'PROCEDURE',@level1name=N'GetDataByLocationV200806'

GO

CREATE PROCEDURE [dbo].[GetAuditDataByLocationV200806]
  @module [nvarchar](128),
  @location [nvarchar](4000),
  @setId [nvarchar](512) = N'',
  @editBy [nvarchar](4000) = N'',
  @samplePeriod [nvarchar](4000) = null,
  @startDateLocalTime [datetime] = N'',
  @endDateLocalTime [datetime] = N'',
  @session[nvarchar](128) = null,
  @username[nvarchar](512) = N'ReportUser',
  @password[nvarchar](512) = N'password',
  @serverName[nvarchar](4000) = N'http://localhost:8889/',
  @recordType [nvarchar](128) = N''
WITH EXECUTE AS CALLER
AS
EXTERNAL NAME [Citect.Ampla.Public.MSSQL.Data.V200806].[Citect.Ampla.Public.MSSQL.Data.V200806.AuditDataStoredProcedure].[GetAuditDataByLocationV200806]
GO
EXEC sys.sp_addextendedproperty @name=N'AutoDeployed', @value=N'yes' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'PROCEDURE',@level1name=N'GetAuditDataByLocationV200806'
GO
EXEC sys.sp_addextendedproperty @name=N'SqlAssemblyFile', @value=N'AuditDataStoredProcedure.cs' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'PROCEDURE',@level1name=N'GetAuditDataByLocationV200806'
GO
EXEC sys.sp_addextendedproperty @name=N'SqlAssemblyFileLine', @value=27 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'PROCEDURE',@level1name=N'GetAuditDataByLocationV200806'

GO