/* User Engagement */

SELECT AVG(photos_count) AS average_photos_per_user, COUNT(user_id), SUM(photos_count)
FROM (
    SELECT user_id, COUNT(*) AS photos_count
    FROM photos
    GROUP BY user_id
) AS user_photos;

/* Bots & Fake Account */

SELECT likes.user_id, users.username as BOT_ACC
FROM users
JOIN likes ON users.id = likes.user_id
LEFT JOIN photos ON photos.id = likes.photo_id
GROUP BY likes.user_id, users.username
HAVING COUNT(DISTINCT photos.id) = (SELECT COUNT(*) FROM photos);