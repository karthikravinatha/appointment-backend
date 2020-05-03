drop function if exists fWMSGetPriceRangeXML;
create function fWMSGetPriceRangeXML(PCategory_ID int, PState_ID int, PCity_ID int) returns text
BEGIN



    DECLARE PPriceRangeXML TEXT DEFAULT '';

#     IF exists(SELECT 1
#               FROM tCategoryPrice
#               WHERE Category_ID = PCategory_ID AND State_ID = PState_ID AND City_ID = PCity_ID)
#     THEN
#
#       SET PPriceRangeXML = (SELECT group_concat(concat("<Range><CategoryPriceID>", Category_Price_ID,
#                                                        "</CategoryPriceID><Lower>", ifnull(Lower_Range, 0),
#                                                        "</Lower><Upper>", ifnull(Upper_Range, 0), "</Upper><Price>",
#                                                        ifnull(Price, 0), "</Price></Range>") SEPARATOR '')
#         AS a
#                             FROM tCategoryPrice
#                             WHERE Category_ID = PCategory_ID AND State_ID = PState_ID AND City_ID = PCity_ID);
#     ELSE IF exists(SELECT 1
#                    FROM tCategoryPrice
#                    WHERE Category_ID = PCategory_ID AND State_ID = PState_ID AND City_ID IS NULL)
#     THEN
#
#       SET PPriceRangeXML = (SELECT group_concat(concat("<Range><CategoryPriceID>", Category_Price_ID,
#                                                        "</CategoryPriceID><Lower>", ifnull(Lower_Range, 0),
#                                                        "</Lower><Upper>", ifnull(Upper_Range, 0), "</Upper><Price>",
#                                                        ifnull(Price, 0), "</Price></Range>") SEPARATOR '')
#         AS a
#                             FROM tCategoryPrice
#                             WHERE Category_ID = PCategory_ID AND State_ID = PState_ID AND City_ID IS NULL);
#     ELSE
#
#       SET PPriceRangeXML = (SELECT group_concat(concat("<Range><CategoryPriceID>", Category_Price_ID,
#                                                        "</CategoryPriceID><Lower>", ifnull(Lower_Range, 0),
#                                                        "</Lower><Upper>", ifnull(Upper_Range, 0), "</Upper><Price>",
#                                                        ifnull(Price, 0), "</Price></Range>") SEPARATOR '')
#         AS a
#                             FROM tCategoryPrice
#                             WHERE Category_ID = PCategory_ID AND State_ID IS NULL AND City_ID IS NULL);
#     END IF;
#     END IF;

    RETURN concat(PPriceRangeXML);
  END;


drop function if exists fWMSGetOperativeCities;
create function fWMSGetOperativeCities(PEntity_ID int) returns text
BEGIN


    DECLARE _return TEXT DEFAULT "";

#     SET _return = (SELECT group_concat(
#         concat('<Item><OperativeCityID>', a._ID, '</OperativeCityID><CityID>', a.City_ID, '</CityID><CityName>',
#                b.City_Name, '</CityName><StateID>', c.State_ID, '</StateID><StateName>', c.State_Name,
#                '</StateName></Item>') SEPARATOR '')
#                    FROM tEntityOperativeCity a
#                      INNER JOIN tCity b ON a.City_ID = b.City_ID
#                      INNER JOIN tState c ON b.State_ID = c.State_ID
#                    WHERE Entity_ID = PEntity_ID);
#
#     IF _return <> '' AND _return IS NOT NULL
#     THEN
#       SET _return = replace(concat('<Root>', _return, '</Root>'), '&', '&amp;');
#     END IF;

    RETURN _return;
  END;


drop function if exists fWMSGetOperativeAreas;
create function fWMSGetOperativeAreas(PEntity_ID int) returns text
BEGIN


    DECLARE _return TEXT DEFAULT "";

#     SET _return = (SELECT group_concat(
#         concat('<Item><OperativeAreaID>', a.Operative_Area_ID, '</OperativeAreaID><OperativeArea>', b.Operative_Area,
#                '</OperativeArea></Item>') SEPARATOR '')
#                    FROM tEntityOperativeArea a
#                      INNER JOIN tOperativeArea b ON a.Operative_Area_ID = b.Operative_Area_ID
#                    WHERE Entity_ID = PEntity_ID);
#
#     IF _return <> '' AND _return IS NOT NULL
#     THEN
#       SET _return = replace(concat('<Root>', _return, '</Root>'), '&', '&amp;');
#     END IF;

    RETURN _return;
  END;


DROP function if exists fWMSGetPOEAttachedXML;
create function fWMSGetPOEAttachedXML(PTransaction_ID int, PTransaction_Type varchar(64),
                                                         PPOE_Type varchar(64)) returns text
BEGIN
    DECLARE pXML TEXT CHARACTER SET utf8
    COLLATE utf8_unicode_ci;


