DROP PROCEDURE IF EXISTS suserAdd;
CREATE PROCEDURE suserAdd( IN PCreated_On varchar(24), IN PMobile_Number bigint(20), IN PDesignation varchar(1024), IN PParent_ID int(11), IN PEmail varchar(1024), IN PPhoto varchar(1024), IN PIs_Delete int(1), IN PStatus enum('ACTIVE', IN PIs_Primary 'DEACTIVE'), IN PUser_ID int(11), IN PLandline_Number int(11), IN PUser_Name bigint(20), IN PLast_Updated_By varchar(100), IN PUser_Password int(11), IN PCreated_By varchar(64), IN PLast_Updated_On int(11) )
  BEGIN

    DECLARE _id INT;

    INSERT INTO tuser (Created_On, Mobile_Number, Designation, Parent_ID, Email, Photo, Is_Delete, Status, Is_Primary, User_ID, Landline_Number, User_Name, Last_Updated_By, User_Password, Created_By, Last_Updated_On)
    VALUES (PCreated_On, PMobile_Number, PDesignation, PParent_ID, PEmail, PPhoto, PIs_Delete, PStatus, PIs_Primary, PUser_ID, PLandline_Number, PUser_Name, PLast_Updated_By, PUser_Password, PCreated_By, PLast_Updated_On);
    SET _id = (SELECT last_insert_id());

    CALL sGetTransactionStatus(1, _id, 'user_ID', NULL, NULL);
  END;

DROP PROCEDURE IF EXISTS suserUpdate;
CREATE PROCEDURE suserUpdate(IN PCreated_On varchar(24), IN PMobile_Number bigint(20), IN PDesignation varchar(1024), IN PParent_ID int(11), IN PEmail varchar(1024), IN PPhoto varchar(1024), IN PIs_Delete int(1), IN PStatus enum('ACTIVE', IN PIs_Primary 'DEACTIVE'), IN PUser_ID int(11), IN PLandline_Number int(11), IN PUser_Name bigint(20), IN PLast_Updated_By varchar(100), IN PUser_Password int(11), IN PCreated_By varchar(64), IN PLast_Updated_On int(11))
  BEGIN
    DECLARE _id INT;
    UPDATE tuser
    SET
    Created_On = PCreated_On, Mobile_Number = PMobile_Number, Designation = PDesignation, Parent_ID = PParent_ID, Email = PEmail, Photo = PPhoto, Is_Delete = PIs_Delete, Status = PStatus, Is_Primary = PIs_Primary, User_ID = PUser_ID, Landline_Number = PLandline_Number, User_Name = PUser_Name, Last_Updated_By = PLast_Updated_By, User_Password = PUser_Password, Created_By = PCreated_By, Last_Updated_On = PLast_Updated_On
    WHERE user_ID = Puser_ID;

    SET _id = Puser_ID;

    CALL sGetTransactionStatus(1,_id, 'user_ID', NULL, NULL);


  END;



DROP PROCEDURE IF EXISTS suserDelete;
CREATE PROCEDURE suserDelete(IN PID INT)
  BEGIN
    DELETE FROM tuser
    WHERE user_ID = PID;
    CALL sGetTransactionStatus(1, PID, 'user_ID', NULL, NULL);

  END;


DROP PROCEDURE IF EXISTS suserGet;
CREATE PROCEDURE suserGet(IN PID INT)
  BEGIN
    SELECT
      Created_On, Mobile_Number, Designation, Parent_ID, Email, Photo, Is_Delete, Status, Is_Primary, User_ID, Landline_Number, User_Name, Last_Updated_By, User_Password, Created_By, Last_Updated_On
    FROM tuser
    WHERE user_ID = PID;
  END;

