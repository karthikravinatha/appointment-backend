/**
 * Author:  KaHO PC-1
 * Created: 6 Oct, 2016
 */
DELIMITER $$

/*
create index idx_tentity_state_id on tEntity(State_ID) ;
create index idx_tentity_city_id on tEntity(City_ID) ;
create index idx_tentity_managed_by on tEntity(Managed_By) ;
create index idx_tentity_parent_entity_id on tEntity(Parent_Entity_ID) ;
create index idx_tentity_created_by on tEntity(Created_By) ;
create index idx_tentity_created_on on tEntity(Created_On) ;
create index idx_tentity_currently_managed_by on tEntity(Currently_Managed_By) ;
create index idx_tentity_entity_type on tEntity(Entity_Type) ;
create index idx_tentity_status on tEntity(Entity_Status) ;
create index idx_tentity_is_delete on tEntity(Is_Delete) ;

create index idx_tuser_is_primary on tUser(Is_Primary) ;
create index idx_tuser_is_delete on tUser(Is_Delete) ;
create index idx_tuser_status on tUser(Status) ;
create index idx_tuser_parent_id on tUser(Parent_ID) ;

create index idx_tuserentity_entity_id on tUserEntity(Entity_ID) ;
create index idx_tuserentity_user_id on tUserEntity(User_ID) ;

create index idx_ttargetheader_created_on on tTargetHeader(Created_On) ;
create index idx_ttargetheader_created_by on tTargetHeader(Created_By) ;
create index idx_ttargetheader_target_to on tTargetHeader(Target_To) ;
create index idx_ttargetheader_is_user on tTargetHeader(Is_User) ;
create index idx_ttargetheader_month_number on tTargetHeader(Month_Number) ;
create index idx_ttargetheader_target_year on tTargetHeader(Target_Year) ;
create index idx_ttargetheader_target_type on tTargetHeader(Target_Type) ;

create index idx_ttargetdetail_target_id on tTargetDetail(Target_ID) ;
create index idx_ttargetdetail_parameter on tTargetDetail(Parameter) ;
create index idx_ttargetdetail_uom_id on tTargetDetail(UOM_ID) ;

create index idx_tproducertargetheader_created_by on tProducerTargetHeader(Created_By) ;
create index idx_tproducertargetheader_created_on on tProducerTargetHeader(Created_On) ;
create index idx_tproducertargetheader_producer_id on tProducerTargetHeader(Producer_ID) ;
create index idx_tproducertargetheader_month_number on tProducerTargetHeader(Month_Number) ;
create index idx_tproducertargetheader_producer_target_year on tProducerTargetHeader(Target_Year) ;
create index idx_tproducertargetheader_target_type on tProducerTargetHeader(Target_Type) ;

create index idx_tproducertargetdetail_producer_target_id on tProducerTargetDetail(Producer_Target_ID) ;
create index idx_tproducertargetdetail_parameter on tProducerTargetDetail(Parameter) ;
create index idx_tproducertargetdetail_uom_id on tProducerTargetDetail(UOM_ID) ;

create index idx_tcart_user_id on tCart(User_ID) ;
create index idx_tcart_entity_id on tCart(Entity_ID) ;
create index idx_tcart_cart_date on tCart(Cart_Date) ;
create index idx_tcart_status on tCart(Status) ;

create index idx_tcartitem_cart_id on tCartItem(Cart_ID) ;
create index idx_tcartitem_category_id on tCartItem(Category_ID) ;

create index idx_tpickuprequest_cart_id on tPickupRequest(Cart_ID) ;
create index idx_tpickuprequest_requested_on on tPickupRequest(Requested_On) ;
create index idx_tpickuprequest_requested_by on tPickupRequest(Request_By) ;
create index idx_tpickuprequest_logistic_partner_entity_id on tPickupRequest(Logistic_Partner_Entity_ID) ;
create index idx_tpickuprequest_logistic_partner_user_id on tPickupRequest(Logistic_Partner_User_ID) ;

create index idx_titemhanover_handover_on on tItemHandover(Handover_On) ;
create index idx_titemhanover_handover_to on tItemHandover(Handover_To) ;
create index idx_titemhanover_cart_id on tItemHandover(Cart_ID) ;

create index idx_tsellerbill_cart_id on tSellerBill(Cart_ID) ;
create index idx_tsellerbill_status on tSellerBill(Status) ;

create index idx_tcategoryprice_state_id on tCategoryPrice(State_ID) ;
create index idx_tcategoryprice_city_id on tCategoryPrice(City_ID) ;
create index idx_tcategoryprice_category_id on tCategoryPrice(Category_ID) ;

create index idx_tinvoiceheader_invoice_date on tInvoiceHeader(Invoice_Date) ;
create index idx_tinvoiceheader_recycler_id on tInvoiceHeader(Recycler_ID) ;
create index idx_tinvoiceheader_dispatch_id on tInvoiceHeader(Dispatch_ID) ;
create index idx_tinvoiceheader_status on tInvoiceHeader(Status) ;

create index idx_tinvoicedetail_category_id on tInvoiceDetail(Category_ID) ;

create index idx_tworkshop_created_by on tWorkshop(Created_By) ;
create index idx_tworkshop_created_on on tWorkshop(Created_On) ;
create index idx_tworkshop_workshop_date on tWorkshop(Workshop_Date) ;
create index idx_tworkshop_workshop_type on tWorkshop(Workshop_Type) ;

create index idx_tworkshopattendance_school_id on tWorkshopAttendance(School_ID) ;

create index idx_tschoolexercise_created_on on tSchoolExcercise(Created_On) ;
create index idx_tschoolexercise_created_by on tSchoolExcercise(Created_By) ;
create index idx_tschoolexercise_school_id on tSchoolExcercise(School_ID) ;
create index idx_tschoolexercise_exercise_id on tSchoolExcercise(Excercise_ID) ;
create index idx_tschoolexercise_activity_id on tSchoolExcercise(Activity_ID) ;

create index idx_tschoolevaluationheader_created_on on tSchoolEvaluationHeader(Created_On) ;
create index idx_tschoolevaluationheader_created_by on tSchoolEvaluationHeader(Created_By) ;
create index idx_tschoolevaluationheader_school_id on tSchoolEvaluationHeader(School_ID) ;

create index idx_tschoolevaluationdetail_evaluation_type on tSchoolEvaluationDetail(Evaluation_Type) ;

create index idx_tvisit_user_id on tVisit(User_ID) ;
create index idx_tvisit_visit_date on tVisit(Visit_Date) ;
create index idx_tvisit_entity_type on tVisit(Entity_Type) ;
create index idx_tvisit_visit_purpose on tVisit(Visit_Purpose) ;

create index idx_tpoeheader_transaction_type on tPOEHeader(Transaction_Type) ;
create index idx_tpoeheader_poe_type on tPOEHeader(POE_Type) ;

create index idx_tpoedetail_poe_id on tPOEDetail(POE_ID) ;

create index idx_tcity_state_id on tCity(State_ID) ;

create index idx_tgiftitem_uom_id on tGiftItem(UOM_ID) ;

create index idx_tcarttrack_cart_id on tCartTrack(Cart_ID) ;
create index idx_tcarttrack_status on tCartTrack(Status) ;

CREATE INDEX idx_thierarchy_user_or_entity_id
  ON tHierarchy (User_Or_Entity_ID);
CREATE INDEX idx_thierarchy_user_or_type
  ON tHierarchy (Type);
CREATE INDEX idx_thierarchy_user_or_left_node
  ON tHierarchy (Left_Node);
CREATE INDEX idx_thierarchy_user_or_right_node
  ON tHierarchy (Right_Node);

create INDEX idx_tentityoperativearea_entity_id on tEntityOperativeArea(Entity_ID) ;
create INDEX idx_tentityoperativearea_operative_area_id on tEntityOperativeArea(Operative_Area_ID) ;

create INDEX idx_tentityoperativecity_entity_id on tEntityOperativeCity(Entity_ID) ;
create INDEX idx_tentityoperativecity_city_id on tEntityOperativeCity(City_ID) ;


create INDEX idx_tpickuprequest_status on tPickupRequest(Status) ;
create INDEX idx_tpickuprequest_wh_id on tPickupRequest(WH_ID) ;
create INDEX idx_tpickuprequest_id_direct on tPickupRequest(Is_Direct) ;

create INDEX idx_titemhandover_status on tItemHandover(Status) ;

create INDEX idx_tentity_entity_name on tEntity(Entity_Name) ;

create INDEX idx_tuser_user_name on tUser(User_Name) ;

create INDEX idx_sellerbill on tSellerBill(Updated_Bill_Number) ;

create index idx_twhgrnheader_wh_id on tWHGRNHeader(WH_ID) ;
create index idx_twhgrnheader_handover_id on tWHGRNHeader(Handover_ID) ;
create index idx_twhgrnheader_logistic_partner_id on tWHGRNHeader(Logistic_Partner_ID) ;

create index idx_twhgrndetail_category_id on tWHGRNDetail(Category_ID) ;
create index idx_twhgrndetail_wh_grn_id on tWHGRNDetail(WH_GRN_ID) ;

create index idx_twhgrndocumentheader_wh_grn_id on tWHGRNDocumentHeader(WH_GRN_ID) ;

create index idx_twhgrndocumentdetail_document_id on tWHGRNDocumentDetail(Document_ID) ;
create index idx_twhgrndocumentdetail_document_configiration_id on tWHGRNDocumentDetail(Document_Configuration_ID) ;

create index idx_trecyclergrnheader_inv on tRecyclerGRNHeader(Invoice_Number) ;
create index idx_trecyclergrndetail_category_id on tRecyclerGRNDetail(Category_ID) ;

create index idx_trecyclergrndocumentheader_grn_id on tRecyclerGRNDocumentHeader(GRN_ID) ;
create index idx_trecyclergrndocumentdetail_document_id on tRecyclerGRNDocumentDetail(Document_ID) ;
create index idx_trecyclergrndocumentdetail_document_configutation_id on tRecyclerGRNDocumentDetail(Document_Configuration_ID) ;
*/

