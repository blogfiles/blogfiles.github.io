CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'YourStrongPassword1';
GO
CREATE DATABASE SCOPED CREDENTIAL ADLSG2Identity
WITH IDENTITY = 'Managed Identity';
GO
-- The location should be blob.core.windows.net cannot be dfs.core.windows.net
CREATE EXTERNAL DATA SOURCE ADLSG2BLOBDS
WITH (  
		TYPE = BLOB_STORAGE,
		LOCATION   = 'https://<adlsgen2account>.blob.core.windows.net/<container>/',
          CREDENTIAL = ADLSG2Identity
)
GO
BULK INSERT dbo.[table name]
FROM '<path to .csv> excluding container name'
WITH 
	(
	DATA_SOURCE = 'ADLSG2BLOBDS',
	FORMAT ='CSV'
	);
GO
SELECT * FROM dbo.[table name]
--Below is just to check whether the polybase is enabled or not.
SELECT SERVERPROPERTY ('IsPolyBaseInstalled') AS IsPolyBaseInstalled;