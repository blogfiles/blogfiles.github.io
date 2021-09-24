------------------ Droping existing setup -----------------
DROP EXTERNAL DATA SOURCE ADLSG2BLOBDS
DROP DATABASE SCOPED CREDENTIAL ADLSG2Identity

------------ Establish connection to ADLS Gen2 ------------
CREATE DATABASE SCOPED CREDENTIAL ADLSG2Identity
WITH IDENTITY = 'Managed Identity'
GO

CREATE EXTERNAL DATA SOURCE ADLSG2BLOBDS
WITH (
TYPE = BLOB_STORAGE,
LOCATION = 'https://<datalake gen2 account>.blob.core.windows.net/<name of the container>/',
CREDENTIAL = ADLSG2Identity
)
GO
------------ Truncate and perform bulk insert ------------
TRUNCATE TABLE dbo.companies
BULK INSERT dbo.companies
FROM '<path to .csv> excluding container name'
WITH (
DATA_SOURCE='ADLSG2BLOBDS',
FORMAT = 'CSV'
);
GO
SELECT * FROM dbo.companies