CREATE INDEX idx_tattachmentdetail_attachment_id
  ON tAttachmentDetail (Attachment_ID);
CREATE INDEX idx_tattachmentheader_object_type
  ON tAttachmentHeader (Object_Type);
CREATE INDEX idx_tattachmentheader_transaction_id
  ON tAttachmentHeader (Transaction_ID);
CREATE INDEX idx_tcart_user_id
  ON tCart (User_ID);
CREATE INDEX idx_tcart_entity_id
  ON tCart (Entity_ID);
CREATE INDEX idx_tcart_cart_date
  ON tCart (Cart_Date);
CREATE INDEX idx_tcart_status
  ON tCart (Status);
CREATE INDEX User_ID
  ON tCartItem (User_ID);
CREATE INDEX idx_tcartitem_cart_id
  ON tCartItem (Cart_ID);
CREATE INDEX idx_tcartitem_category_id
  ON tCartItem (Category_ID);
CREATE INDEX Cart_Item_ID
  ON tCartItemQuantity (Cart_Item_ID);
CREATE INDEX idx_tcarttrack_cart_id
  ON tCartTrack (Cart_ID);
CREATE INDEX idx_tcarttrack_status
  ON tCartTrack (Status);
CREATE INDEX idx_tcategory_parent_category_id
  ON tCategory (Parent_Category_ID);
