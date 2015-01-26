SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID('[dbo].[updateReceivablesOfCustomers]','P') IS NOT NULL
	DROP PROCEDURE [dbo].[updateReceivablesOfCustomers]
GO

-- =============================================
-- Author:		<Author,,Valentin Avramko>
-- Create date: <Create Date,,05.01.2015>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[updateReceivablesOfCustomers]
	@StartDate date,
	@EndDate date
AS
BEGIN

	WHILE @StartDate <= @EndDate
	BEGIN

		DELETE
		FROM dbo.t_ReceivablesOfCustomers
		WHERE ДатаЗадолженности = @StartDate

		INSERT INTO dbo.t_ReceivablesOfCustomers
		SELECT
			@StartDate AS ДатаЗадолженности
			,*
		FROM [dbo].[getReceivablesOfCustomers] (@StartDate)

		SET @StartDate = DATEADD(dd, 1, @StartDate)
	END

END
GO
