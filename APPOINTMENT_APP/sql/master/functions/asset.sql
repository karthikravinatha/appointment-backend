DROP FUNCTION IF EXISTS fGetOffset;
CREATE FUNCTION fGetOffset(PPageNum INT, PNumOfRec INT) RETURNS INT
BEGIN
  DECLARE pOffset INT;
  if (PPageNum > 1) then
    set pOffset = (PPageNum - 1) * PNumOfRec ;
  else
    set pOffset = 0;
  end if;
  return pOffset;
END;

DROP FUNCTION IF EXISTS fGetTotalPages;
CREATE FUNCTION fGetTotalPages(pTotalRec INT, PNumOfRec INT) RETURNS INT
BEGIN
  DECLARE pTotalPages INT;
  if mod(pTotalRec, PNumOfRec) > 0 then
    set pTotalPages = (floor(pTotalRec / PNumOfRec)) + 1 ;
  else
    set pTotalPages = (floor(pTotalRec / PNumOfRec)) ;
  end if;
  return pTotalPages;
END;