DROP PROCEDURE IF EXISTS sdoctorsAdd;
CREATE PROCEDURE sdoctorsAdd( IN PID int(11), IN PNAME varchar(100), IN PQUALIFICATION varchar(100), IN PRATING int(11), IN PSPECALISATION_ID int(11), IN PCLINIC_NAME varchar(100) )
  BEGIN

    DECLARE _id INT;

    INSERT INTO tdoctors (ID, NAME, QUALIFICATION, RATING, SPECALISATION_ID, CLINIC_NAME)
    VALUES (PID, PNAME, PQUALIFICATION, PRATING, PSPECALISATION_ID, PCLINIC_NAME);
    SET _id = (SELECT last_insert_id());

    CALL sGetTransactionStatus(1, _id, 'doctors_ID', NULL, NULL);
  END;

DROP PROCEDURE IF EXISTS sdoctorsUpdate;
CREATE PROCEDURE sdoctorsUpdate(IN PID int(11), IN PNAME varchar(100), IN PQUALIFICATION varchar(100), IN PRATING int(11), IN PSPECALISATION_ID int(11), IN PCLINIC_NAME varchar(100))
  BEGIN
    DECLARE _id INT;
    UPDATE tdoctors
    SET
    ID = PID, NAME = PNAME, QUALIFICATION = PQUALIFICATION, RATING = PRATING, SPECALISATION_ID = PSPECALISATION_ID, CLINIC_NAME = PCLINIC_NAME
    WHERE doctors_ID = Pdoctors_ID;

    SET _id = Pdoctors_ID;

    CALL sGetTransactionStatus(1,_id, 'doctors_ID', NULL, NULL);


  END;



DROP PROCEDURE IF EXISTS sdoctorsDelete;
CREATE PROCEDURE sdoctorsDelete(IN PID INT)
  BEGIN
    DELETE FROM tdoctors
    WHERE doctors_ID = PID;
    CALL sGetTransactionStatus(1, PID, 'doctors_ID', NULL, NULL);

  END;


DROP PROCEDURE IF EXISTS sdoctorsGet;
CREATE PROCEDURE sdoctorsGet(IN PID INT)
  BEGIN
    SELECT
      ID, NAME, QUALIFICATION, RATING, SPECALISATION_ID, CLINIC_NAME
    FROM tdoctors
    WHERE doctors_ID = PID;
  END;

DROP PROCEDURE IF EXISTS sdoctorsGetList;
CREATE PROCEDURE sdoctorsGetList(IN PIDs TEXT)
  BEGIN
    IF PIDs = '' OR PIDs IS NULL
    THEN
      SELECT
      ID, NAME, QUALIFICATION, RATING, SPECALISATION_ID, CLINIC_NAME

      FROM tdoctors;

    ELSE
      SELECT
      ID, NAME, QUALIFICATION, RATING, SPECALISATION_ID, CLINIC_NAME

      FROM tdoctors
      WHERE find_in_set(doctors_ID, PIDs);
    END IF;

  END;

DROP PROCEDURE IF EXISTS sdoctorsObjectGet;
CREATE PROCEDURE sdoctorsObjectGet(IN PID INT)
  BEGIN
    SELECT
      ID, NAME, QUALIFICATION, RATING, SPECALISATION_ID, CLINIC_NAME
    FROM tdoctors
    # WHERE doctors_ID = Pdoctors_ID;
  END;



DROP PROCEDURE IF EXISTS sdoctorsObjectGetList;
CREATE PROCEDURE sdoctorsObjectGetList(IN PID int(11), IN PNAME varchar(100), IN PQUALIFICATION varchar(100), IN PRATING int(11), IN PSPECALISATION_ID int(11), IN PCLINIC_NAME varchar(100))
  BEGIN


    SELECT
    ID, NAME, QUALIFICATION, RATING, SPECALISATION_ID, CLINIC_NAME

    FROM
      tdoctors
    #       WHERE Status = PStatus
    ORDER BY doctors_ID DESC;

  END;


DROP PROCEDURE IF EXISTS sdoctorsObjectGetListPage;
CREATE PROCEDURE sdoctorsObjectGetListPage(IN PID int(11), IN PNAME varchar(100), IN PQUALIFICATION varchar(100), IN PRATING int(11), IN PSPECALISATION_ID int(11), IN PCLINIC_NAME varchar(100) , IN PPage_Num  INT, IN PPage_Size INT)
  BEGIN

    DECLARE _offset INT DEFAULT 0;
    DECLARE _total_rec INT DEFAULT 0;
    DECLARE _total_pages INT DEFAULT 1;
    SET _offset = fGetOffset(PPage_Num, PPage_Size);
    SET _total_rec = (SELECT count(*)
                      FROM tdoctors
      #       WHERE Status = PStatus

    );
    SET _total_pages = fGetTotalPages(_total_rec, PPage_Size);
    IF _total_rec > 0
    THEN

      SELECT
        _total_rec   AS total_records,
        _total_pages AS total_pages;

      SELECT
      ID, NAME, QUALIFICATION, RATING, SPECALISATION_ID, CLINIC_NAME

      FROM
        tdoctors
      #       WHERE Status = PStatus
      ORDER BY doctors_ID DESC
      LIMIT _offset, PPage_Size;

    END IF;
  END;