#     SET pXML = (SELECT group_concat(
#         concat("<Item>", "<POE_ID>", ifnull(a.POE_ID, 0), "</POE_ID><Transaction_Type>", ifnull(a.Transaction_Type, ''),
#                "</Transaction_Type><POE_Type>", ifnull(a.POE_Type, ''), "</POE_Type><Name>",
#                CASE WHEN ifnull(b.File_Name, '') = ''
#                  THEN "''"
#                ELSE b.File_Name END, "</Name><File_Original_Name>", CASE WHEN ifnull(b.File_Original_Name, '') = ''
#           THEN "''"
#                                                                     ELSE b.File_Original_Name END,
#                "</File_Original_Name><Type>", CASE WHEN ifnull(b.File_Type, '') = ''
#           THEN "''"
#                                               ELSE b.File_Type END, "</Type><Latitude>", CASE WHEN b.Latitude = ''
#           THEN "''"
#                                                                                          ELSE ifnull(b.Latitude,
#                                                                                                      "''") END,
#                "</Latitude><Longitude>", CASE WHEN b.Longitude = ''
#           THEN "''"
#                                          ELSE ifnull(b.Longitude, "''") END, "</Longitude></Item>") SEPARATOR '')
#                 FROM tPOEHeader a
#                   INNER JOIN tPOEDetail b ON a.POE_ID = b.POE_ID
#                 WHERE a.Transaction_ID = PTransaction_ID AND a.Transaction_Type = PTransaction_Type AND
#                       a.POE_Type = PPOE_Type);
#
#     SET pXML = concat("<Root>", pXML, "</Root>");

    RETURN pXML;

  END;



drop function if exists fWMSGetUserName;
create function fWMSGetUserName(PUser_ID int) returns varchar(1024)
BEGIN
  DECLARE pUser_Name VARCHAR(1024) ;
  SET pUser_Name = (SELECT User_Name FROM tUser WHERE User_ID = PUser_ID) ;
  return pUser_Name ;
END;



drop function if exists fWMSGetEntityType;
create function fWMSGetEntityType(PEntity_ID int) returns varchar(64)
BEGIN
    DECLARE pEntity_Type VARCHAR(64);
    IF PEntity_ID = 0 OR PEntity_ID IS NULL
    THEN
      SET pEntity_Type = 'ENTKARO';
    ELSE
      SET pEntity_Type = (SELECT Entity_Type
                          FROM tEntity
                          WHERE Entity_ID = PEntity_ID
                          LIMIT 0, 1);
    END IF;
    RETURN pEntity_Type;
  END;



DROP function if exists fWMSGetEntityName;
create function fWMSetEntityName(PEntity_ID int) returns varchar(1024)
BEGIN
  DECLARE pEntity_Name VARCHAR(1024) ;
  SET pEntity_Name = (SELECT Entity_Name FROM tEntity WHERE Entity_ID = PEntity_ID) ;
  return pEntity_Name ;
END;



drop function if exists fWMSGetKaroEntityName;
create function fWMSGetKaroEntityName() returns varchar(1024)
BEGIN
    RETURN (SELECT Entity_Name
            FROM tEntity
            WHERE Entity_Type = 'ENTKARO'
            LIMIT 0, 1);
  END;


drop function if exists fWMSGetKaroEntityID;
create function fWMSGetKaroEntityID() returns int
BEGIN
    return (select Entity_ID from tEntity where Entity_Type = 'ENTKARO' limit 0,1 );
  END;



drop function fWMSGetEntityType;
create function fWMSGetEntityType(PEntity_ID int) returns varchar(64)
BEGIN
    DECLARE pEntity_Type VARCHAR(64);
    IF PEntity_ID = 0 OR PEntity_ID IS NULL
    THEN
      SET pEntity_Type = 'ENTKARO';
    ELSE
      SET pEntity_Type = (SELECT Entity_Type
                          FROM tEntity
                          WHERE Entity_ID = PEntity_ID
                          LIMIT 0, 1);
    END IF;
    RETURN pEntity_Type;
  END;



drop function if exists fWMSGetOffset;
create function fWMSGetOffset(PPageNum int, PNumOfRec int) returns int
BEGIN
  DECLARE pOffset INT ;
  if (PPageNum>1) then
    set pOffset = (PPageNum-1)*PNumOfRec ;
  else
    set pOffset = 0;
  end if ;
  return pOffset ;
END;



drop function if exists fWMSGetEntityTree;
create function fWMSGetEntityTree(PUser_ID int, PEntity_Type varchar(64), PInclure_Current_User int,
                                                     PInclude_KARO_Entity int,
                                                     PTarget_Entity_Type varchar(64)) returns text
BEGIN

    DECLARE _entities TEXT DEFAULT "";
    DECLARE _left_node INT;
    DECLARE _right_node INT;


    (SELECT
       Left_Node,
       Right_Node
     INTO _left_node, _right_node
     FROM tHierarchy
     WHERE User_Or_Entity_ID = PUser_ID AND Type = 'USER'
     LIMIT 0, 1);

    IF PInclure_Current_User = 1
    THEN
      SET _entities = (SELECT group_concat(User_Or_Entity_ID)
                       FROM tHierarchy
                       WHERE Type = 'ENTITY' AND Left_Node >= _left_node AND Right_Node <= _right_node);
    ELSE
      SET _entities = (SELECT group_concat(User_Or_Entity_ID)
                       FROM tHierarchy
                       WHERE Type = 'ENTITY' AND Left_Node > _left_node AND Right_Node < _right_node);
    END IF;

    RETURN _entities;

  END;


