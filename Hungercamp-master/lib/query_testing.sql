-- SELECT users.id, SUM(assignments.ruby_points * 
--                 (CASE WHEN responses.rating = 1 THEN 1 
--                       WHEN responses.rating = 2 THEN 0.75
--                                                 ELSE 0.5 END))
-- FROM users
-- INNER JOIN responses ON users.id = responses.user_id
-- INNER JOIN assignments ON responses.assignment_id = assignments.id
-- GROUP BY users.id;


-- SELECT users.id, (strftime('%s', users.time_of_death) - strftime('%s','now'))/(60 * 60) as time_left FROM users;

SELECT users.id, CASE WHEN SUM(assignments.ruby_points * (CASE WHEN responses.rating = 1 THEN 1 WHEN responses.rating = 2 THEN 0.75 ELSE 0.5 END)) IS NULL THEN 0 ELSE SUM(assignments.ruby_points * (CASE WHEN responses.rating = 1 THEN 1 WHEN responses.rating = 2 THEN 0.75 ELSE 0.5 END)) END as all_points FROM "users" LEFT OUTER JOIN responses ON users.id = responses.user_id LEFT OUTER JOIN assignments ON responses.assignment_id = assignments.id GROUP BY users.id;