CREATE INDEX idx_tcity_state_id
  ON tCity (State_ID);
CREATE INDEX Entity_Type
  ON tDocumentRequirement (Entity_Type);
CREATE INDEX Document_ID
  ON tDocumentRequirement (Document_ID);
CREATE INDEX idx_tentity_state_id
  ON tEntity (State_ID);
CREATE INDEX idx_tentity_city_id
  ON tEntity (City_ID);
CREATE INDEX idx_tentity_managed_by
  ON tEntity (Managed_By);
CREATE INDEX idx_tentity_parent_entity_id
  ON tEntity (Parent_Entity_ID);
CREATE INDEX idx_tentity_created_by
  ON tEntity (Created_By);
CREATE INDEX idx_tentity_created_on
  ON tEntity (Created_On);
CREATE INDEX idx_tentity_currently_managed_by
  ON tEntity (Currently_Managed_By);
CREATE INDEX idx_tentity_entity_type
  ON tEntity (Entity_Type);
CREATE INDEX idx_tentity_status
  ON tEntity (Entity_Status);
CREATE INDEX idx_tentity_is_delete
  ON tEntity (Is_Delete);
CREATE INDEX idx_tentity_entity_name
  ON tEntity (Entity_Name);
CREATE INDEX Entity_ID
  ON tEntityBankDetails (Entity_ID);
