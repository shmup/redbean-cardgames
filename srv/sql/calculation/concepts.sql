SELECT
  zoneName,
  zoneId,
  suitName,
  cardRank
FROM
  (
    SELECT
      id,
      zoneId,
      cardId,
      ROW_NUMBER() OVER (
        PARTITION BY
          zoneId
      ) as grouping
    FROM
      game_state
  ) thing
  JOIN zone ON zoneId = zone.id
  JOIN card ON cardId = card.id
  JOIN suit ON suitId = suit.id
WHERE
  thing.grouping <= 4
  AND zoneId != 1
ORDER BY
  zoneName
