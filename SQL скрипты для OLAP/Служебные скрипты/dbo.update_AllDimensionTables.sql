SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID('[dbo].[update_AllDimensionTables]','P') IS NOT NULL
	DROP PROCEDURE [dbo].[update_AllDimensionTables]
GO

CREATE PROCEDURE [dbo].[update_AllDimensionTables]
AS
BEGIN

	EXEC dbo.update_Business
	EXEC dbo.update_CustomersTypes

END
GO
