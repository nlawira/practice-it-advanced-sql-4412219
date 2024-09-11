-- Challenge 1
WITH CTE AS (
  SELECT
    EventName,
    LAG(EventName, 1) OVER (ORDER BY EventId ASC) PreviousEvent,
    JULIANDAY(EventDate) - JULIANDAY(LAG(EventDate, 1, EventDate) OVER (ORDER BY EventId ASC)) Gap
  FROM Events
  ORDER BY EventId ASC
  )
SELECT
  EventName,
  PreviousEvent,
  Gap
FROM CTE
WHERE Gap = (
  SELECT
    MAX(Gap)
  FROM
    CTE);

-- Challenge 2
SELECT
  STRFTIME('%Y', EventDate) EventYear,
  STRFTIME('%m', EventDate) EventMonth,
  SUM(TicketPrice) TotalRevenue
FROM Events
GROUP BY
  EventYear,
  EventMonth
ORDER BY
  EventYear ASC,
  EventMonth ASC;