CREATE INDEX Bank_ID
  ON tEntityBankDetails (Bank_ID);
CREATE INDEX Entity_Document_ID
  ON tEntityDocumentDetail (Entity_Document_ID);
CREATE INDEX Document_ID
  ON tEntityDocumentHeader (Document_ID);
CREATE INDEX Entity_ID
  ON tEntityDocumentHeader (Entity_ID);
CREATE INDEX idx_tentity_state_id
  ON tEntityTemp (State_ID);
CREATE INDEX idx_tentity_city_id
  ON tEntityTemp (City_ID);
CREATE INDEX idx_tentity_managed_by
  ON tEntityTemp (Managed_By);
CREATE INDEX idx_tentity_parent_entity_id
  ON tEntityTemp (Parent_Entity_ID);
CREATE INDEX idx_tentity_created_by
  ON tEntityTemp (Created_By);
CREATE INDEX idx_tentity_created_on
  ON tEntityTemp (Created_On);
CREATE INDEX idx_tentity_currently_managed_by
  ON tEntityTemp (Currently_Managed_By);
CREATE INDEX idx_tentity_entity_type
  ON tEntityTemp (Entity_Type);
CREATE INDEX idx_tentity_status
  ON tEntityTemp (Entity_Status);
CREATE INDEX idx_tentity_is_delete
  ON tEntityTemp (Is_Delete);
CREATE INDEX idx_tgiftitem_uom_id
  ON tGiftItem (UOM_ID);
CREATE INDEX idx_thierarchy_user_or_entity_id
  ON tHierarchy (User_Or_Entity_ID);
CREATE INDEX idx_thierarchy_user_or_type
  ON tHierarchy (Type);
CREATE INDEX idx_thierarchy_user_or_left_node
  ON tHierarchy (Left_Node);
CREATE INDEX idx_thierarchy_user_or_right_node
  ON tHierarchy (Right_Node);
CREATE INDEX idx_thierarchy_user_or_entity_id
  ON tHierarchyTemp (User_Or_Entity_ID);
CREATE INDEX idx_thierarchy_user_or_type
  ON tHierarchyTemp (Type);
CREATE INDEX idx_thierarchy_user_or_left_node
  ON tHierarchyTemp (Left_Node);
CREATE INDEX idx_thierarchy_user_or_right_node
  ON tHierarchyTemp (Right_Node);
CREATE INDEX Invoice_ID
  ON tInvoiceDetail (Invoice_ID);
CREATE INDEX idx_tinvoicedetail_category_id
  ON tInvoiceDetail (Category_ID);
CREATE INDEX idx_tinvoiceheader_invoice_date
  ON tInvoiceHeader (Invoice_Date);
CREATE INDEX idx_tinvoiceheader_recycler_id
  ON tInvoiceHeader (Recycler_ID);
CREATE INDEX idx_tinvoiceheader_dispatch_id
  ON tInvoiceHeader (Dispatch_ID);
CREATE INDEX idx_tinvoiceheader_status
  ON tInvoiceHeader (Status);
