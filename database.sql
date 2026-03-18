-- Create Database
CREATE DATABASE IF NOT EXISTS SocialMediaDB;
USE SocialMediaDB;

-- 1. UserAccount (Parent Table)
CREATE TABLE UserAccount (
    user_id INT PRIMARY KEY,
    account_creation_year INT,
    subscription_status VARCHAR(50),
    uses_premium_features VARCHAR(50)
);

-- 2. UserDemographics
CREATE TABLE UserDemographics (
    user_id INT PRIMARY KEY,
    age INT,
    gender VARCHAR(20),
    country VARCHAR(100),
    urban_rural VARCHAR(20),
    income_level VARCHAR(50),
    employment_status VARCHAR(50),
    relationship_status VARCHAR(50),
    FOREIGN KEY (user_id) REFERENCES UserAccount(user_id)
);

-- 3. SecuritySettings
CREATE TABLE SecuritySettings (
    user_id INT PRIMARY KEY,
    privacy_setting_level VARCHAR(50),
    two_factor_auth_enabled VARCHAR(10),
    biometric_login_used VARCHAR(10),
    linked_accounts_count INT,
    FOREIGN KEY (user_id) REFERENCES UserAccount(user_id)
);

-- 4. SocialEngagement
CREATE TABLE SocialEngagement (
    user_id INT PRIMARY KEY,
    followers_count INT,
    following_count INT,
    preferred_content_theme VARCHAR(100),
    user_engagement_score FLOAT,
    ads_viewed_per_day INT,
    ads_clicked_per_day INT,
    FOREIGN KEY (user_id) REFERENCES UserAccount(user_id)
);

-- 5. AppUsage
CREATE TABLE AppUsage (
    user_id INT PRIMARY KEY,
    daily_active_minutes_instagram FLOAT,
    sessions_per_day INT,
    posts_created_per_week INT,
    stories_viewed_per_day INT,
    dms_sent_per_week INT,
    dms_received_per_week INT,
    notification_response_rate FLOAT,
    FOREIGN KEY (user_id) REFERENCES UserAccount(user_id)
);

-- 6. HealthLifestyle
CREATE TABLE HealthLifestyle (
    user_id INT PRIMARY KEY,
    exercise_hours_per_week FLOAT,
    sleep_hours_per_night FLOAT,
    smoking VARCHAR(50),
    alcohol_frequency VARCHAR(50),
    perceived_stress_score INT,
    self_reported_happiness INT,
    FOREIGN KEY (user_id) REFERENCES UserAccount(user_id)
);