DROP PROCEDURE IF EXISTS suserGetList;
CREATE PROCEDURE suserGetList(IN PIDs TEXT)
  BEGIN
    IF PIDs = '' OR PIDs IS NULL
    THEN
      SELECT
      Created_On, Mobile_Number, Designation, Parent_ID, Email, Photo, Is_Delete, Status, Is_Primary, User_ID, Landline_Number, User_Name, Last_Updated_By, User_Password, Created_By, Last_Updated_On

      FROM tuser;

    ELSE
      SELECT
      Created_On, Mobile_Number, Designation, Parent_ID, Email, Photo, Is_Delete, Status, Is_Primary, User_ID, Landline_Number, User_Name, Last_Updated_By, User_Password, Created_By, Last_Updated_On

      FROM tuser
      WHERE find_in_set(user_ID, PIDs);
    END IF;

  END;

DROP PROCEDURE IF EXISTS suserObjectGet;
CREATE PROCEDURE suserObjectGet(IN PID INT)
  BEGIN
    SELECT
      Created_On, Mobile_Number, Designation, Parent_ID, Email, Photo, Is_Delete, Status, Is_Primary, User_ID, Landline_Number, User_Name, Last_Updated_By, User_Password, Created_By, Last_Updated_On
    FROM tuser
    # WHERE user_ID = Puser_ID;
  END;



DROP PROCEDURE IF EXISTS suserObjectGetList;
CREATE PROCEDURE suserObjectGetList(IN PCreated_On varchar(24), IN PMobile_Number bigint(20), IN PDesignation varchar(1024), IN PParent_ID int(11), IN PEmail varchar(1024), IN PPhoto varchar(1024), IN PIs_Delete int(1), IN PStatus enum('ACTIVE', IN PIs_Primary 'DEACTIVE'), IN PUser_ID int(11), IN PLandline_Number int(11), IN PUser_Name bigint(20), IN PLast_Updated_By varchar(100), IN PUser_Password int(11), IN PCreated_By varchar(64), IN PLast_Updated_On int(11))
  BEGIN


    SELECT
    Created_On, Mobile_Number, Designation, Parent_ID, Email, Photo, Is_Delete, Status, Is_Primary, User_ID, Landline_Number, User_Name, Last_Updated_By, User_Password, Created_By, Last_Updated_On

    FROM
      tuser
    #       WHERE Status = PStatus
    ORDER BY user_ID DESC;

  END;


DROP PROCEDURE IF EXISTS suserObjectGetListPage;
CREATE PROCEDURE suserObjectGetListPage(IN PCreated_On varchar(24), IN PMobile_Number bigint(20), IN PDesignation varchar(1024), IN PParent_ID int(11), IN PEmail varchar(1024), IN PPhoto varchar(1024), IN PIs_Delete int(1), IN PStatus enum('ACTIVE', IN PIs_Primary 'DEACTIVE'), IN PUser_ID int(11), IN PLandline_Number int(11), IN PUser_Name bigint(20), IN PLast_Updated_By varchar(100), IN PUser_Password int(11), IN PCreated_By varchar(64), IN PLast_Updated_On int(11) , IN PPage_Num  INT, IN PPage_Size INT)
  BEGIN

    DECLARE _offset INT DEFAULT 0;
    DECLARE _total_rec INT DEFAULT 0;
    DECLARE _total_pages INT DEFAULT 1;
    SET _offset = fGetOffset(PPage_Num, PPage_Size);
    SET _total_rec = (SELECT count(*)
                      FROM tuser
      #       WHERE Status = PStatus

    );
    SET _total_pages = fGetTotalPages(_total_rec, PPage_Size);
    IF _total_rec > 0
    THEN

      SELECT
        _total_rec   AS total_records,
        _total_pages AS total_pages;

      SELECT
      Created_On, Mobile_Number, Designation, Parent_ID, Email, Photo, Is_Delete, Status, Is_Primary, User_ID, Landline_Number, User_Name, Last_Updated_By, User_Password, Created_By, Last_Updated_On

      FROM
        tuser
      #       WHERE Status = PStatus
      ORDER BY user_ID DESC
      LIMIT _offset, PPage_Size;

    END IF;
  END;