CREATE INDEX idx_titemhanover_handover_on
  ON tItemHandover (Handover_On);
CREATE INDEX idx_titemhanover_handover_to
  ON tItemHandover (Handover_To);
CREATE INDEX idx_titemhanover_cart_id
  ON tItemHandover (Cart_ID);
CREATE INDEX idx_titemhandover
  ON tItemHandover (Status);
CREATE INDEX Language_ID
  ON tLanguageDetail (Language_ID);
CREATE INDEX idx_tloginlog_user_id
  ON tLoginLog (User_ID);
CREATE INDEX Type_Code
  ON tLookUp (Type_Code);
CREATE INDEX User_ID
  ON tMasterLog (User_ID);
CREATE INDEX idx_tpoedetail_file_type
  ON tPOEDetail (File_Type);
CREATE INDEX idx_tpoedetail_poe_id
  ON tPOEDetail (POE_ID);
CREATE INDEX idx_tpoeheader_transaction_id
  ON tPOEHeader (Transaction_ID);
CREATE INDEX idx_tpoeheader_object_type
  ON tPOEHeader (POE_Type);
CREATE INDEX idx_tpoeheader_transaction_type
  ON tPOEHeader (Transaction_Type);
CREATE INDEX idx_tpoeheader_poe_type
  ON tPOEHeader (POE_Type);
CREATE INDEX idx_tpickuprequest_cart_id
  ON tPickupRequest (Cart_ID);
CREATE INDEX idx_tpickuprequest_requested_on
  ON tPickupRequest (Requested_On);
CREATE INDEX idx_tpickuprequest_requested_by
  ON tPickupRequest (Request_By);
CREATE INDEX idx_tpickuprequest_logistic_partner_entity_id
  ON tPickupRequest (Logistic_Partner_Entity_ID);
CREATE INDEX idx_tpickuprequest_logistic_partner_user_id
  ON tPickupRequest (Logistic_Partner_User_ID);
CREATE INDEX idx_tpickuprequest_status
  ON tPickupRequest (Status);
CREATE INDEX idx_tpickuprequest_wh_id
  ON tPickupRequest (WH_ID);
CREATE INDEX idx_tpickuprequest_id_direct
  ON tPickupRequest (Is_Direct);
CREATE INDEX idx_tproducertargetdetail_producer_target_id
  ON tProducerTargetDetail (Producer_Target_ID);
CREATE INDEX idx_tproducertargetdetail_parameter
  ON tProducerTargetDetail (Parameter);
CREATE INDEX idx_tproducertargetdetail_uom_id
  ON tProducerTargetDetail (UOM_ID);
CREATE INDEX idx_tproducertargetheader_created_by
  ON tProducerTargetHeader (Created_By);
CREATE INDEX idx_tproducertargetheader_created_on
  ON tProducerTargetHeader (Created_On);
CREATE INDEX idx_tproducertargetheader_producer_id
  ON tProducerTargetHeader (Producer_ID);
CREATE INDEX idx_tproducertargetheader_month_number
  ON tProducerTargetHeader (Month_Number);
CREATE INDEX idx_tproducertargetheader_producer_target_year
  ON tProducerTargetHeader (Target_Year);
CREATE INDEX idx_tproducertargetheader_target_type
  ON tProducerTargetHeader (Target_Type);
CREATE INDEX idx_trecyclergrndetail_category_id
  ON tRecyclerGRNDetail (Category_ID);
CREATE INDEX idx_trecyclergrndocumentdetail_document_id
  ON tRecyclerGRNDocumentDetail (Document_ID);
CREATE INDEX idx_trecyclergrndocumentdetail_document_configutation_id
  ON tRecyclerGRNDocumentDetail (Document_Configuration_ID);
CREATE INDEX idx_trecyclergrndocumentheader_grn_id
  ON tRecyclerGRNDocumentHeader (GRN_ID);
CREATE INDEX idx_trecyclergrnheader_inv
  ON tRecyclerGRNHeader (Invoice_Number);
