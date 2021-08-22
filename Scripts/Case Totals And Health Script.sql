SELECT   [Continent]
		,[Country]
		,[Date] as 'Date'
		--,[total_cases] 
		,[Cases Per Date]
		--,[total_deaths]
		,[Deaths Per Date]
		--,[total_tests]
		,[Tests Per Date]
		--,[people_fully_vaccinated]
		,[Vaccinations Per Date]
		,[population], TRY_CONVERT( DECIMAL, [population] ) AS 'Population Per Date'		--Convert var to decimal else null--
		,[GDP Per Capita]
		,[Extreme Poverty Pertentage]
		,[Cardiovascular Death Rate]
		,[Diabetes Prevalence]
		,[Female Smokers]
		,[Male Smokers]
FROM [COVID Project].[dbo].[Clean-COVID-Data]
ORDER BY [Continent]


--Change NULL to 0--
UPDATE [COVID Project].DBO.[Clean-COVID-Data]
SET [Cases Per Date] = 0 WHERE [Cases Per Date] = NULL

UPDATE [COVID Project].DBO.[Clean-COVID-Data]
SET [Deaths Per Date] = 0 WHERE [Deaths Per Date] = NULL

UPDATE [COVID Project].DBO.[Clean-COVID-Data]
SET [Tests Per Date] = 0 WHERE [Tests Per Date] = NULL

UPDATE [COVID Project].DBO.[Clean-COVID-Data]
SET [Vaccinations Per Date] = 0 WHERE [Vaccinations Per Date] = NULL
----------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------


--Creating Health Table--
SELECT 
Country,
CAST(Population AS DECIMAL) AS 'Population',
MAX([GDP Per Capita]) as 'GDP Per Capita',
MAX([Extreme Poverty Pertentage]) as 'Extreme Poverty Pertentage',
MAX([Cardiovascular Death Rate]) as 'Cardiovascular Death Rate',
MAX([Diabetes Prevalence]) as 'Diabetes Prevalence',
MAX([Female Smokers]) as 'Percent Female Smokers',
MAX([Male Smokers]) as 'Percent Male Smokers'
FROM [COVID Project].dbo.[Clean-COVID-Data]
GROUP BY Country, [Population]
ORDER BY Country

--Removing unnecessary rows (where country column is populated by continent and countries without data)--
DELETE FROM [COVID Project].dbo.[Clean-COVID-Data]
WHERE [GDP Per Capita]=''

DELETE FROM [COVID Project].dbo.[Clean-COVID-Data]
WHERE [Cardiovascular Death Rate]=''
----------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------



--Creating Up-To-Date Table For Total Cases, Vaccinations, Tests, etc.--
SELECT 
[Country], 
CAST(Population AS DECIMAL) AS 'Population',
MAX(CAST([Cases Per Date] AS DECIMAL)) as 'Total Cases',
MAX(CAST([Deaths Per Date] AS DECIMAL)) as 'Total Deaths',
MAX(CAST([Tests Per Date] AS DECIMAL)) as 'Total Tests',
MAX(CAST([Vaccinations Per Date] AS DECIMAL)) as 'Vaccinations Per Date',

--Creating Percentage Stats--
LEFT(MAX(CAST([Cases Per Date] AS DECIMAL)) / [Population], 6) AS 'Percent Infected',
LEFT(MAX(CAST([Vaccinations Per Date] AS DECIMAL)) / [Population], 6) AS 'Percent Vaccinated',
LEFT(MAX(CAST([Tests Per Date] AS DECIMAL)) / [Population], 6) AS 'Percentage Tested',
LEFT(MAX(CAST([Deaths Per Date] AS DECIMAL)) / MAX(CAST([Cases Per Date] AS DECIMAL)), 6) AS 'Death Rate',
LEFT(MAX(CAST([Tests Per Date] AS DECIMAL)) / MAX(CAST([Cases Per Date] AS DECIMAL)), 6) AS ' Infected Testing Rate',
LEFT(MAX(CAST([Vaccinations Per Date] AS DECIMAL)) / MAX(CAST([Cases Per Date] AS DECIMAL)), 6) AS 'Vaccination Rate'

FROM [COVID Project].dbo.[Clean-COVID-Data]
GROUP BY [Country], Population
ORDER BY [Country]

--Removing unnecessary rows--
DELETE FROM [COVID Project].dbo.[Clean-COVID-Data]
WHERE [Cases Per Date]='' OR [Deaths Per Date]='' OR [Tests Per Date]='' OR [Vaccinations Per Date]='' OR [Cases Per Date]=0
