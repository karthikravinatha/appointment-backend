DROP PROCEDURE IF EXISTS sloginlogAdd;
CREATE PROCEDURE sloginlogAdd( IN PDevice_ID text, IN PDevice_Type varchar(64), IN PLogged_In_Time varchar(24), IN POther_Detail text, IN PUser_Agent varchar(4048), IN PUser_ID int(11), IN P_ID int(11) )
  BEGIN

    DECLARE _id INT;

    INSERT INTO tloginlog (Device_ID, Device_Type, Logged_In_Time, Other_Detail, User_Agent, User_ID, _ID)
    VALUES (PDevice_ID, PDevice_Type, PLogged_In_Time, POther_Detail, PUser_Agent, PUser_ID, P_ID);
    SET _id = (SELECT last_insert_id());

    CALL sGetTransactionStatus(1, _id, 'loginlog_ID', NULL, NULL);
  END;

DROP PROCEDURE IF EXISTS sloginlogUpdate;
CREATE PROCEDURE sloginlogUpdate(IN PDevice_ID text, IN PDevice_Type varchar(64), IN PLogged_In_Time varchar(24), IN POther_Detail text, IN PUser_Agent varchar(4048), IN PUser_ID int(11), IN P_ID int(11))
  BEGIN
    DECLARE _id INT;
    UPDATE tloginlog
    SET
    Device_ID = PDevice_ID, Device_Type = PDevice_Type, Logged_In_Time = PLogged_In_Time, Other_Detail = POther_Detail, User_Agent = PUser_Agent, User_ID = PUser_ID, _ID = P_ID
    WHERE loginlog_ID = Ploginlog_ID;

    SET _id = Ploginlog_ID;

    CALL sGetTransactionStatus(1,_id, 'loginlog_ID', NULL, NULL);


  END;



DROP PROCEDURE IF EXISTS sloginlogDelete;
CREATE PROCEDURE sloginlogDelete(IN PID INT)
  BEGIN
    DELETE FROM tloginlog
    WHERE loginlog_ID = PID;
    CALL sGetTransactionStatus(1, PID, 'loginlog_ID', NULL, NULL);

  END;


DROP PROCEDURE IF EXISTS sloginlogGet;
CREATE PROCEDURE sloginlogGet(IN PID INT)
  BEGIN
    SELECT
      Device_ID, Device_Type, Logged_In_Time, Other_Detail, User_Agent, User_ID, _ID
    FROM tloginlog
    WHERE loginlog_ID = PID;
  END;

DROP PROCEDURE IF EXISTS sloginlogGetList;
CREATE PROCEDURE sloginlogGetList(IN PIDs TEXT)
  BEGIN
    IF PIDs = '' OR PIDs IS NULL
    THEN
      SELECT
      Device_ID, Device_Type, Logged_In_Time, Other_Detail, User_Agent, User_ID, _ID

      FROM tloginlog;

    ELSE
      SELECT
      Device_ID, Device_Type, Logged_In_Time, Other_Detail, User_Agent, User_ID, _ID

      FROM tloginlog
      WHERE find_in_set(loginlog_ID, PIDs);
    END IF;

  END;

DROP PROCEDURE IF EXISTS sloginlogObjectGet;
CREATE PROCEDURE sloginlogObjectGet(IN PID INT)
  BEGIN
    SELECT
      Device_ID, Device_Type, Logged_In_Time, Other_Detail, User_Agent, User_ID, _ID
    FROM tloginlog
    # WHERE loginlog_ID = Ploginlog_ID;
  END;



DROP PROCEDURE IF EXISTS sloginlogObjectGetList;
CREATE PROCEDURE sloginlogObjectGetList(IN PDevice_ID text, IN PDevice_Type varchar(64), IN PLogged_In_Time varchar(24), IN POther_Detail text, IN PUser_Agent varchar(4048), IN PUser_ID int(11), IN P_ID int(11))
  BEGIN


    SELECT
    Device_ID, Device_Type, Logged_In_Time, Other_Detail, User_Agent, User_ID, _ID

    FROM
      tloginlog
    #       WHERE Status = PStatus
    ORDER BY loginlog_ID DESC;

  END;


DROP PROCEDURE IF EXISTS sloginlogObjectGetListPage;
CREATE PROCEDURE sloginlogObjectGetListPage(IN PDevice_ID text, IN PDevice_Type varchar(64), IN PLogged_In_Time varchar(24), IN POther_Detail text, IN PUser_Agent varchar(4048), IN PUser_ID int(11), IN P_ID int(11) , IN PPage_Num  INT, IN PPage_Size INT)
  BEGIN

    DECLARE _offset INT DEFAULT 0;
    DECLARE _total_rec INT DEFAULT 0;
    DECLARE _total_pages INT DEFAULT 1;
    SET _offset = fGetOffset(PPage_Num, PPage_Size);
    SET _total_rec = (SELECT count(*)
                      FROM tloginlog
      #       WHERE Status = PStatus

    );
    SET _total_pages = fGetTotalPages(_total_rec, PPage_Size);
    IF _total_rec > 0
    THEN

      SELECT
        _total_rec   AS total_records,
        _total_pages AS total_pages;

      SELECT
      Device_ID, Device_Type, Logged_In_Time, Other_Detail, User_Agent, User_ID, _ID

      FROM
        tloginlog
      #       WHERE Status = PStatus
      ORDER BY loginlog_ID DESC
      LIMIT _offset, PPage_Size;

    END IF;
  END;