CREATE INDEX idx_tschoolevaluationdetail_evaluation_type
  ON tSchoolEvaluationDetail (Evaluation_Type);
CREATE INDEX idx_tschoolevaluationheader_created_on
  ON tSchoolEvaluationHeader (Created_On);
CREATE INDEX idx_tschoolevaluationheader_created_by
  ON tSchoolEvaluationHeader (Created_By);
CREATE INDEX idx_tschoolevaluationheader_school_id
  ON tSchoolEvaluationHeader (School_ID);
CREATE INDEX idx_tschoolexercise_created_on
  ON tSchoolExcercise (Created_On);
CREATE INDEX idx_tschoolexercise_created_by
  ON tSchoolExcercise (Created_By);
CREATE INDEX idx_tschoolexercise_school_id
  ON tSchoolExcercise (School_ID);
CREATE INDEX idx_tschoolexercise_exercise_id
  ON tSchoolExcercise (Excercise_ID);
CREATE INDEX idx_tschoolexercise_activity_id
  ON tSchoolExcercise (Activity_ID);
CREATE INDEX idx_tsellerbill_cart_id
  ON tSellerBill (Cart_ID);
CREATE INDEX idx_tsellerbill_status
  ON tSellerBill (Status);
CREATE INDEX idx_sellerbill
  ON tSellerBill (Updated_Bill_Number);
CREATE INDEX Bill_ID
  ON tSellerBillAmount (Bill_ID);
CREATE INDEX User_ID
  ON tSignUpStatus (User_ID);
CREATE INDEX idx_ttargetdetail_target_id
  ON tTargetDetail (Target_ID);
CREATE INDEX idx_ttargetdetail_parameter
  ON tTargetDetail (Parameter);
CREATE INDEX idx_ttargetdetail_uom_id
  ON tTargetDetail (UOM_ID);
CREATE INDEX idx_ttargetheader_created_on
  ON tTargetHeader (Created_On);
CREATE INDEX idx_ttargetheader_created_by
  ON tTargetHeader (Created_By);
CREATE INDEX idx_ttargetheader_target_to
  ON tTargetHeader (Target_To);
CREATE INDEX idx_ttargetheader_is_user
  ON tTargetHeader (Is_User);
CREATE INDEX idx_ttargetheader_month_number
  ON tTargetHeader (Month_Number);
CREATE INDEX idx_ttargetheader_target_year
  ON tTargetHeader (Target_Year);
CREATE INDEX idx_ttargetheader_target_type
  ON tTargetHeader (Target_Type);
CREATE INDEX User_ID
  ON tTransactionLog (User_ID);
CREATE INDEX idx_tuser_parent_id
  ON tUser (Parent_ID);
CREATE INDEX idx_tuser_status
  ON tUser (Status);
CREATE INDEX idx_tuser_is_primary
  ON tUser (Is_Primary);
CREATE INDEX idx_tuser_is_delete
  ON tUser (Is_Delete);
CREATE INDEX idx_tuser_user_name
  ON tUser (User_Name);
CREATE INDEX idx_tuserentity_entity_id
  ON tUserEntity (Entity_ID);
CREATE INDEX idx_tuserentity_user_id
  ON tUserEntity (User_ID);
CREATE INDEX idx_tuserentity_entity_id
  ON tUserEntityTemp (Entity_ID);
CREATE INDEX idx_tuserentity_user_id
  ON tUserEntityTemp (User_ID);
CREATE INDEX User_ID
  ON tUserRole (User_ID);
CREATE INDEX Role_ID
  ON tUserRole (Role_ID);
CREATE INDEX idx_tuser_parent_id
  ON tUserTemp (Parent_ID);
CREATE INDEX idx_tuser_status
  ON tUserTemp (Status);
CREATE INDEX idx_tuser_is_primary
  ON tUserTemp (Is_Primary);
CREATE INDEX idx_tuser_is_delete
  ON tUserTemp (Is_Delete);
CREATE INDEX idx_tvisit_user_id
  ON tVisit (User_ID);
