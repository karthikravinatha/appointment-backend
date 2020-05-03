CREATE INDEX idx_tobject_object_id
  ON tObject (Object_ID);

CREATE INDEX idx_tobject_object_type
  ON tObject (Object_Type);

CREATE INDEX idx_tdocument_document_id
  ON tDocument (Document_ID);

CREATE INDEX idx_tdocument_document_type
  ON tDocument (Document_Type);

CREATE INDEX idx_tobjectdocument_object_id
  ON tObjectDocument (Object_ID);

CREATE INDEX idx_tobjectdocument_object_document
  ON tObjectDocument (Document_ID);

CREATE INDEX idx_tfileheader_transaction_id
  ON tFileHeader (Transaction_ID);

CREATE INDEX idx_tfileheader_object_id
  ON tFileHeader (Object_ID);

CREATE INDEX idx_tfileheader_document_id
  ON tFileHeader (Document_ID);

CREATE INDEX idx_tfiledetail_header_id
  ON tFileDetail (Header_ID);
