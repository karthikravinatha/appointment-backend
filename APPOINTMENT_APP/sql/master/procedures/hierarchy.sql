DROP PROCEDURE IF EXISTS shierarchyAdd;
CREATE PROCEDURE shierarchyAdd( IN PLeft_Node int(11), IN PRight_Node int(11), IN PType enum('USER', IN PUser_Or_Entity_ID 'ENTITY'), IN P_ID int(11) )
  BEGIN

    DECLARE _id INT;

    INSERT INTO thierarchy (Left_Node, Right_Node, Type, User_Or_Entity_ID, _ID)
    VALUES (PLeft_Node, PRight_Node, PType, PUser_Or_Entity_ID, P_ID);
    SET _id = (SELECT last_insert_id());

    CALL sGetTransactionStatus(1, _id, 'hierarchy_ID', NULL, NULL);
  END;

DROP PROCEDURE IF EXISTS shierarchyUpdate;
CREATE PROCEDURE shierarchyUpdate(IN PLeft_Node int(11), IN PRight_Node int(11), IN PType enum('USER', IN PUser_Or_Entity_ID 'ENTITY'), IN P_ID int(11))
  BEGIN
    DECLARE _id INT;
    UPDATE thierarchy
    SET
    Left_Node = PLeft_Node, Right_Node = PRight_Node, Type = PType, User_Or_Entity_ID = PUser_Or_Entity_ID, _ID = P_ID
    WHERE hierarchy_ID = Phierarchy_ID;

    SET _id = Phierarchy_ID;

    CALL sGetTransactionStatus(1,_id, 'hierarchy_ID', NULL, NULL);


  END;



DROP PROCEDURE IF EXISTS shierarchyDelete;
CREATE PROCEDURE shierarchyDelete(IN PID INT)
  BEGIN
    DELETE FROM thierarchy
    WHERE hierarchy_ID = PID;
    CALL sGetTransactionStatus(1, PID, 'hierarchy_ID', NULL, NULL);

  END;


DROP PROCEDURE IF EXISTS shierarchyGet;
CREATE PROCEDURE shierarchyGet(IN PID INT)
  BEGIN
    SELECT
      Left_Node, Right_Node, Type, User_Or_Entity_ID, _ID
    FROM thierarchy
    WHERE hierarchy_ID = PID;
  END;

DROP PROCEDURE IF EXISTS shierarchyGetList;
CREATE PROCEDURE shierarchyGetList(IN PIDs TEXT)
  BEGIN
    IF PIDs = '' OR PIDs IS NULL
    THEN
      SELECT
      Left_Node, Right_Node, Type, User_Or_Entity_ID, _ID

      FROM thierarchy;

    ELSE
      SELECT
      Left_Node, Right_Node, Type, User_Or_Entity_ID, _ID

      FROM thierarchy
      WHERE find_in_set(hierarchy_ID, PIDs);
    END IF;

  END;

DROP PROCEDURE IF EXISTS shierarchyObjectGet;
CREATE PROCEDURE shierarchyObjectGet(IN PID INT)
  BEGIN
    SELECT
      Left_Node, Right_Node, Type, User_Or_Entity_ID, _ID
    FROM thierarchy
    # WHERE hierarchy_ID = Phierarchy_ID;
  END;



DROP PROCEDURE IF EXISTS shierarchyObjectGetList;
CREATE PROCEDURE shierarchyObjectGetList(IN PLeft_Node int(11), IN PRight_Node int(11), IN PType enum('USER', IN PUser_Or_Entity_ID 'ENTITY'), IN P_ID int(11))
  BEGIN


    SELECT
    Left_Node, Right_Node, Type, User_Or_Entity_ID, _ID

    FROM
      thierarchy
    #       WHERE Status = PStatus
    ORDER BY hierarchy_ID DESC;

  END;


DROP PROCEDURE IF EXISTS shierarchyObjectGetListPage;
CREATE PROCEDURE shierarchyObjectGetListPage(IN PLeft_Node int(11), IN PRight_Node int(11), IN PType enum('USER', IN PUser_Or_Entity_ID 'ENTITY'), IN P_ID int(11) , IN PPage_Num  INT, IN PPage_Size INT)
  BEGIN

    DECLARE _offset INT DEFAULT 0;
    DECLARE _total_rec INT DEFAULT 0;
    DECLARE _total_pages INT DEFAULT 1;
    SET _offset = fGetOffset(PPage_Num, PPage_Size);
    SET _total_rec = (SELECT count(*)
                      FROM thierarchy
      #       WHERE Status = PStatus

    );
    SET _total_pages = fGetTotalPages(_total_rec, PPage_Size);
    IF _total_rec > 0
    THEN

      SELECT
        _total_rec   AS total_records,
        _total_pages AS total_pages;

      SELECT
      Left_Node, Right_Node, Type, User_Or_Entity_ID, _ID

      FROM
        thierarchy
      #       WHERE Status = PStatus
      ORDER BY hierarchy_ID DESC
      LIMIT _offset, PPage_Size;

    END IF;
  END;


