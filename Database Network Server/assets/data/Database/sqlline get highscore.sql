SELECT name,score
FROM Highscores
WHERE score != 0
ORDER BY score DESC
LIMIT 10