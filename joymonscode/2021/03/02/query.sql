CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'YourStrongPassword1';
GO
CREATE DATABASE SCOPED CREDENTIAL ADLSG2Identity
WITH IDENTITY = 'Managed Identity';
GO
CREATE EXTERNAL DATA SOURCE ADLSG2BLOBDS
WITH (  
		TYPE = BLOB_STORAGE,
		LOCATION   = 'https://adlsgen2testaccount.blob.core.windows.net/csv/',
          CREDENTIAL = ADLSG2Identity
)
GO
TRUNCATE TABLE dbo.fin_L1_TD_Journal
GO
BULK INSERT dbo.fin_L1_TD_Journal
FROM 'fin_L1_TD_Journal.csv/simplecsv.csv'
WITH 
	(
	DATA_SOURCE = 'ADLSG2BLOBDS',
	FORMAT ='CSV'
	);
GO
SELECT * FROM dbo.fin_L1_TD_Journal

SELECT SERVERPROPERTY ('IsPolyBaseInstalled') AS IsPolyBaseInstalled;

CREATE DATABASE SCOPED CREDENTIAL SAS1
WITH IDENTITY = 'SHARED ACCESS SIGNATURE',
SECRET = 'sv=2020-02-10&sr=d&sig=v38ezkAP5FKqkWDSh3FGD6cCrC9cqmgWjFbvbZclmEY%3D&sdd=1'
GO
CREATE EXTERNAL DATA SOURCE ADLSG2DFSDS
WITH (  
		TYPE = BLOB_STORAGE,
		LOCATION   = 'https://adlsgen2testaccount.dfs.core.windows.net/csv/',
          CREDENTIAL = ADLSG2Identity
)
GO
CREATE EXTERNAL DATA SOURCE SASDS
WITH (  TYPE = BLOB_STORAGE,  
		LOCATION   = 'https://adlsgen2testaccount.dfs.core.windows.net/csv/',
          CREDENTIAL = SAS1
)
