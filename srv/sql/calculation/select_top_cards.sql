SELECT
  cardRank,
  suitName,
  zoneId,
  zoneName
from
  game_state
  LEFT JOIN zone ON zoneId = zone.id
  LEFT JOIN card ON cardId = card.id
  LEFT JOIN suit ON suitId = suit.id
GROUP BY
  zoneId
ORDER BY zoneId DESC
