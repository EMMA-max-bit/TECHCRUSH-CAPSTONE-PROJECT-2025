# TECHCRUSH-CAPSTONE-PROJECT-2025
This is where I saved Techcrush Capstone Project documents

## TOPIC: Road Traffic Accident Hotspot Detection and Safety Analysis in Nigeria.
### Group 21 Data Analytics Track, Techcrush

## EXECUTIVE SUMMARY
This report presents a comprehensive analysis of road traffic accidents in Nigeria using real-world data from the Federal Road Safety Corps (FRSC) covering Q1 2023 to Q3 2024. The project aimed to identify accident hotspots, analyze accident severity and causes, and generate data-driven recommendations to improve road safety. Using Microsoft Excel, SQL Server, and Power BI, we explored accident frequency, quarterly trends, top causative factors, and casualty impacts across Nigerian states. Key findings revealed the Federal Capital Territory (FCT), Ogun, and Kaduna as high-risk regions, with speed violation accounting for over 40% of accident causes. This project provides a valuable foundation for policymakers and transportation authorities to implement targeted interventions and reduce accident-related fatalities.

## Acknowledgement
We, Group 21 of the TechCrush Data Analytics Track, wish to express our heartfelt gratitude to God Almighty for granting us the grace, wisdom, and perseverance to successfully complete this capstone project.  We deeply appreciate the unwavering support of our Student Success Executive (SSE), Ms. Mary Oladokun, and our mentors, Ms. Grace Emeruwa and Mr. Olaniyi Eluwole, whose expert guidance and encouragement were invaluable throughout this journey. We also extend sincere thanks to the Federal Road Safety Corps (FRSC) for providing access to public datasets that enabled this real- world analysis.
We recognize the collective efforts and dedication of our team members, each of whom contributed to different phases of the project. Below is an acknowledgment of their contributions, organized by their primary roles within the workflow:

### Data Cleaning, Transformation, and Preparation
1. Ogechi Adiole – Data cleaning, standardization, and transformation.
2. Muhammed Rufai – Excel-based data cleaning, Power Pivot, Pivot Table, and Dashboard setup.
3. Toba Adeshina – Assisted in data validation and transformation tasks.
### Data Extraction, Querying and Analysis.
4. Ewoma Zinno – SQL development and project report writing
5. Ahortor Godslove – SQL querying and ETL (Extract, Transform, Load) processes.
6. Emmanuel Obiesan – Assisted in query testing and dataset troubleshooting.
7. Obademi Grace: Assisted in data extraction.
### Domain Knowledge & Interpretation
8. Precious Okit – Defined acronyms from accident causative factor tables (e.g., SPV, TBT).
9. Akinwumi Hezekiah Akintunde – Assisted in analyzing accident trends.
10. Famure Olatomiwa – Supported analysis and interpretation of accident causes.
11. Oyeshide Victoria – Helped with preliminary topic brainstorming and research inputs.
12. Owo Moses – Conducted road accidents research.
### Visualization, Presentation & Reporting
13. Ikuesiri Sonia Edebiri – Project proposal drafting and PowerPoint presentation design.
14. Terungwa Emmanuel – Power BI visualizations final report input.
15. Alih Emmanuel O. – Power BI dashboard development and final report writing

### Introduction
Road traffic accidents (RTAs) remain a pressing public health and safety challenge in Nigeria. According to the Federal Road Safety Corps (FRSC), thousands of Nigerians are injured or killed annually due to preventable road crashes. Contributing factors include excessive speeding, poor road infrastructure, vehicle conditions, driver behavior, and ineffective emergency response systems. Despite ongoing awareness campaigns, the lack of data-driven interventions  limits the effectiveness of road safety policies and planning.
This project leverages real-world accident data from the FRSC to analyze the severity, frequency, and causative factors of road accidents in Nigeria. Using business intelligence tools and structured data workflows, this project identifies key trends, accident hotspots, and high-risk behaviors, with the ultimate goal of providing actionable safety recommendations to reduce road fatalities and improve transportation safety.

### Project Objectives
The primary objectives of this capstone project are to:

1.  Analyze the frequency and severity of road accidents per state in Nigeria.

2.  Identify patterns and trends based on accident severity (fatal, serious, minor).

3.  Determine the most common causes of road accidents nationally and per state.

4.  Visualize the total casualties and people involved using interactive dashboards.

5.  Generate actionable safety recommendations based on insights from the analysis.

### Data Overview:
National Bureau of Statistics and Federal Road Safety Commission (Q1-2023 to Q3-2024)
### Dataset used:
1.  Road Accident Severity Data: Fields: STATE, STATEID, YEAR, QUARTER, FATAL, SERIOUS, MINOR, TOTAL_CASES, NUMBER_INJURED, NUMBER_KILLED, TOTAL_CASUALTY, PEOPLE_INVOLVED.
2.  Road Accident Causative Factors Data: Fields: STATE, STATEID, YEAR, QUARTER, SPV (Speed Violation), BFL (Brake Failure), MDV (Mechanical Defect), OVL (Overloading), DGD (Dangerous Driving), and others.

### Tools Used:
Microsoft Excel:	Initial data cleaning and formatting
SQL Server:	Data querying, aggregation, and modeling
Power BI:	visualization and Dashboard development.

### Reference Table for Road AccidentCauses.
ACRONYM	      FULL MEANING
1. SPV	      Speed Violation
2. UPD	      Use of Phone while Driving
3. TBT	      Tyre Burst
4. MDV	      Mechanically Deficient Vehicle
5. BFL	      Brake Failure
6. OVL	      Overloading
7. DOT	      Dangerous Overtaking
8. WOT	      Wrongful Overtaking
9. DGD	      Dangerous Driving
10. BRD	      Bad Road
11. RTV	      Route Violation
12. OBS	      Road Obstruction Violation
13. SOS	      Sleeping on Steering
14. DAD	      Drinking Under Alcohol/Drug Influence
15. PWR	      Poor Weather
16. FTQ	      Fatigue
17. SLV	      Sign Light Violation
18. OTH	      Others.

### Analysis Processes
1.  Cleaned and standardized datasets using Excel and added unique STATEID for joins.
2.  Imported the datasets into SQL Server and wrote optimized queries for:
➢    Frequency and severity summaries per state
➢    Quarterly trends
➢    Ranking of top causes per state and nationwide
➢    Casualty and involvement aggregation
3.  Used Power BI to build dynamic visuals and dashboards for stakeholder presentation.
4.  Extracted key insights and synthesized actionable recommendations.













