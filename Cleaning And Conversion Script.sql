--Cleaning and converting vars to decimals, then to integers. Return NULL if blank for future code. CONVERT command will not take blank entry--
SELECT 
		 --[iso_code]
		 [continent] as 'Continent'
		,[location] as 'Country'
		,[date] as 'Date'
		,[total_cases], CONVERT( INT,TRY_CONVERT( DECIMAL, total_cases )) AS 'Cases Per Date'
		--,[new_cases]
		--,[new_cases_smoothed]
		,[total_deaths], CONVERT( INT, TRY_CONVERT( DECIMAL, total_deaths )) AS 'Deaths Per Date'
		--,[new_deaths]
		--,[new_deaths_smoothed]
		--,[total_cases_per_million]
		--,[new_cases_per_million]
		--,[new_cases_smoothed_per_million]
		--,[total_deaths_per_million]
		--,[new_deaths_per_million]
		--,[new_deaths_smoothed_per_million]
		--,[reproduction_rate]
		--,[icu_patients]
		--,[icu_patients_per_million]
		--,[hosp_patients]
		--,[hosp_patients_per_million]
		--,[weekly_icu_admissions]
		--,[weekly_icu_admissions_per_million]
		--,[weekly_hosp_admissions]
		--,[weekly_hosp_admissions_per_million]
		--,[new_tests]
		  ,[total_tests], CONVERT( INT, TRY_CONVERT( DECIMAL, total_tests )) AS 'Tests Per Date'
		--,[total_tests_per_thousand]
		--,[new_tests_per_thousand]
		--,[new_tests_smoothed]
		--,[new_tests_smoothed_per_thousand]
		--,[positive_rate]
		--,[tests_per_case]
		--,[tests_units]
		--,[total_vaccinations]
		--,[people_vaccinated]
		,[people_fully_vaccinated], CONVERT( INT, TRY_CONVERT( DECIMAL, people_fully_vaccinated )) AS 'Vaccinations Per Date'
		--,[total_boosters]
		--,[new_vaccinations]
		--,[new_vaccinations_smoothed]
		--,[total_vaccinations_per_hundred]
		--,[people_vaccinated_per_hundred]
		--,[people_fully_vaccinated_per_hundred]
		--,[total_boosters_per_hundred]
		--,[new_vaccinations_smoothed_per_million]
		--,[stringency_index]
		,[population] as 'Population Per Date'
		--,[population_density]
		--,[median_age]
		--,[aged_65_older]
		--,[aged_70_older]
		,[gdp_per_capita] as 'GDP Per Capita'
		,[extreme_poverty] as 'Extreme Poverty Pertentage'
		,[cardiovasc_death_rate] as 'Cardiovascular Death Rate'
		,[diabetes_prevalence] as 'Diabetes Prevalence'
		,[female_smokers] as 'Female Smokers'
		,[male_smokers] as 'Male Smokers'
		--,[handwashing_facilities]
		--,[hospital_beds_per_thousand]
		--,[life_expectancy]
		--,[human_development_index]
		--,[excess_mortality]
FROM [COVID Project].[dbo].[COVID-Data]