-- USE DATABASE
USE RoadAccidentDB
SELECT * FROM RoadAccidentCausativeFactorsData
SELECT * FROM RoadAccidentSeverityData

-- Frequency and Severity of Road Traffic Accidents per State 
GO  
CREATE VIEW vw_AccidentFrequencySeverityPerState AS
SELECT 
  MIN(STATEID) AS STATEID, 
  UPPER(LTRIM(RTRIM(STATE))) AS STATE,
  SUM(TRY_CAST(FATAL AS INT)) AS Fatal_Accidents,
  SUM(TRY_CAST(SERIOUS AS INT)) AS Serious_Accidents,
  SUM(TRY_CAST(MINOR AS INT)) AS Minor_Accidents,
  SUM(TRY_CAST(TOTAL_CASES AS INT)) AS Total_Accidents
FROM RoadAccidentSeverityData
GROUP BY UPPER(LTRIM(RTRIM(STATE)));



--Patterns and Trends Based on Accident Severity
GO  
CREATE VIEW vw_AccidentSeverityTrends AS
SELECT 
  YEAR,
  QUARTER,
  SUM(TRY_CAST([FATAL] AS INT)) AS Fatal,
  SUM(TRY_CAST([SERIOUS] AS INT)) AS Serious,
  SUM(TRY_CAST([MINOR] AS INT)) AS Minor,
  SUM(TRY_CAST([TOTAL_CASES] AS INT)) AS Total_Cases
FROM RoadAccidentSeverityData
GROUP BY YEAR, QUARTER;


--Total Casualties and People Involved per State
GO 
CREATE VIEW vw_CasualtiesAndPeopleInvolved AS
SELECT 
  MIN(STATEID) AS STATEID,
  TRIM(STATE) AS STATE,
  SUM(TRY_CAST([NUMBER_INJURED] AS INT)) AS Total_Injured,
  SUM(TRY_CAST([NUMBER_KILLED] AS INT)) AS Total_Killed,
  SUM(TRY_CAST([TOTAL_CASUALTY] AS INT)) AS Total_Casualties,
  SUM(TRY_CAST([PEOPLE_INVOLVED] AS INT)) AS People_Involved
FROM RoadAccidentSeverityData
GROUP BY TRIM(STATE);


-- Most Common Causes of Road Accident Nation-Wide
GO  
CREATE VIEW vw_Causes_TotalNationwide AS
SELECT 
  Cause AS Cause_of_Accident,
  SUM(TRY_CAST(Frequency AS INT)) AS Total
FROM (
	SELECT 
        Cause,
        Frequency
    FROM RoadAccidentCausativeFactorsData
    UNPIVOT (
        Frequency FOR Cause IN (
            [SPV], [UPD], [TBT], [MDV], [BFL], [OVL], [DOT],
            [WOT], [DGD], [BRD], [RTV], [OBS], [SOS],
            [DAD], [PWR], [FTQ], [SLV], [OTHERS]
        )
    ) AS Unpivoted
) AS Causes
GROUP BY Cause;


