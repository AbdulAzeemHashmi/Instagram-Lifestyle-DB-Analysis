USE SocialMediaDB;

-- 1. Top 10 High Engagement Users (>2 hours/day)
SELECT u.user_id, s.user_engagement_score 
FROM AppUsage u JOIN SocialEngagement s ON u.user_id = s.user_id 
WHERE u.daily_active_minutes_instagram > 120 
ORDER BY s.user_engagement_score DESC LIMIT 10;

-- 2. Average time spent: Urban vs Rural
SELECT d.urban_rural, AVG(a.daily_active_minutes_instagram) 
FROM UserDemographics d JOIN AppUsage a ON d.user_id = a.user_id 
GROUP BY d.urban_rural;

-- 3. Users with High Stress (>7) and High Activity (>100 mins)
SELECT h.user_id FROM HealthLifestyle h 
JOIN AppUsage a ON h.user_id = a.user_id 
WHERE h.perceived_stress_score > 7 AND a.daily_active_minutes_instagram > 100;

-- 4. Avg minutes by Age Group and Gender
SELECT CASE WHEN age < 25 THEN '<25' WHEN age BETWEEN 25 AND 34 THEN '25-34' WHEN age BETWEEN 35 AND 44 THEN '35-44' ELSE '45+' END AS age_group, 
gender, AVG(daily_active_minutes_instagram) 
FROM UserDemographics d JOIN AppUsage a ON d.user_id = a.user_id 
GROUP BY age_group, gender;

-- 5. Highest average followers country
SELECT d.country, AVG(s.followers_count) 
FROM UserDemographics d JOIN SocialEngagement s ON d.user_id = s.user_id 
GROUP BY d.country ORDER BY AVG(s.followers_count) DESC LIMIT 1;

-- 6. Happiness: Smokers vs Non-smokers (Exercise > 5 hrs)
SELECT smoking, (exercise_hours_per_week > 5) as regular_exercise, AVG(self_reported_happiness) 
FROM HealthLifestyle GROUP BY smoking, regular_exercise;

-- 7. High Income Users: Frequent Theme & Response Rate
SELECT s.preferred_content_theme, AVG(a.notification_response_rate) 
FROM UserDemographics d JOIN SocialEngagement s ON d.user_id = s.user_id 
JOIN AppUsage a ON d.user_id = a.user_id 
WHERE d.income_level = 'High' GROUP BY s.preferred_content_theme 
ORDER BY COUNT(*) DESC LIMIT 1;

-- 8. Theme with highest engagement score
SELECT preferred_content_theme, AVG(user_engagement_score) 
FROM SocialEngagement GROUP BY preferred_content_theme 
ORDER BY AVG(user_engagement_score) DESC LIMIT 1;

-- 9. Alcohol Frequency vs Instagram Usage
SELECT h.alcohol_frequency, AVG(a.daily_active_minutes_instagram) 
FROM HealthLifestyle h JOIN AppUsage a ON h.user_id = a.user_id 
GROUP BY h.alcohol_frequency;

-- 10. Ads Clicked (Stories > 20 vs <= 5 for Followers > 500)
SELECT (a.stories_viewed_per_day > 20) as heavy_story_viewer, AVG(s.ads_clicked_per_day) 
FROM AppUsage a JOIN SocialEngagement s ON a.user_id = s.user_id 
WHERE s.followers_count > 500 AND (a.stories_viewed_per_day > 20 OR a.stories_viewed_per_day <= 5) 
GROUP BY heavy_story_viewer;