drop function if exists fWMSGetUploadedPOECount;
create function fWMSGetUploadedPOECount(PHandover_Or_Invoice_ID int, PIs_Inward int) returns int
BEGIN
    IF PIs_Inward = 1
    THEN
      RETURN (SELECT COUNT(*)
              FROM (
                     SELECT
                       DISTINCT c.Document_Configuration_ID
                     FROM tWHGRNHeader a INNER JOIN tWHGRNDocumentHeader b ON a.WH_GRN_ID = b.WH_GRN_ID
                       INNER JOIN tWHGRNDocumentDetail c ON b.Document_ID = c.Document_ID
                     WHERE a.Handover_ID = PHandover_Or_Invoice_ID) x);
    ELSE
      RETURN (SELECT count(*)
              FROM (
                     SELECT DISTINCT d.Document_Configuration_ID
                     FROM tInvoiceHeader a INNER JOIN tRecyclerGRNHeader b ON a.Invoice_Number = b.Invoice_Number
                       INNER JOIN tRecyclerGRNDocumentHeader c ON b.GRN_ID = c.GRN_ID
                       INNER JOIN tRecyclerGRNDocumentDetail d ON c.Document_ID = d.Document_ID
                     WHERE a.Invoice_ID = PHandover_Or_Invoice_ID) x);

    END IF;
  END;


drop function if exists fWMSGetTotalPages;
create function fWMSGetTotalPages(pTotalRec int, PNumOfRec int) returns int
BEGIN
  DECLARE pTotalPages INT ;
  if mod(pTotalRec,PNumOfRec) > 0 then
    set pTotalPages = (floor(pTotalRec/PNumOfRec))+1 ;
  else
    set pTotalPages = (floor(pTotalRec/PNumOfRec)) ;
  end if ;
  return pTotalPages ;
END;


drop function if exists fWMSGetLookUpName;
create function fWMSGetLookUpName(PLookUp_Code varchar(1024)) returns varchar(1024)
BEGIN
    RETURN (SELECT Description
            FROM tLookUp
            WHERE LookUp_Code = PLookUp_Code
            LIMIT 0, 1);
  END;


drop function if exists fWMSGetTotalInspectedQuantity;
create function fWMSGetTotalInspectedQuantity(PCart_ID int) returns text
BEGIN
    DECLARE _qty TEXT;

    SET _qty = (SELECT group_concat(concat(Total_Quantity, '', UOM_Type) SEPARATOR ',') AS Total_Quantity
                FROM (
                       SELECT
                         x.UOM_ID,
                         x.UOM_Type,
                         sum(Total_Quantity) AS Total_Quantity
                       FROM (
                              SELECT
                                a.Cart_ID,
                                f.UOM_ID,
                                g.UOM_Type,
                                sum(ifnull(ci.Inspected_Quantity, 0)) AS Total_Quantity
                              FROM tCart a
                                INNER JOIN tEntity b ON a.Entity_ID = b.Entity_ID
                                INNER JOIN tCartItem ci ON a.Cart_ID = ci.Cart_ID
                                INNER JOIN tCategory f ON ci.Category_ID = f.Category_ID
                                INNER JOIN tUOM g ON f.UOM_ID = g.UOM_ID
                              WHERE
                                a.Cart_ID = PCart_ID
                              GROUP BY a.Cart_ID, f.UOM_ID) x
                       GROUP BY x.UOM_ID) y);
    RETURN _qty;
  END;


drop function if exists fWMSGetEntityIDByUser;
create function fWMSGetEntityIDByUser(PUser_ID int) returns int
BEGIN
    RETURN (SELECT Entity_ID
            FROM tUserEntity
            WHERE User_ID = PUser_ID
            LIMIT 0, 1);
  END;


drop function if exists fWMSGetWHTotalAvailableQuantity;
create function fWMSGetWHTotalAvailableQuantity(PWH_ID int) returns float
BEGIN



    DECLARE _total FLOAT;



    SET _total = (SELECT sum(Closing_Quantity)
                  FROM tWHStockTotal
                  WHERE WH_ID = PWH_ID);
    IF _total < 0
    THEN
      SET _total = 0;
    END IF;

    RETURN _total;

  END;


drop function if exists fWMSCheckIsDocumentRequired;
create function fWMSCheckIsDocumentRequired(PDocument_Configuration_ID int, PType varchar(64), PDate date) returns int
BEGIN
    IF exists(SELECT *
              FROM tRequiredDocumentConfig
              WHERE Document_Configuration_ID = PDocument_Configuration_ID AND Type = PType AND
                    PDate BETWEEN ifnull(From_Date, PDate) AND ifnull(To_Date, PDate))
    THEN
      RETURN 1;
    ELSE
      RETURN 0;
    END IF;
  END;