CREATE INDEX idx_tvisit_visit_date
  ON tVisit (Transaction_Date);
CREATE INDEX idx_tvisit_entity_type
  ON tVisit (Entity_Type);
CREATE INDEX idx_tvisit_visit_purpose
  ON tVisit (Visit_Purpose);
CREATE INDEX Visit_ID
  ON tVisitGifts (Visit_ID);
CREATE INDEX Gift_Item_ID
  ON tVisitGifts (Gift_Item_ID);
CREATE INDEX idx_twhgrndetail_category_id
  ON tWHGRNDetail (Category_ID);
CREATE INDEX idx_twhgrndetail_wh_grn_id
  ON tWHGRNDetail (WH_GRN_ID);
CREATE INDEX idx_twhgrndocumentdetail_document_id
  ON tWHGRNDocumentDetail (Document_ID);
CREATE INDEX idx_twhgrndocumentdetail_document_configiration_id
  ON tWHGRNDocumentDetail (Document_Configuration_ID);
CREATE INDEX idx_twhgrndocumentheader_wh_grn_id
  ON tWHGRNDocumentHeader (WH_GRN_ID);
CREATE INDEX idx_twhgrnheader_wh_id
  ON tWHGRNHeader (WH_ID);
CREATE INDEX idx_twhgrnheader_handover_id
  ON tWHGRNHeader (Handover_ID);
CREATE INDEX idx_twhgrnheader_logistic_partner_id
  ON tWHGRNHeader (Logistic_Partner_ID);
CREATE INDEX idx_tworkshop_created_by
  ON tWorkshop (Created_By);
CREATE INDEX idx_tworkshop_created_on
  ON tWorkshop (Created_On);
CREATE INDEX idx_tworkshop_workshop_date
  ON tWorkshop (Transaction_Date);
CREATE INDEX idx_tworkshop_workshop_type
  ON tWorkshop (Workshop_Type);
CREATE INDEX idx_tworkshopattendance_school_id
  ON tWorkshopAttendance (School_ID);
CREATE INDEX idx_tentity_state_id
  ON tempEntity (State_ID);
CREATE INDEX idx_tentity_city_id
  ON tempEntity (City_ID);
CREATE INDEX idx_tentity_managed_by
  ON tempEntity (Managed_By);
CREATE INDEX idx_tentity_parent_entity_id
  ON tempEntity (Parent_Entity_ID);
CREATE INDEX idx_tentity_created_by
  ON tempEntity (Created_By);
CREATE INDEX idx_tentity_created_on
  ON tempEntity (Created_On);
CREATE INDEX idx_tentity_currently_managed_by
  ON tempEntity (Currently_Managed_By);
CREATE INDEX idx_tuser_parent_id
  ON tempUser (Parent_ID);
CREATE INDEX idx_tuserentity_entity_id
  ON tempUserEntity (Entity_ID);
CREATE INDEX idx_tuserentity_user_id
  ON tempUserEntity (User_ID);
CREATE INDEX idx_tobjectgeolocation_object_id
  ON tObjectGeoLocation (Object_ID);
CREATE INDEX idx_tobjectgeolocation_object_type
  ON tObjectGeoLocation (Object_Type);

CREATE INDEX idx_tpaymentdetail_bill_id
  ON tPaymentDetail (Bill_ID);
CREATE INDEX idx_tpaymentdetail_bill_type
  ON tPaymentDetail (Bill_Type);

  CREATE INDEX idx_tproducerapportion_invoice_id
  ON tProducerApportion (Invoice_ID);
CREATE INDEX idx_tproducerapportion_category_id
  ON tProducerApportion (Category_ID);

  CREATE INDEX idx_tfinancialyear_from_date
  ON tFinancialYear (From_Date);
CREATE INDEX idx_tfinancialyear_to_date
  ON tFinancialYear (To_Date);

create index idx_tuserrole_role_id on tUserRole(Role_ID) ;
create index idx_tuserrole_user_id on tUserRole(User_ID) ;

$$
