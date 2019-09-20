-- 5
SELECT color, city FROM detail;
-- 9
SELECT detail_id
FROM provider_project_detail_number
JOIN provider
ON provider_project_detail_number.provider_id = provider.id
WHERE provider.city = 'Лондон';
-- 10
SELECT detail_id
FROM provider_project_detail_number
JOIN provider
ON provider_project_detail_number.provider_id = provider.id
JOIN project
ON provider_project_detail_number.project_id = project.id
WHERE provider.city = 'Лондон'
  AND project.city = 'Лондон';
-- 15
SELECT DISTINCT COUNT(*) FROM provider_project_detail_number AS delivery
WHERE delivery.provider_id = 'П1';
-- 20
SELECT detail.color FROM detail
JOIN provider_project_detail_number AS delivery
ON delivery.detail_id = detail.id
WHERE delivery.provider_id = 'П1';
-- 21
SELECT DISTINCT p.detail_id
FROM provider_project_detail_number AS p
JOIN provider
ON p.provider_id = provider.id
WHERE provider.city = 'Лондон';
-- 23
SELECT DISTINCT provider.*
FROM provider
JOIN provider_project_detail_number AS p
ON p.provider_id = provider.id
WHERE p.detail_id IN (
  SELECT DISTINCT p.detail_id
  FROM provider_project_detail_number AS p
  WHERE p.provider_id IN (
    SELECT DISTINCT p.provider_id
    FROM provider_project_detail_number AS p
    JOIN provider
    ON provider.id = p.provider_id
    JOIN detail
    ON detail.id = p.detail_id
    WHERE detail.color = 'Красный'
  )
);
-- 27
SELECT p.project_id
FROM provider_project_detail_number AS p
WHERE p.detail_id = 'Д1'
GROUP BY p.project_id
HAVING SUM(p.quantity) > (
  SELECT AVG(p1.quantity)
  FROM provider_project_detail_number AS p1
  WHERE p1.detail_id = 'Д1' AND p1.project_id = p.project_id
  GROUP BY p1.project_id
);
-- 29
SELECT project.id
FROM project
WHERE NOT project.id IN (
  SELECT DISTINCT p.project_id
  FROM provider_project_detail_number AS p
  WHERE p.provider_id IN (
    SELECT provider.id
    FROM provider
    WHERE NOT provider.id = 'П1'
  )
);
-- 33
SELECT detail.city FROM detail
UNION
SELECT provider.city FROM provider
UNION
SELECT project.city FROM project;
