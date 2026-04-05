use esmel
-- Average youth unemployment by schooling segment
SELECT
    schooling_segment,
    ROUND(AVG(youth_unemployment_rates), 2) AS average_unemployment,
    ROUND(AVG(secondary_school_enrollment_rates), 2) AS average_schooling,
    COUNT(DISTINCT country) AS country_nb
FROM worldbankeducationemploi
WHERE schooling_segment IS NOT NULL
GROUP BY schooling_segment
ORDER BY average_unemployment DESC;

-- Average youth unemployment by education spending segment
SELECT
    education_effort_segment,
    ROUND(AVG(youth_unemployment_rates), 2) AS average_unemployment,
    ROUND(AVG(education_spending_gdp), 2) AS average_spending,
    COUNT(DISTINCT country) AS country_nb
FROM worldbankeducationemploi
WHERE education_effort_segment IS NOT NULL
GROUP BY education_effort_segment
ORDER BY average_spending DESC;

-- Top 15 countries with worst efficiency ratio (high unemployment despite spending)
SELECT
    country,
    ROUND(AVG(efficiency_ratio), 2) AS average_ratio,
    ROUND(AVG(youth_unemployment_rates), 2) AS average_unemployment,
    ROUND(AVG(education_spending_gdp), 2) AS average_spending
FROM worldbankeducationemploi
WHERE efficiency_ratio IS NOT NULL
GROUP BY country
ORDER BY average_ratio DESC
LIMIT 15;

-- Average youth unemployment by decade
SELECT
    decade,
    ROUND(AVG(youth_unemployment_rates), 2) AS average_unemployment,
    ROUND(AVG(secondary_school_enrollment_rates), 2) AS average_schooling,
    COUNT(DISTINCT country) AS country_nb
FROM worldbankeducationemploi
WHERE decade IS NOT NULL
GROUP BY decade
ORDER BY decade ASC;

-- Countries with best improvement in youth unemployment (first vs last year available)
SELECT
    country,
    MIN(year) AS first_year,
    MAX(year) AS last_year,
    ROUND(MIN(youth_unemployment_rates), 2) AS unemployment_start,
    ROUND(MAX(youth_unemployment_rates), 2) AS unemployment_end,
    ROUND(MIN(youth_unemployment_rates) - MAX(youth_unemployment_rates), 2) AS improvement
FROM worldbankeducationemploi
GROUP BY country
HAVING COUNT(year) > 5
ORDER BY improvement DESC
LIMIT 15;

-- Cross-tabulation: schooling segment vs unemployment segment
SELECT
    schooling_segment,
    unemployment_segment,
    COUNT(DISTINCT country) AS country_nb,
    ROUND(AVG(youth_unemployment_rates), 2) AS average_unemployment
FROM worldbankeducationemploi
WHERE schooling_segment IS NOT NULL
  AND unemployment_segment IS NOT NULL
GROUP BY schooling_segment, unemployment_segment
ORDER BY schooling_segment, unemployment_segment;

-- Top countries with highest youth unemployment in most recent year
SELECT
    country,
    year,
    youth_unemployment_rates,
    secondary_school_enrollment_rates,
    unemployment_segment
FROM worldbankeducationemploi
WHERE year = (SELECT MAX(year) FROM worldbankeducationemploi)
  AND unemployment_segment = 'Critical'
ORDER BY youth_unemployment_rates DESC
LIMIT 10;

-- Average schooling and unemployment by decade to observe correlation trend
SELECT
    decade,
    ROUND(AVG(secondary_school_enrollment_rates), 2) AS average_schooling,
    ROUND(AVG(youth_unemployment_rates), 2) AS average_unemployment,
    ROUND(AVG(education_spending_gdp), 2) AS average_spending,
    COUNT(DISTINCT country) AS country_nb
FROM worldbankeducationemploi
WHERE decade IS NOT NULL
GROUP BY decade
ORDER BY decade ASC;

-- Best performing countries: high schooling + low unemployment
SELECT
    country,
    ROUND(AVG(secondary_school_enrollment_rates), 2) AS average_schooling,
    ROUND(AVG(youth_unemployment_rates), 2) AS average_unemployment,
    ROUND(AVG(education_spending_gdp), 2) AS average_spending,
    ROUND(AVG(efficiency_ratio), 2) AS average_efficiency_ratio
FROM worldbankeducationemploi
WHERE schooling_segment = 'High'
  AND unemployment_segment = 'Low'
GROUP BY country
ORDER BY average_unemployment ASC
LIMIT 15;

-- Average unemployment change by education spending bracket
SELECT
    education_effort_segment,
    ROUND(AVG(youth_unemployment_rates), 2) AS average_unemployment,
    ROUND(AVG(unemployment_variation), 2) AS annual_average_variation,
    ROUND(AVG(efficiency_ratio), 2) AS average_efficiency,
    COUNT(DISTINCT country) AS country_nb
FROM worldbankeducationemploi
WHERE education_effort_segment IS NOT NULL
  AND unemployment_variation IS NOT NULL
GROUP BY education_effort_segment
ORDER BY average_unemployment ASC;