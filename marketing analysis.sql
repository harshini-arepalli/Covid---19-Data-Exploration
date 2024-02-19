/* loyal user reward*/

SELECT id, username, created_at AS Registration_date
FROM users 
ORDER BY created_at
LIMIT 5;


/* Inactive user engagement */

SELECT id, username
FROM users
WHERE id NOT IN(SELECT DISTINCT user_id FROM photos);

/* Contest Winner Declaration */

SELECT photos.id AS photo_id, users.username, COUNT(likes.photo_id) AS likes_count
FROM likes
JOIN photos ON photos.id = likes.photo_id
JOIN users on users.id = photos.user_id
GROUP BY photos.id, photos.user_id, users.username
ORDER BY likes_count DESC
LIMIT 1;

/* Hashtag Research */

SELECT tags.tag_name, COUNT(photo_tags.tag_id) as tags_count
FROM tags
JOIN photo_tags on tags.id = photo_tags.tag_id
GROUP BY tags.id, tags.tag_name
ORDER BY tags_count
LIMIT 5;

/* Ad Campaign launch */

SELECT DAYNAME(created_at) as Registered_day, COUNT(id) as registration_count
FROM users
GROUP BY Registered_day
ORDER BY registration_count DESC
LIMIT 1;