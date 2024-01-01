Demographic Insights 

-- Ques 1a: Who prefers energy drink more? (male/female/non-binary?)
SELECT Gender, COUNT(Respondent_ID) AS Count
FROM dim_repondents
GROUP BY Gender
ORDER BY Count DESC;

-- Ques 1b: Which age group prefers energy drinks more?
SELECT Age, COUNT(Respondent_ID) AS Count
FROM dim_repondents
GROUP BY Age;

-- Ques 1c: Which type of marketing reaches the most Youth (15-30)?
SELECT Marketing_channels, COUNT(*) AS Count
FROM fact_survey_responses
JOIN dim_repondents ON fact_survey_responses.Respondent_ID = 
dim_repondents.Respondent_ID
WHERE dim_repondents.Age BETWEEN 15 AND 30
GROUP BY Marketing_channels
ORDER BY Count DESC;

Consumer Preferences

-- Ques 2a: What are the preferred ingredients of energy drinks among respondents?
SELECT Ingredients_expected, COUNT(Respondent_ID) AS Count
FROM fact_survey_responses
GROUP BY Ingredients_expected
ORDER BY Count DESC;

-- Ques 2b: What packaging preferences do respondents have for energy drinks?
SELECT Packaging_preference, COUNT(Respondent_ID) AS Count_of_resp
FROM fact_survey_responses
GROUP BY Packaging_preference
ORDER BY Count_of_resp DESC;

Competition Analysis

-- Ques 3a: Who are the current market leaders
SELECT Current_brands, COUNT(Respondent_ID) AS Count_Current_Brand
FROM fact_survey_responses
GROUP BY Current_brands
ORDER BY Count_Current_Brand DESC;

-- Ques 3b: What are the primary reasons consumers prefer those brands over ours?
SELECT Reasons_for_choosing_brands, COUNT(Respondent_ID) AS Count
FROM fact_survey_responses
GROUP BY Reasons_for_choosing_brands
ORDER BY Count DESC;

 Marketing Channels and Brand Awareness

-- Ques 4 : Which marketing channel can be used to reach more customers?
SELECT Marketing_channels, COUNT(Respondent_ID) AS Count
FROM fact_survey_responses
GROUP BY Marketing_channels
ORDER BY Count DESC;

Brand Penetration

-- Ques 5a : What do people think about our brand? (overall rating)
 select Heard_before , count(Respondent_ID) as Count
 from fact_survey_responses
 group by Heard_before 
 order by Count DESC

 select Tried_before , count(Respondent_ID) as Count
 from fact_survey_responses
 where Heard_before='Yes'
 group by Tried_before
 order by Count DESC

 select Taste_experience , count(respondent_ID) as Count
 from fact_survey_responses
 where Heard_before='yes' and Tried_before='yes'
 group by Taste_experience
 order by Count DESC

-- Ques 5b : Which cities do we need to focus more on?
SELECT c.City, c.Tier, COUNT(r.respondent_ID) AS Count
FROM dim_cities AS c
JOIN dim_repondents AS r ON c.City_ID = r.City_ID
GROUP BY c.City, c.Tier
ORDER BY Count DESC;

Purchase Behavior 

-- Ques 6a: Where do respondents prefer to purchase energy drinks?
SELECT Purchase_location, COUNT(Respondent_ID) AS Count
FROM fact_survey_responses
GROUP BY Purchase_location
ORDER BY Count DESC;

-- Ques 6b: What are the typical consumption situations for energy drinks among respondents?
SELECT Typical_consumption_situations AS TCS, COUNT(Respondent_ID) AS Count
FROM fact_survey_responses
GROUP BY TCS
ORDER BY Count DESC;

-- Ques 6c: What factors influence respondents' purchase decisions, such as 
price range and limited edition packaging?
SELECT Limited_edition_packaging, COUNT(Respondent_ID) AS Count
FROM fact_survey_responses
GROUP BY Limited_edition_packaging
ORDER BY Count DESC;

SELECT Price_range, COUNT(Respondent_ID) AS Count
FROM fact_survey_responses
GROUP BY Price_range
ORDER BY Count DESC;

-- Ques 7 Which area of business should we focus more on our product development?
select Reasons_for_choosing_brands as Reasons ,
count(Respondent_ID) as Count
from fact_survey_responses 
where Current_brands='CodeX' 
Group by Reasons 
order by Count DESC
