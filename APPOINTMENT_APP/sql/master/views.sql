/**
 * Author:  Nikesh
 * Created: May 12, 2017
 */

DELIMITER $$

DROP VIEW IF EXISTS vLftRgt;
CREATE VIEW vLftRgt AS
  SELECT Left_Node
  FROM tHierarchy
  WHERE Left_Node IS NOT NULL
  UNION ALL
  SELECT Right_Node
  FROM tHierarchy
  WHERE Right_Node IS NOT NULL;

DROP VIEW IF EXISTS vDirectDispatchGRN;
CREATE VIEW vDirectDispatchGRN AS
  SELECT DISTINCT
    a.Invoice_ID,
    a.Invoice_Date                                   AS Actual_Invoice_Date,
    date_format(a.Invoice_Date, '%d/%m/%Y %H:%i:%s') AS Invoice_Date,
    a.Invoice_Number,
    a.Updated_Invoice_Number,
    f.WH_GRN_ID,
    f.Handover_ID
  FROM tInvoiceHeader a
    INNER JOIN tWarehouse b ON a.WH_ID = b.WH_ID
    INNER JOIN tEntity c ON b.Entity_ID = c.Entity_ID
    INNER JOIN tOutwardAllocationHeader d ON a.Invoice_ID = d.Invoice_ID
    INNER JOIN tOutwardAllocationDetail e ON d.Allocation_ID = e.Allocation_ID
    INNER JOIN tWHGRNHeader f ON e.WH_GRN_ID = f.WH_GRN_ID
  WHERE c.Is_System = 1;

$$