-- Top 5 Most Common Causes of Road Accidents per State, for Each Year and Quarter
GO
CREATE VIEW vw_Top5CausesPerStateYearQuarter AS
WITH CauseTotals AS (
    SELECT STATEID, STATE, YEAR, QUARTER, 'SPV' AS Cause, SUM(TRY_CAST(SPV AS INT)) AS Total_Cases FROM RoadAccidentCausativeFactorsData GROUP BY STATEID, STATE, YEAR, QUARTER
    UNION ALL SELECT STATEID, STATE, YEAR, QUARTER, 'UPD', SUM(TRY_CAST(UPD AS INT)) FROM RoadAccidentCausativeFactorsData GROUP BY STATEID, STATE, YEAR, QUARTER
    UNION ALL SELECT STATEID, STATE, YEAR, QUARTER, 'TBT', SUM(TRY_CAST(TBT AS INT)) FROM RoadAccidentCausativeFactorsData GROUP BY STATEID, STATE, YEAR, QUARTER
    UNION ALL SELECT STATEID, STATE, YEAR, QUARTER, 'MDV', SUM(TRY_CAST(MDV AS INT)) FROM RoadAccidentCausativeFactorsData GROUP BY STATEID, STATE, YEAR, QUARTER
    UNION ALL SELECT STATEID, STATE, YEAR, QUARTER, 'BFL', SUM(TRY_CAST(BFL AS INT)) FROM RoadAccidentCausativeFactorsData GROUP BY STATEID, STATE, YEAR, QUARTER
    UNION ALL SELECT STATEID, STATE, YEAR, QUARTER, 'OVL', SUM(TRY_CAST(OVL AS INT)) FROM RoadAccidentCausativeFactorsData GROUP BY STATEID, STATE, YEAR, QUARTER
    UNION ALL SELECT STATEID, STATE, YEAR, QUARTER, 'DOT', SUM(TRY_CAST(DOT AS INT)) FROM RoadAccidentCausativeFactorsData GROUP BY STATEID, STATE, YEAR, QUARTER
    UNION ALL SELECT STATEID, STATE, YEAR, QUARTER, 'WOT', SUM(TRY_CAST(WOT AS INT)) FROM RoadAccidentCausativeFactorsData GROUP BY STATEID, STATE, YEAR, QUARTER
    UNION ALL SELECT STATEID, STATE, YEAR, QUARTER, 'DGD', SUM(TRY_CAST(DGD AS INT)) FROM RoadAccidentCausativeFactorsData GROUP BY STATEID, STATE, YEAR, QUARTER
    UNION ALL SELECT STATEID, STATE, YEAR, QUARTER, 'BRD', SUM(TRY_CAST(BRD AS INT)) FROM RoadAccidentCausativeFactorsData GROUP BY STATEID, STATE, YEAR, QUARTER
    UNION ALL SELECT STATEID, STATE, YEAR, QUARTER, 'RTV', SUM(TRY_CAST(RTV AS INT)) FROM RoadAccidentCausativeFactorsData GROUP BY STATEID, STATE, YEAR, QUARTER
    UNION ALL SELECT STATEID, STATE, YEAR, QUARTER, 'OBS', SUM(TRY_CAST(OBS AS INT)) FROM RoadAccidentCausativeFactorsData GROUP BY STATEID, STATE, YEAR, QUARTER
    UNION ALL SELECT STATEID, STATE, YEAR, QUARTER, 'SOS', SUM(TRY_CAST(SOS AS INT)) FROM RoadAccidentCausativeFactorsData GROUP BY STATEID, STATE, YEAR, QUARTER
    UNION ALL SELECT STATEID, STATE, YEAR, QUARTER, 'DAD', SUM(TRY_CAST(DAD AS INT)) FROM RoadAccidentCausativeFactorsData GROUP BY STATEID, STATE, YEAR, QUARTER
    UNION ALL SELECT STATEID, STATE, YEAR, QUARTER, 'PWR', SUM(TRY_CAST(PWR AS INT)) FROM RoadAccidentCausativeFactorsData GROUP BY STATEID, STATE, YEAR, QUARTER
    UNION ALL SELECT STATEID, STATE, YEAR, QUARTER, 'FTQ', SUM(TRY_CAST(FTQ AS INT)) FROM RoadAccidentCausativeFactorsData GROUP BY STATEID, STATE, YEAR, QUARTER
    UNION ALL SELECT STATEID, STATE, YEAR, QUARTER, 'SLV', SUM(TRY_CAST(SLV AS INT)) FROM RoadAccidentCausativeFactorsData GROUP BY STATEID, STATE, YEAR, QUARTER
    UNION ALL SELECT STATEID, STATE, YEAR, QUARTER, 'OTHERS', SUM(TRY_CAST(OTHERS AS INT)) FROM RoadAccidentCausativeFactorsData GROUP BY STATEID, STATE, YEAR, QUARTER
),
CauseRanked AS (
    SELECT 
        STATEID,
        STATE,
        YEAR,
        QUARTER,
        Cause,
        Total_Cases,
        ROW_NUMBER() OVER (PARTITION BY STATEID, YEAR, QUARTER ORDER BY Total_Cases DESC) AS Cause_Rank
    FROM CauseTotals
)
SELECT 
    STATEID,
    STATE,
    YEAR,
    QUARTER,
    Cause,
    Total_Cases,
    Cause_Rank
FROM CauseRanked
WHERE Cause_Rank <= 5;

