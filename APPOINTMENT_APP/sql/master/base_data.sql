/**
 * Author:  Nikesh
 * Created: May 12, 2017
 */
DELIMITER $$

INSERT INTO tCompanyDetail (About_Company) VALUES ( "<div>Karo Bharat is a call for action to every person in India for solving India&rsquo;s e-waste problems.</div><div>Karo (meaning &ldquo;do&rdquo; in Hindi) is a sustainable program at scale which inspires people and institutions to responsibly recycle, motivates stakeholders including waste collectors and aggregators to transform, and uses a technology platform to make participation by all extremely easy and environmentally impactful. Karo kicks in efficiencies and effectiveness in creating awareness, collection and recycling. Karo is an initiative by environmental values driven experts who are determined to bring about a change in the way the e-waste is managed.&nbsp;</div><div>The fundamental objectives of Karo are to work together with the ecosystem to keep obsolete or discarded electronic products out of landfills, to optimise the recovery of resources from electronic products or their components, and to develop a globally harmonized and locally relevant system for responsible e-waste management.&nbsp;</div><div>Karo shall establish and drive a technology platform, processes and an ecosystem which shall enable the attainment of the above objectives.</div><div>Karo is committed to complete environmentally-sound and socially-responsible recycling of over 12000 tons of ICT (Information Communication Technology) e-waste and 12000 tons of CE (Consumer Electronics) e-waste in India in the year 2017-18.</div>") ;

TRUNCATE tConfig;
INSERT INTO tConfig VALUES
  ('CHURN', 300),
  ('PICKUP_THRESHOLD', 2),
  ('PAYMENT_THRESHOLD', 1),
  ('RECYCLER_GST', 5),
  ('SELLER_GST', 5),
  ('IS_TRANSACTION_DATE_ENABLED', 1),
  ('WORKFLOW_DEFAULT_ASSIGNEE', 1),
  ('DBCRNOTE_DEFAULT_ASSIGNEE', 1) ;

Insert into tLookUpType values ('LANGUAGE','Language') ;
Insert into tLookUp values
  ('LANGUAGE', 'LANGENG', 'English', 1),
  ('LANGUAGE', 'LANGHIN', 'Hindi', 2);

Insert into tLookUpType values ('ENTITYTYPE','Entity Type') ;
INSERT INTO tLookUp VALUES
  ('ENTITYTYPE', 'ENTKARO', 'KARO', 0),
  ('ENTITYTYPE', 'ENTWP', 'E-waste Picker', 1),
  ('ENTITYTYPE', 'ENTRSO', 'Repair Shop', 2),
  ('ENTITYTYPE', 'ENTAGG', 'E-waste Aggregator', 3),
  ('ENTITYTYPE', 'ENTBC', 'Bulk Consumer', 4),
  ('ENTITYTYPE', 'ENTSCHOOL', 'School', 5),
  ('ENTITYTYPE', 'ENTNGO', 'Execution Partner', 6),
  ('ENTITYTYPE', 'ENTNGOSCHOOL', 'Execution Partner - Schools', 7),
  ('ENTITYTYPE', 'ENTRECYCLER', 'Recycler', 8),
  ('ENTITYTYPE', 'ENTPRODUCER', 'Producer', 9),
  ('ENTITYTYPE', 'ENTMP', 'Media Partner', 10),
  ('ENTITYTYPE', 'ENTMPRP', 'Marketing and PR Partner', 11),
  ('ENTITYTYPE', 'ENTGOV', 'Government Body', 12),
  ('ENTITYTYPE', 'ENTLOG', 'Logistics Partner', 13),
  ('ENTITYTYPE', 'ENTCOLPOINT', 'Collection Points', 14),
  ('ENTITYTYPE', 'ENTPCB', 'Pollution Control Board', 15),
  ('ENTITYTYPE', 'ENTCOLCENTRE', 'Collection Centre', 16);

Insert into tLookUpType values ('VISITPURPOSE','Visit Pusrpose') ;
Insert into tLookUp values
  ('VISITPURPOSE', 'VSTONBOARD', 'Onboarding ', 1) ,
  ('VISITPURPOSE', 'VSTAWARNESS', 'Awareness Campaign', 2),
  ('VISITPURPOSE', 'VSTCOLLECTION', 'Collection', 3) ,
  ('VISITPURPOSE', 'VSTRELBUILD', 'Relationship Building', 4),
  ('VISITPURPOSE', 'VSTWORKSHOP', 'Workshop', 5),
  ('VISITPURPOSE', 'VSTCOLENROLL', 'Enrollment', 6),
  ('VISITPURPOSE', 'VSTCOLCB', 'Capacity Building', 7),
  ('VISITPURPOSE', 'VSTCOLAUDIT', 'Audit', 8) ;

Insert into tLookUpType values ('TRANSTYPE','Transaction Type') ;
Insert into tLookUp values
  ('TRANSTYPE', 'TRANSSIGNUP', 'Sign Up', 1) ;

Insert into tLookUpType values ('CARTSTATUS','Cart Status') ;
Insert into tLookUp values
  ('CARTSTATUS', 'CARTCREATED', 'Created', 1),
  ('CARTSTATUS', 'CARTCONFIRMED', 'Confirmed', 2), -- Confirmed and ready to pickup
  ('CARTSTATUS', 'CARTCANCELLED', 'Cancelled', 3),
  ('CARTSTATUS', 'CARTINSPECTED', 'Inspected', 4),
  ('CARTSTATUS', 'CARTSHIPPEDWH', 'Shipped to Warehouse', 5) ;

INSERT INTO tLookUpType VALUES ('TARGET', 'Target');
INSERT INTO tLookUp VALUES
  ('TARGET', 'TGTCOLITEW1-SC001', 'ITEW1: Centralised data processing - Mainframe', 1),
  ('TARGET', 'TGTCOLITEW1-SC002', 'ITEW1: Centralised data processing - Minicomputer', 2),
  ('TARGET', 'TGTCOLITEW2', 'ITEW2: Personal Computing-  Personal computers (CPU with input and output devices)', 3),
  ('TARGET', 'TGTCOLITEW3', 'ITEW3: Personal Computing - Laptop computers (CPU with input and output devices)', 4),
  ('TARGET', 'TGTCOLITEW4', 'ITEW4: Personal Computing - Notebook Computers', 5),
  ('TARGET', 'TGTCOLITEW5', 'ITEW5: Personal Computing - Notepad Computers', 6),
  ('TARGET', 'TGTCOLITEW6', 'ITEW6: Printers including catridges', 7),
  ('TARGET', 'TGTCOLITEW7', 'ITEW7: Copying equipment ', 8),
  ('TARGET', 'TGTCOLITEW15-SC001', 'ITEW15: Cellular telephones - Feature phones ', 9),
  ('TARGET', 'TGTCOLITEW15-SC002', 'ITEW15: Cellular telephones - Smart phones', 10),
  ('TARGET', 'TGTSCLAWARNESS', 'Schools - Awareness Visit', 11),
  ('TARGET', 'TGTSCLONBOARD', 'Schools - Enrolled', 12),
  ('TARGET', 'TGTWP', 'E-waste Pickers - Enrolled', 13),
  ('TARGET', 'TGTRS', 'Repair Shops - Enrolled', 14),
  ('TARGET', 'TGTAGG', 'E-waste Aggregators - Enrolled', 15),
  ('TARGET', 'TGTBC', 'Bulk Consumers - Enrolled', 16),
  ('TARGET', 'TGTNGO', 'Execution Partners - Enrolled', 17),
  ('TARGET', 'TGTNGOSCHOOL', 'Execution Partners Schools - Enrolled', 18),
  ('TARGET', 'TGTPRODUCER', 'Producers - Enrolled', 19),
  ('TARGET', 'TGTLOG', 'Logistics Partners - Enrolled', 20),
  ('TARGET', 'TGTRECYCLER', 'Recyclers - Enrolled', 21),
  ('TARGET', 'TGTARTPUB', 'No.of Articles to Publish', 22),
  ('TARGET', 'TGTMOP', 'Media Organisations - Enrolled', 23),
  ('TARGET', 'TGTEVNT', 'Conferences/Events where Karo participates', 24),
  ('TARGET', 'TGTAE', 'Industry/Trade Associations - Meetings', 25),
  ('TARGET', 'TGTAEPWO', 'Other Organisations - Meetings ', 26),
  ('TARGET', 'TGTEPW', 'No. of Execution Partner Workshops (Central)', 27),
  ('TARGET', 'TGTEPT', 'No. of Execution Partner Trainings (Distributed)', 28),
  ('TARGET', 'TGTEICCTT', 'EICC Trainings', 29),
  ('TARGET', 'TGTVSTSCL', 'Schools Visits', 30),
  ('TARGET', 'TGTVSTRECYCLER', 'No. of Recycler visits', 31),
  ('TARGET', 'TGTVSTRB', 'Government Bodies - Meetings', 32);

TRUNCATE tTargetParameters ;
INSERT INTO tTargetParameters VALUES
  /* Collection */
  ('ITEW1', "ITEW1: Centralised data processing: Mainframes, Minicomputers - 'Servers'", 1, 'COLLECTION'),
  ('ITEW2', "ITEW2: Personal Computing: Personal computers (CPU with input and output devices) - 'Desktop Computers'", 1, 'COLLECTION'),
  ('ITEW3', "ITEW3: Personal Computing: Laptop computers (CPU with input and output devices) - 'Laptops'", 1, 'COLLECTION'),
  ('ITEW4', "ITEW4: Personal Computing: Notebook computers", 1, 'COLLECTION'),
  ('ITEW5', "ITEW5: Personal Computing: Notepad computers", 1, 'COLLECTION'),
  ('ITEW6', "ITEW6: Printers including catridges - 'Personal and Professional Printers'", 1, 'COLLECTION'),
  ('ITEW7', "ITEW7: Copying Equipment - 'Copiers'", 1, 'COLLECTION'),
  ('ITEW15', "ITEW15: Cellular Telephones", 1, 'COLLECTION'),
  /* Enrollment */
  ('ENTWP', "E-waste Pickers - Enrolled", 1, 'ENROLLMENT'),
  ('ENTRSO', "Repair Shops - Enrolled", 1, 'ENROLLMENT'),
  ('ENTAGG', "E-waste Aggregators - Enrolled", 1, 'ENROLLMENT'),
  ('ENTBC', "Bulk Consumers - Enrolled", 1, 'ENROLLMENT'),
  ('ENTSCHOOL', "Schools - Enrolled", 1, 'ENROLLMENT'),
  ('ENTNGO', "Execution Partners - Enrolled", 1, 'ENROLLMENT'),
  ('ENTNGOSCHOOL', "Executions Partner - Schools - Enrolled", 1, 'ENROLLMENT'),
  ('ENTPRODUCER', "Producers - Enrolled", 1, 'ENROLLMENT'),
  ('ENTLOG', "Logistics Partners - Enrolled", 1, 'ENROLLMENT'),
  ('ENTRECYCLER', "Recyclers - Enrolled", 1, 'ENROLLMENT'),
  ('ENTMP', "Media Organisations - Enrolled", 1, 'ENROLLMENT'),
  /* Visit with entity and purpose */
  ('ENTSCHOOL-VSTAWARNESS', "Schools - Awareness Visit", 1, 'VISIT_ENTITY_PURPOSE'),
  /* Visit entity */
  ('VISIT-ENTSCHOOL', "Schools Visits", 1, 'VISIT_ENTITY'),
  ('VISIT-ENTRECYCLER', "No. of Recycler visits", 1, 'VISIT_ENTITY'),
  ('VISIT-ENTPCB', "Government Bodies - Meetings", 1, 'VISIT_ENTITY'),
  /* Others */
  ('TGT-ARTPUB', "No.of Articles to Publish", 0, 'OTHERS'),
  ('TGT-EVNT', "Conferences/Events where Karo participates", 0, 'OTHERS'),
  ('TGT-AE', "Industry/Trade Associations - Meetings", 0, 'OTHERS'),
  ('TGT-AEPWO', "Other Organisations - Meetings", 0, 'OTHERS'),
  ('TGT-EPW', "No. of Execution Partner Workshops (Central)", 0, 'OTHERS'),
  ('TGT-EPT', "No. of Execution Partner Trainings (Distributed)", 0, 'OTHERS'),
  ('TGT-EICCTT', "EICC Trainings", 0, 'OTHERS');

Insert into tLookUpType values ('WORKSHOP','Workshop Type') ;
INSERT INTO tLookUp VALUES
  ('WORKSHOP', 'WSIND', 'Induction', 1),
  ('WORKSHOP', 'WSBPS', 'Best Practice Sharing', 2),
  ('WORKSHOP', 'WSFELICIT', 'Felicitation', 3);

Insert into tLookUpType values ('TOOLKITASSESS','ToolKit Assessment') ;
INSERT INTO tLookUp VALUES
  ('TOOLKITASSESS', 'TKALOP', 'Level of participation', 1),
  ('TOOLKITASSESS', 'TKAQOE', 'Quality of execution', 2),
  ('TOOLKITASSESS', 'TKASMC', 'Social Media Campaign', 3),
  ('TOOLKITASSESS', 'TKAPFS', 'Practices followed for sustainability', 4),
  ('TOOLKITASSESS', 'TKACE', 'Creative Expression', 5),
  ('TOOLKITASSESS', 'TKAEWC', 'E-waste collected', 6);

INSERT INTO tLookUpType VALUES ('TARGETTYPE', 'Target Type');
INSERT INTO tLookUp VALUES
  ('TARGETTYPE', 'TGTTYPEMONTH', 'Monthly', 1),
  ('TARGETTYPE', 'TGTTYPEYEAR', 'Yearly', 2);

INSERT INTO tLookUpType VALUES ('EVALTYPE', 'Evaluation Type');
INSERT INTO tLookUp VALUES
  ('EVALTYPE', 'EVALPARTICIPATION', 'Participation', 1),
  ('EVALTYPE', 'EVALEXCERCISE', 'Excercise', 2),
  ('EVALTYPE', 'EVALEWASTE', 'Ewaste Collected', 3),
  ('EVALTYPE', 'EVALOUTREACH', 'Community Outreach', 4);

INSERT INTO tLookUpType VALUES ('ENROLLSTATUS', 'Enrollment Status');
INSERT INTO tLookUp VALUES
  ('ENROLLSTATUS', 'ENROLLNOTSUBMITTED', 'Not Submitted', 1),
  ('ENROLLSTATUS', 'ENROLLSUBMITTED', 'Submitted', 2),
  ('ENROLLSTATUS', 'ENROLLVRIFIED', 'Verified', 3),
  ('ENROLLSTATUS', 'ENROLLAPPROVED', 'Approved', 4),
  ('ENROLLSTATUS', 'ENROLLREJECTED', 'Rejected', 5);

INSERT INTO tLookUpType VALUES ('GOVBODYTYPE', 'Type of Government body');
INSERT INTO tLookUp VALUES
  ('GOVBODYTYPE', 'GOVBODYMC', 'Municipal Corporation', 1),
  ('GOVBODYTYPE', 'GOVBODYSPCB', 'State Pollution Control Board', 2),
  ('GOVBODYTYPE', 'GOVBODYCPCB', 'Central Pollution Control Board', 3),
  ('GOVBODYTYPE', 'GOVBODYMOEFCC', 'MoEFCC', 4),
  ('GOVBODYTYPE', 'GOVBODYSITD', 'State IT Department', 5),
  ('GOVBODYTYPE', 'GOVBODYSIDC', 'State Industrial Development Corporation', 6),
  ('GOVBODYTYPE', 'GOVBODYMEIY', 'MEITY', 7),
  ('GOVBODYTYPE', 'GOVBODYOTHERS', 'Others', 8);

INSERT INTO tLookUpType VALUES ('AWARNESSTYPE', 'Awarness Type');
INSERT INTO tLookUp VALUES
  ('AWARNESSTYPE', 'AWRNSSRWA', 'RWA', 1),
  ('AWARNESSTYPE', 'AWRNSSDIGITAL', 'Digital(Radio,Web,Social Media etc.', 2),
  ('AWARNESSTYPE', 'AWRNSSCOL', 'College/School', 3),
  ('AWARNESSTYPE', 'AWRNSSBC', 'Bulk Consumer', 4),
  ('AWARNESSTYPE', 'AWRNSSOTHERS', 'Other Projects', 5);

INSERT INTO tLookUpType VALUES ('DOCTYPE', 'Document Type');
INSERT INTO tLookUp VALUES
  ('DOCTYPE', 'DOCANY', 'Any', 1),
  ('DOCTYPE', 'DOCIMAGE', 'Image', 2),
  ('DOCTYPE', 'DOCVIDEO', 'Video', 3),
  ('DOCTYPE', 'DOCAUDIO', 'Audio', 4),
  ('DOCTYPE', 'DOCPDF', 'PDF', 5),
  ('DOCTYPE', 'DOCWORD', 'Word Document', 6),
  ('DOCTYPE', 'DOCEXCEL', 'Excel', 7),
  ('DOCTYPE', 'DOCCSV', 'CSV', 8),
  ('DOCTYPE', 'DOCPPT', 'PPT', 9),
  ('DOCTYPE', 'DOCANYFILE', 'Any File', 10);

INSERT INTO tLookUpType VALUES ('FREQTYPE', 'Frequency Type');
INSERT INTO tLookUp VALUES
  ('FREQTYPE', 'FREQWEEK', 'Weekly', 1),
  ('FREQTYPE', 'FREQMONTH', 'Monthly', 2),
  ('FREQTYPE', 'FREQBIMONTH', 'Bi-Monthly', 3),
  ('FREQTYPE', 'FREQDAILY', 'Daily', 4),
  ('FREQTYPE', 'FREQYEAR', 'Yearly', 5);

INSERT INTO tLookUpType VALUES ('SEVERITY', 'Severity');
INSERT INTO tLookUp VALUES
  ('SEVERITY', 'SVRLOW', 'Low ', 1),
  ('SEVERITY', 'SVRMDM', 'Medium ', 2),
  ('SEVERITY', 'SVRHIGH', 'High ', 3),
  ('SEVERITY', 'SVRCRITICAL', 'Critical ', 4);


TRUNCATE tTargetTypeMappingHeader ;
INSERT INTO tTargetTypeMappingHeader (Entity_Type)
  SELECT LookUp_Code
  FROM tLookUp
  WHERE Type_Code = 'ENTITYTYPE';

INSERT INTO tFinancialYear VALUES
  (1, 2017, '2017-04-01', '2018-03-31', 0),
  (2, 2018, '2018-04-01', '2019-03-31', 0),
  (3, 2019, '2019-04-01', '2020-03-31', 1);

insert into tState (State_ID, State_Name) VALUES
(1,'Jammu & Kashmir'),
(2,'Himachal Pradesh'),
(3,'Punjab'),
(4,'Uttrakhand'),
(5,'Haryana'),
(6,'Rajasthan'),
(7,'Uttar Pradesh'),
(8,'Madhya Pradesh'),
(9,'Chattishgarh'),
(10,'Maharashtra'),
(11,'Gujarat'),
(12,'Orissa'),
(13,'Karnataka'),
(14,'Tamil Nadu'),
(15,'Kerala'),
(16,'Telangana'),
(17,'Andhra Pradesh'),
(18,'Bihar'),
(19,'Jharkhand'),
(20,'West Bengal'),
(21,'Goa'),
(22,'Sikkim'),
(23,'Manipur'),
(24,'Mizoram'),
(25,'Meghalay'),
(26,'Assam'),
(27,'Tripura'),
(28,'Nagaland'),
(29,'Arunachal Pradesh'),
(30,'Delhi'),
(31,'Chandigarh'),
(32,'Puducherry'),
(33,'Daman and Diu'),
(34,'Dadar and Nagar Haveli'),
(35,'Lakshya Deep'),
(36,'Andman Nikobar Dweep Samuh') ;

insert into tCity(State_ID, City_Name,Latitude_Longitude) VALUES
(1,'Jammu','32.7145963,74.719877'),
(1,'Poonch','33.7724703,74.0782042'),
(1,'Srinagar','34.106639,74.6666684'),
(1,'Leh','34.1662418,77.4966976'),
(2,'Simla','31.0782147,77.1240016'),
(3,'Jalandhar','31.3223787,75.5033785'),
(3,'Ludhiana','30.9003263,75.7866325'),
(4,'Dehradun','30.3254098,77.9470939'),
(4,'Haridwar','29.9526313,78.045885'),
(4,'Mussoorie','30.4547186,78.0414205'),
(5,'Panipat','29.3963429,76.8940801'),
(5,'Sonipat','28.9489924,76.9437672'),
(5,'Gurugram','28.424765,76.8496942'),
(5,'Faridabad','28.4024636,77.1789867'),
(5,'Rohtak','28.8895179,76.5462942'),
(6,'Alwar','27.5546242,76.5763349'),
(6,'Neemrana','27.9764353,76.3697003'),
(6,'Bhiwadi','28.2036813,76.8224089'),
(6,'Jaipur','26.8851417,75.6504701'),
(6,'Bikaner','28.0214035,73.2845209'),
(6,'Jodhpur','26.2703358,72.9605024'),
(6,'Ganganagar','29.9090984,73.8440324'),
(7,'Noida','28.5166817,77.2580425'),
(7,'Meerut','28.9872441,77.6289195'),
(7,'Ghaziabad','28.699581,77.2549409'),
(7,'Lucknow','26.848623,80.802425'),
(7,'Allahabad','25.4021974,81.6614967'),
(7,'Kanpur','26.4471054,80.198295'),
(8,'Bhopal','23.1993477,77.2658034'),
(8,'Indore','22.7239117,75.7237618'),
(9,'Raipur','21.2618911,81.5490323'),
(9,'Bilaspur','22.0629858,82.0685546'),
(9,'Bhilai','21.1952534,81.268034'),
(10,'Nagpur','21.1610282,78.9324219'),
(10,'Chandpur','21.5218691,79.8127953'),
(10,'Yavatmal','20.3884338,78.0838672'),
(10,'Pune','18.5245649,73.7228789'),
(10,'Mumbai','19.0821978,72.7410977'),
(10,'Satara','17.6740294,73.9832416'),
(10,'Aurangabad','19.8700826,75.2351604'),
(11,'Ahmedabad','23.0201818,72.4396545'),
(11,'Rajkot','22.2734719,70.7512554'),
(11,'Baroda','22.3220425,73.0329981'),
(11,'Surat','21.1591425,72.682208'),
(12,'Bhubaneshwar','20.3008284,85.6803648'),
(12,'Cuttack','20.4630933,85.7977049'),
(13,'Bengaluru','12.9538477,77.3507349'),
(13,'Mysuru','12.3106368,76.5656487'),
(13,'Hosur','12.7378317,77.7626863'),
(14,'Chennai','13.0473748,79.9288071'),
(14,'Coimbatore','11.0116775,76.827146'),
(14,'Sriperumbadur belt','12.9418144,79.8932068'),
(15,'Trivandrum','8.4997079,76.7840776'),
(15,'Kochi','9.9385818,76.1803445'),
(15,'Wayanad','11.7141243,75.8289794'),
(15,'Mallapuram','11.1058311,75.6275278'),
(15,'Kozhikode','11.255802,75.670725'),
(16,'Hyderabad','17.4122998,78.267957'),
(17,'Vijayawada','16.5101531,80.5744202'),
(17,'Vishakhapatnam','17.7384734,82.982388'),
(17,'Guntur','16.3235591,80.3644775'),
(18,'Patna','25.6080208,85.0730021'),
(19,'Ranchi','23.3431425,85.1812382'),
(19,'Jamshedpur','22.7840131,86.1057299'),
(19,'Dhanbad','23.8020368,86.3642089'),
(20,'Kolkata','22.6757521,88.0495272'),
(21,'Goa','15.3465132,73.4517905'),
(22,'Gangtok','27.3401313,88.5854554'),
(23,'Imphal','24.8061343,93.8663691'),
(24,'Aizawl','23.7443614,92.6415436'),
(25,'Shillong','25.5901143,91.8223963'),
(26,'Dispur','26.1443949,91.7860675'),
(26,'Guwahati','26.1429809,91.5627951'),
(26,'Golaghat','26.5143225,93.9308517'),
(27,'Agartala','23.8510778,91.2243072'),
(28,'Kohima','25.67471,94.0717857'),
(29,'Itanagar','27.6081674,89.8467699'),
(30,'Delhi','28.6466772,76.8130646'),
(31,'Chandigarh','30.7350626,76.6934882'),
(32,'Puducherry','11.9362931,79.7785083'),
(33,'Daman and Diu','20.5541391,71.328269'),
(34,'Dadar and Nagar Haveli','20.2073394,72.9336722'),
(35,'Lakshya Deep','10.7291373,72.7283611'),
(36,'Andman Nikobar Dweep Samuh','10.1846485,88.7501093'),
(35,'Karavatti','10.0935221,74.1266138'),
(17,'Amaravathi','16.5719701,80.348956'),
(11,'Gandhinagar','23.2206942,72.5755072'),
(21,'Panaji','15.4832361,73.8034995'),
(34,'Silvasa','20.2665228,72.970225')
(3,'Phagwara','31.2240,75.7708'),
(14,'Kanchipuram','12.8342,79.7036'),
(14,'Vellore','12.9165,79.1325'),
(14,'Ooty','11.4064,76.6932'),
(15,'Chelembra, Malappuram District','11.1524','75.8672'),
(15,'Puthur, Palakkad District','9.0425,76.7134'),
(15,'Omaserry, Kozhikode District','11.258753,75.780411'),
(15,'Kattangal, Kozhikode District','11.3182,75.9376'),
(15,'Perumanna, Kozhikode District','11.2451,75.8849'),
(15,'Puthukode, Palakkad District','10.6327,76.4505'),
(15,'Kizhakkoth, Kozhikode District','11.3908,75.8941'),
(10,'Vasai','19.3919,72.8397'),
(10,'Thane','19.2183,72.9781'),
(29,'Nirjuli','27.845148,95.247345'),
(29,'Naharlagun','27.0986,93.6949'),
(8,'Rajgarh','23.8509,76.7337'),
(8,'Mwoh','23.473324,77.947998'),
(18,'Munger','25.3748,86.4735'),
(2,'Solan','30.9045,77.0967'),
(18,'Buxar','25.5647,83.9777'),
(15,'Mananthavady','11.8014,76.0044')
(1,'Akhnoor','34.083656,74.797371'),
(18,'Muzaffarpur','26.1209,85.3647'),
(10,'Chandrapur','19.9705,79.3015'),
(10,'Rajura','19.7775,79.3663'),
(10,'Yavatmal','20.3888,78.1204'),
(10,'Bhadravati','20.1003,79.1146'),
(10,'Warora','20.2407,79.0136'),
(10,'Wani','20.0608,78.9571'),
(10,'Hingaghat','20.5506,78.8411'),
(32, 'Mahe','11.7027,75.5364'),
(6, 'Sri Dungagarh','28.0944,74.0060'),
(10,'Rajoli','20.668909,79.6048915'),
(10,'Bhadrawati','20.1003,79.1146'),
(10,'Mul','20.0652,79.6752'),
(10,'Patri','19.233209,73.119829'),
(10,'Sindewahi','20.2879,79.6580'),
(18,'Gaya','24.7955,84.9994'),
(28,'Dimapur','25.8630,93.7537'),
(5,'Ambala','30.3782,76.7767'),
(5,'Bawal','28.0975,76.5893'),
(5,'Bhibari','30.30,74.60'),
(5,'Dharuhera','28.2053,76.7954'),
(5,'Karnal','29.6857,76.9905'),
(5,'Manesar','28.3543,76.9398'),
(5,'Paligaon','28.365296,77.2592994'),
(5,'Palwal','28.1487,77.3320'),
(5,'Panchgaon','28.1518,76.7178'),
(5,'Sikandarpur','28.4794,77.1068'),
(10,'Ballarpur','19.8390,79.3635'),
(10,'Korpana','19.7392,78.9903'),
(15,'Calicut','11.2588,75.7804'),
(15,'Kottayam','9.5916,76.5222'),
(1,'Samba','32.5530,75.1108'),
(8,'Ujjain','23.1793,75.7849'),
(6,'Udaipur','24.5854,73.7125'),
(5, 'Bahadurgarh', '28.6924,76.9240'),
(7, 'Hapur','28.6924,76.9240'),
(12, 'Subarnapur','28.6924,76.9240'),
(17,'Krishna',1,''),
(26,'Kamrup Metropolitan',1,''),
(21,'Saligao',''),
(21,'North Goa',''),
(21,'Mapusa',''),
(5,'Karnal',''),
(2,'Parwanoo',''),
(2,'Palampur',''),
(2,'Solan',''),
(13,'Mangalore',''),
(15,'Payyannur',''),
(15,'Ernakulam',''),
(15,'Thrissur',''),
(15,'Changanacherry',''),
(15,'Palakkad',''),
(8,'Jabalpur',''),
(8,'Dewas',''),
(10,'Nasik',''),
(10,'Panvel',''),
(28,'Dimapur',''),
(12,'Khordha',''),
(3,'Zirakpur',''),
(6,'Udaipur',''),
(14,'Madurai',''),
(16,'Secunderabad',''),
(16,'Mahabubnagar',''),
(7,'Varanasi',''),
(7,'Gautam Buddha Nagar',''),
(4,'Haldwani',''),
(26, 'Bongaigaon', ''),
(26, 'Tinsukia', ''),
(18, 'Chapra', ''),
(18, 'Bhagalpur', ''),
(18, 'Darbhanga', ''),
(5, 'Kurukshetra', ''),
(5, 'Fatehabad', ''),
(2, 'Kangra', ''),
(1, 'Anantnag', ''),
(19, 'Hazaribagh', ''),
(19, 'Jhumritilaiya', ''),
(19, 'Bokaro', ''),
(13, 'Davangere', ''),
(13, 'Bijapur', ''),
(13, 'Karwar', ''),
(12, 'Balasore', ''),
(12, 'Puri', ''),
(6, 'Ajmer', ''),
(6, 'Chittorgarh', ''),
(16, 'Karimnagar', ''),
(7, 'Bareilly', ''),
(7, 'Sambhal', ''),
(20, 'Islampur', ''),
(20, 'Rampurhat', ''),
(20, 'Bankura', ''),
(20, 'Simlapal', ''),
(20, 'Kadamtala', ''),
(20, 'Behrampore', ''),
(20, 'Bhangar', ''),
(20, 'Coochbehar', ''),
(20, 'Barrackpore', ''),
(7,'Mathura',''),
(7,'Panchkula',''),
(7,'Moradabad',''),
(13,'Dharwad',null),
(10,'Bhiwandi',null),
(10,'Umarkhed',null),
(20,'Hooghly',null),
(20,'Darjeeling',null),
(5, 'Kundli', null),
(7, 'Agra', null),
(4, 'Roorkee',null),
(2, 'Dharamshala',null),
(2, 'Baddi',  null),
(20, 'Siliguri',  null),
(8, 'Gwalior', NULL),
(7, 'Siddharth Nagar', NULL),
(3, 'Amritsar', NULL),
(18, 'Maheshkhunt & Khagaria', NULL),
(10, 'Nilanga', NULL),
(5, 'Panchkula', NULL ),
(1,'Udhampur',null),
(1,'Kathua',null),
(1,'Anantnag',null) ;


INSERT INTO tDocuments (Document_Name) VALUES
('PAN Number'),
('Adhar Number'),
('VAT Number'),
('GST Number'),
('Service Tax Number') ;

INSERT INTO tDocumentRequirement
(Document_ID, Entity_Type, Is_Required) VALUES
(1,'ENTWP',1),
(2,'ENTWP',1),
(3,'ENTWP',1),
(4,'ENTWP',1),

(1,'ENTRSO',1),
(2,'ENTRSO',0),
(3,'ENTRSO',1),
(4,'ENTRSO',1),

(1,'ENTAGG',1),
(2,'ENTAGG',0),
(3,'ENTAGG',1),
(4,'ENTAGG',1),

(1,'ENTBC',1),
(2,'ENTBC',0),
(3,'ENTBC',1),
(4,'ENTBC',1),

(1,'ENTNGO',1),
(2,'ENTNGO',0),
(3,'ENTNGO',1),
(4,'ENTNGO',1),
(5,'ENTNGO',1),

(1,'ENTNGOSCHOOL',1),
(2,'ENTNGOSCHOOL',0),
(3,'ENTNGOSCHOOL',1),
(4,'ENTNGOSCHOOL',1),
(5,'ENTNGOSCHOOL',1),

(1,'ENTRECYCLER',1),
(2,'ENTRECYCLER',0),
(3,'ENTRECYCLER',1),
(4,'ENTRECYCLER',1),
(5,'ENTRECYCLER',1),

(1,'ENTPRODUCER',1),
(2,'ENTPRODUCER',0),
(3,'ENTPRODUCER',1),
(4,'ENTPRODUCER',1),
(5,'ENTPRODUCER',1),

(1,'ENTLOG',1),
(2,'ENTLOG',0),
(3,'ENTLOG',1),
(4,'ENTLOG',1),
(5,'ENTLOG',1) ;

insert into tBank (Bank_Name) VALUES
('A U Small Finance Bank'),
('Airtel Payments Bank'),
('Axis Bank'),
('Bandhan Bank'),
('Bank of Baroda'),
('Bank of India'),
('Bank of Maharashtra'),
('Canara Bank'),
('Capital Lab Small Finance Bank'),
('Catholic Syrian Bank'),
('Central Bank of India'),
('City Union Bank'),
('Coastal Local Area Bank Limited'),
('Corporation Bank'),
('DCB Bank'),
('Dena Bank'),
('Dhanlaxmi Bank'),
('Disha Small Finance Bank'),
('Equitas Small Finance Bank'),
('ESAF Small Finance Bank'),
('Federal Bank'),
('Fino Payment Bank'),
('HDFC Bank'),
('ICICI Bank'),
('IDBI Bank'),
('IDFC Bank'),
('India Post Payments Bank'),
('Indian Bank'),
('Indian Overseas Bank'),
('IndusInd Bank'),
('Jammu and Kashmir Bank'),
('Janalakshmi Small Finance Bank'),
('Karnataka Bank'),
('Karur Vysya Bank'),
('Kotak Mahindra Bank'),
('Krishna Bhima Samruddhi Local Area Bank Limited'),
('Lakshmi Vilas Bank'),
('Nainital Bank'),
('Oriental Bank of Commerce'),
('Paytm Payments Bank'),
('Punjab & Sindh Bank'),
('Punjab National Bank'),
('RBL Bank'),
('RGVN Small Finance Bank'),
('South Indian Bank'),
('State Bank of India'),
('Subhadra Local Area Bank Limited'),
('Suryoday Small Finance Bank'),
('Syndicate Bank'),
('Tamilnad Mercantile Bank'),
('UCO Bank'),
('Ujjivan Small Finance Bank'),
('Union Bank of India'),
('United Bank of India'),
('Utkarsh Small Finance Bank'),
('Vijaya Bank'),
('YES Bank') ;

INSERT INTO tCategory (Category_ID,Category_Code,Category_Name,Parent_Category_ID,UOM_ID,Price) values
(1,'ITEW1','Centralised data processing: Mainframes, Minicomputers - \'Servers\'',null,1,null),
(2,'ITEW1-SC001','Mainframe ',1,1,17),
(3,'ITEW1-SC002','Minicomputer',1,1,18),
(4,'ITEW1-SC003','Switch',1,1,17.5),
(5,'ITEW1-SC004','Router',1,1,19),
(6,'ITEW1-SC005','Power Cords/Cables',1,1,20),
(7,'ITEW1-SC006','Adaptors',1,1,18),
(8,'ITEW1-SC007','Server',1,1,18.5),
(9,'ITEW2','Personal Computing: Personal computers (CPU with input and output devices) - \'Desktop Computers\'',null,1,null),
(10,'ITEW2-SC001','Central Processing Unit (CPU)',9,1,17),
(11,'ITEW2-SC002','CRT Monitors',9,1,18),
(12,'ITEW2-SC003','LCD Monitors',9,1,17.5),
(13,'ITEW2-SC004','Mouse ',9,1,19),
(14,'ITEW2-SC005','Keyboard',9,1,20),
(15,'ITEW2-SC006','Power Supplies',9,1,18),
(16,'ITEW2-SC007','Cables',9,1,18.5),
(17,'ITEW2-SC008','Mother board',9,1,18),
(18,'ITEW2-SC009','Hard Disc',9,1,18.5),
(19,'ITEW3','Personal Computing: Laptop computers (CPU with input and output devices) - \'Laptops\'',null,1,null),
(20,'ITEW3-SC001','Panel',19,1,17),
(21,'ITEW3-SC002','Keypad',19,1,18),
(22,'ITEW3-SC003','Hard Disc',19,1,17.5),
(23,'ITEW3-SC004','Charger',19,1,19),
(24,'ITEW3-SC005','Battery',19,1,20),
(25,'ITEW3-SC006','Laptop',19,1,18),
(26,'ITEW4','Personal Computing: Notebook computers',null,1,null),
(27,'ITEW4-SC001','Panel',26,1,17),
(28,'ITEW4-SC002','Keypad',26,1,18),
(29,'ITEW4-SC003','Hard Disc',26,1,17.5),
(30,'ITEW4-SC004','Charger',26,1,19),
(31,'ITEW4-SC005','Battery',26,1,20),
(32,'ITEW4-SC006','Laptop',26,1,18),
(33,'ITEW5','Personal Computing: Notepad computers',null,1,null),
(34,'ITEW5-SC001','Tablets',33,1,18),
(35,'ITEW5-SC002','Chargers',33,1,17.5),
(36,'ITEW6','Printers including catridges - \'Personal and Professional Printers\'',null,1,null),
(37,'ITEW6-SC001','Printers',36,1,17),
(38,'ITEW6-SC002','Toner',36,1,18),
(39,'ITEW6-SC003','Cartridge',36,1,17.5),
(40,'ITEW6-SC004','Adapter',36,1,19),
(41,'ITEW6-SC005','Cables',36,1,20),
(42,'ITEW6-SC006','Boards - Regular',36,1,18),
(43,'ITEW6-SC007','Boards - Power Supply',36,1,17.5),
(44,'ITEW6-SC008','Plastic',36,1,19),
(45,'ITEW7','Copying Equipment - \'Copiers\'',null,1,null),
(46,'ITEW7-SC001','Printers',45,1,17),
(47,'ITEW7-SC002','Toner',45,1,18),
(48,'ITEW7-SC003','Cartridge',45,1,17.5),
(49,'ITEW7-SC004','Adapter',45,1,19),
(50,'ITEW7-SC005','Cables',45,1,20),
(51,'ITEW7-SC006','Boards - Regular',45,1,18),
(52,'ITEW7-SC007','Boards - Power Supply',45,1,17.5),
(53,'ITEW7-SC008','Plastic',45,1,19),
(54,'ITEW15','Cellular Telephones',null,1,null),
(55,'ITEW15-SC001','Smart Phones - Samsung, Blackberry, LG, Motorola, Nokia',54,1,17),
(56,'ITEW15-SC002','Smart Phones- Lava, Micromax, Karbonn, Oppo, Vivo',54,1,18),
(57,'ITEW15-SC003','Feature Phones',54,1,17.5),
(58,'ITEW15-SC004','Mobile Phones PCB',54,1,19),
(59,'ITEW15-SC005','Batteries',54,1,20),
(60,'ITEW15-SC006','Chargers',54,1,18),
(61,'ITEW15-SC007','Plastic Items',54,1,17.5),
(62,'ITEW15-SC008','Handsfree / Data Cable ',54,1,19),
(63,'ITEW15-SC009','Mixed Electronic Components',54,1,21) ;

TRUNCATE tUOM;
INSERT INTO tUOM (UOM_ID, UOM_Type) VALUES (1, 'Kgs'), (2, 'Units');

TRUNCATE tMonth;
INSERT INTO tMonth VALUES
  (1, 'January', 'Jan', 10),
  (2, 'February', 'Feb', 11),
  (3, 'March', 'Mar', 12),
  (4, 'April', 'Apr', 1),
  (5, 'May', 'May', 2),
  (6, 'June', 'Jun', 3),
  (7, 'July', 'Jul', 4),
  (8, 'August', 'Aug', 5),
  (9, 'September', 'Sep', 6),
  (10, 'October', 'Oct', 7),
  (11, 'November', 'Nov', 8),
  (12, 'December', 'Dec', 9);

truncate tCategoryPrice ;
INSERT INTO tCategoryPrice
(Category_Price_ID, Category_ID, Lower_Range, Upper_Range, Price, State_ID) VALUES
(1, 2, 0, 100, 18, NULL),
(2, 2, 100, 200, 19, NULL),
(3, 2, 200, 300, 19, NULL),
(4, 3, 0, 100, 19, NULL),
(5, 3, 100, 200, 20, NULL),
(6, 3, 200, 300, 20, NULL),
(7, 4, 0, 100, 18.5, NULL),
(8, 4, 100, 200, 19.5, NULL),
(9, 4, 200, 300, 19.5, NULL),
(10, 5, 0, 100, 20, NULL),
(11, 5, 100, 200, 21, NULL),
(12, 5, 200, 300, 21, NULL),
(13, 6, 0, 100, 21, NULL),
(14, 6, 100, 200, 22, NULL),
(15, 6, 200, 300, 22, NULL),
(16, 7, 0, 100, 19, NULL),
(17, 7, 100, 200, 20, NULL),
(18, 7, 200, 300, 20, NULL),
(19, 8, 0, 100, 19.5, NULL),
(20, 8, 100, 200, 20.5, NULL),
(21, 8, 200, 300, 20.5, NULL),
(22, 10, 0, 100, 18, NULL),
(23, 10, 100, 200, 19, NULL),
(24, 10, 200, 300, 19, NULL),
(25, 11, 0, 100, 19, NULL),
(26, 11, 100, 200, 20, NULL),
(27, 11, 200, 300, 20, NULL),
(28, 12, 0, 100, 18.5, NULL),
(29, 12, 100, 200, 19.5, NULL),
(30, 12, 200, 300, 19.5, NULL),
(31, 13, 0, 100, 20, NULL),
(32, 13, 100, 200, 21, NULL),
(33, 13, 200, 300, 21, NULL),
(34, 14, 0, 100, 21, NULL),
(35, 14, 100, 200, 22, NULL),
(36, 14, 200, 300, 22, NULL),
(37, 15, 0, 100, 19, NULL),
(38, 15, 100, 200, 20, NULL),
(39, 15, 200, 300, 20, NULL),
(40, 16, 0, 100, 19.5, NULL),
(41, 16, 100, 200, 20.5, NULL),
(42, 16, 200, 300, 20.5, NULL),
(43, 17, 0, 100, 19, NULL),
(44, 17, 100, 200, 20, NULL),
(45, 17, 200, 300, 20, NULL),
(46, 18, 0, 100, 19.5, NULL),
(47, 18, 100, 200, 20.5, NULL),
(48, 18, 200, 300, 20.5, NULL),
(49, 20, 0, 100, 18, NULL),
(50, 20, 100, 200, 19, NULL),
(51, 20, 200, 300, 19, NULL),
(52, 21, 0, 100, 19, NULL),
(53, 21, 100, 200, 20, NULL),
(54, 21, 200, 300, 20, NULL),
(55, 22, 0, 100, 18.5, NULL),
(56, 22, 100, 200, 19.5, NULL),
(57, 22, 200, 300, 19.5, NULL),
(58, 23, 0, 100, 20, NULL),
(59, 23, 100, 200, 21, NULL),
(60, 23, 200, 300, 21, NULL),
(61, 24, 0, 100, 21, NULL),
(62, 24, 100, 200, 22, NULL),
(63, 24, 200, 300, 22, NULL),
(64, 25, 0, 100, 19, NULL),
(65, 25, 100, 200, 20, NULL),
(66, 25, 200, 300, 20, NULL),
(67, 27, 0, 100, 18, NULL),
(68, 27, 100, 200, 19, NULL),
(69, 27, 200, 300, 19, NULL),
(70, 28, 0, 100, 19, NULL),
(71, 28, 100, 200, 20, NULL),
(72, 28, 200, 300, 20, NULL),
(73, 29, 0, 100, 18.5, NULL),
(74, 29, 100, 200, 19.5, NULL),
(75, 29, 200, 300, 19.5, NULL),
(76, 30, 0, 100, 20, NULL),
(77, 30, 100, 200, 21, NULL),
(78, 30, 200, 300, 21, NULL),
(79, 31, 0, 100, 21, NULL),
(80, 31, 100, 200, 22, NULL),
(81, 31, 200, 300, 22, NULL),
(82, 32, 0, 100, 19, NULL),
(83, 32, 100, 200, 20, NULL),
(84, 32, 200, 300, 20, NULL),
(85, 34, 0, 100, 19, NULL),
(86, 34, 100, 200, 20, NULL),
(87, 34, 200, 300, 20, NULL),
(88, 35, 0, 100, 18.5, NULL),
(89, 35, 100, 200, 19.5, NULL),
(90, 35, 200, 300, 19.5, NULL),
(91, 37, 0, 100, 18, NULL),
(92, 37, 100, 200, 19, NULL),
(93, 37, 200, 300, 19, NULL),
(94, 38, 0, 100, 19, NULL),
(95, 38, 100, 200, 20, NULL),
(96, 38, 200, 300, 20, NULL),
(97, 39, 0, 100, 18.5, NULL),
(98, 39, 100, 200, 19.5, NULL),
(99, 39, 200, 300, 19.5, NULL),
(100, 40, 0, 100, 20, NULL),
(101, 40, 100, 200, 21, NULL),
(102, 40, 200, 300, 21, NULL),
(103, 41, 0, 100, 21, NULL),
(104, 41, 100, 200, 22, NULL),
(105, 41, 200, 300, 22, NULL),
(106, 42, 0, 100, 19, NULL),
(107, 42, 100, 200, 20, NULL),
(108, 42, 200, 300, 20, NULL),
(109, 43, 0, 100, 18.5, NULL),
(110, 43, 100, 200, 19.5, NULL),
(111, 43, 200, 300, 19.5, NULL),
(112, 44, 0, 100, 20, NULL),
(113, 44, 100, 200, 21, NULL),
(114, 44, 200, 300, 21, NULL),
(115, 46, 0, 100, 18, NULL),
(116, 46, 100, 200, 19, NULL),
(117, 46, 200, 300, 19, NULL),
(118, 47, 0, 100, 19, NULL),
(119, 47, 100, 200, 20, NULL),
(120, 47, 200, 300, 20, NULL),
(121, 48, 0, 100, 18.5, NULL),
(122, 48, 100, 200, 19.5, NULL),
(123, 48, 200, 300, 19.5, NULL),
(124, 49, 0, 100, 20, NULL),
(125, 49, 100, 200, 21, NULL),
(126, 49, 200, 300, 21, NULL),
(127, 50, 0, 100, 21, NULL),
(128, 50, 100, 200, 22, NULL),
(129, 50, 200, 300, 22, NULL),
(130, 51, 0, 100, 19, NULL),
(131, 51, 100, 200, 20, NULL),
(132, 51, 200, 300, 20, NULL),
(133, 52, 0, 100, 18.5, NULL),
(134, 52, 100, 200, 19.5, NULL),
(135, 52, 200, 300, 19.5, NULL),
(136, 53, 0, 100, 20, NULL),
(137, 53, 100, 200, 21, NULL),
(138, 53, 200, 300, 21, NULL),
(139, 55, 0, 100, 18, NULL),
(140, 55, 100, 200, 19, NULL),
(141, 55, 200, 300, 19, NULL),
(142, 56, 0, 100, 19, NULL),
(143, 56, 100, 200, 20, NULL),
(144, 56, 200, 300, 20, NULL),
(145, 57, 0, 100, 18.5, NULL),
(146, 57, 100, 200, 19.5, NULL),
(147, 57, 200, 300, 19.5, NULL),
(148, 58, 0, 100, 20, NULL),
(149, 58, 100, 200, 21, NULL),
(150, 58, 200, 300, 21, NULL),
(151, 59, 0, 100, 21, NULL),
(152, 59, 100, 200, 22, NULL),
(153, 59, 200, 300, 22, NULL),
(154, 60, 0, 100, 19, NULL),
(155, 60, 100, 200, 20, NULL),
(156, 60, 200, 300, 20, NULL),
(157, 61, 0, 100, 18.5, NULL),
(158, 61, 100, 200, 19.5, NULL),
(159, 61, 200, 300, 19.5, NULL),
(160, 62, 0, 100, 20, NULL),
(161, 62, 100, 200, 21, NULL),
(162, 62, 200, 300, 21, NULL) ;

INSERT INTO tCategoryDefaultPriceRange VALUES (0, 100), (101, 500), (501, NULL);


TRUNCATE tExercise;
INSERT INTO tExercise (Exercise) VALUES
  ('Circular Economy'),
  ('Understanding the Life-Cycle of Waste'),
  ('Design for Environment'),
  ('E-wareness'),
  ('E-waste Collection Drive'),
  ('Work for Environment'),
  ('Sustainable Consumption and Production'),
  ('Circular Economy'),
  ('Introduction to Waste and Its Solution Via EPR'),
  ('Electronic Waste'),
  ('Plastic Waste'),
  ('Let’s Make It Possible - KARO SAMBHAV!'),
  ('Climate Change and Culture');

TRUNCATE tActivity;
INSERT INTO tActivity (Exercise_ID, Activity) VALUES
  (1, 'Exploring circular economy'),
  (1, 'Industrial symbiosis model'),
  (2, 'Understanding Zero-waste Life Style'),
  (2, 'My Trash, My Responsibility'),
  (2, 'Radio Show- Waste as a Resource'),
  (3, 'Making Informed Decisions'),
  (3, "Let's Re-design"),
  (3, 'Debate: Environment Friendly Products'),
  (4, "Let's learn about e-waste"),
  (4, 'Let us find out a solution'),
  (5, 'Planning an e-waste collection drive'),
  (5, 'E-waste collecyion drive'),
  (6, 'Interaction with an Environmentalist'),
  (6, 'Petition Filing'),
  (7, 'Understanding Sustainable Development and Sustainable Development Goals'),
  (7, 'SDG-12: Can we contribute to Sustainable Consumption and Production'),
  (8, 'Enabling Circular Economy: Finding wisdom from older generation'),
  (8, 'Life Cycle Thinking: Is my favourite gadget affecting the environment?'),
  (9, 'Waste Management: How is the waste managed in my community?'),
  (9, 'Extended Producer Responsibility- a way forward'),
  (10, 'Life cycle thinking for solving e-waste issue'),
  (10, 'Exploring the existing e-waste network'),
  (11, 'Plastic Waste: Tracking how we are contributing to plastic waste'),
  (11, 'Understanding Plastic Waste Management Rules'),
  (12, 'E-waste awareness and collection drive'),
  (12, 'Make some noise'),
  (13, 'Dirty carbon – acid rain deteriorates monuments'),
  (13, 'Looking Local - Climate change and culture at home');

INSERT INTO tTargetTypeMappingDetail (Mapping_ID, Target_Parameter_Code)
  SELECT
    4,
    Target_Parameter_Code
  FROM tTargetParameters;

INSERT INTO tTargetTypeMappingDetail (Mapping_ID, Target_Parameter_Code)
  SELECT
    11,
    Target_Parameter_Code
  FROM tTargetParameters
  WHERE Object_Type = 'COLLECTION';

INSERT INTO tTargetTypeMappingDetail (Mapping_ID, Target_Parameter_Code)
  SELECT
    8,
    Target_Parameter_Code
  FROM tTargetParameters
  WHERE Object_Type IN ('COLLECTION', 'ENROLLMENT', 'VISIT_ENTITY');


INSERT INTO tTargetTypeMappingDetail (Mapping_ID, Target_Parameter_Code)
  SELECT
    9,
    Target_Parameter_Code
  FROM tTargetParameters
  WHERE Object_Type IN ('COLLECTION', 'ENROLLMENT', 'VISIT_ENTITY_PURPOSE');

INSERT INTO tWHGRNDocumentConfig (Name, Type, Is_Required, Added_On, Last_Updated_ON, Sort_Order) VALUES
  ('Picture of the Vehicle - Front', 'ANY', 1, now(), now(), 1),
  ('Picture of Lorry Receipt', 'ANY', 1, now(), now(), 4),
  ('Entering Invoice Number and Uploading a picture of the Invoice', 'ANY', 1, now(), now(), 5),
  ('E-way Bill', 'ANY', 0, now(), now(), 6),
  ('Picture of Form-6', 'ANY', 0, now(), now(), 7),
  ('Picture of the Driver’s License', 'ANY', 0, now(), now(), 8),
  ('Picture of the Vehicle - Rear', 'ANY', 1, now(), now(), 2),
  ('Picture of the Vehicle - Side', 'ANY', 1, now(), now(), 3),
  ('Invoice - Blackened (For Producers)', 'ANY', 0, now(), now(), 9),
  ('Weighing Slip', 'ANY', 0, now(), now(), 10),
  ('Declaration Form', 'ANY', 0, now(), now(), 11),
  ('Picture of the vehicle - Unload', 'ANY', 1, now(), now(), 1) ;

INSERT INTO tRecyclerGRNDocumentConfig (Name, Type, Is_Required, Added_On, Last_Updated_ON, Sort_Order, Is_Direct)
VALUES
  ('Picture of the Vehicle', 'ANY', 0, now(), now(), 1, 0),
  ('Picture of Lorry Receipt', 'ANY', 0, now(), now(), 2, 0),
  ('Entering Invoice Number and Uploading a picture of the Invoice', 'ANY', 0, now(), now(), 3, 0),
  ('Picture of the E-way Bill', 'ANY', 0, now(), now(), 4, 0),
  ('Picture of Form-6', 'ANY', 0, now(), now(), 5, 0),
  ('Picture of the Driver’s License', 'ANY', 0, now(), now(), 5, 0),
  ('Picture of the Goods Received Note', 'ANY', 0, now(), now(), 6, 0),
  ('Karo Invoice - Blackened (For Producers)', 'ANY', 0, now(), now(), 9, 0),
  ('E-Way Bill - Blackened (For Producers)', 'ANY', 0, now(), now(), 10, 0),
  ('Weighing Slip', 'ANY', 0, now(), now(), 11, 0),
  ('Entering Invoice Number and Uploading a picture of the Invoice (Seller Invoice)', 'ANY', 0, now(), now(), 12, 1),
  ('Seller Invoice - Blackened (For Producers)', 'ANY', 0, now(), now(), 13, 1),
  ('COD', 'ANY', 0, now(), now(), 14, 0),
  ('Picture of Vehicle at Recyler location', 'ANY', 0, now(), now(), 1, 0),
  ('Weighing Slip By  Recycler', 'ANY', 0, now(), now(), 1, 0),
  ('Toll Tax Receipts', 'ANY', 0, now(), now(), 1, 0),
  ('Picture of Vehicle at Recyler location', 'ANY', 0, now(), now(), 1, 0),
  ('Picture of Form-6 - Stamped (Green)', 'ANY', 0, now(), now(), 1, 0) ;

INSERT INTO tVerificationStatus VALUES
  (1, 'Pending Upload', 0, 0, NULL, NULL, 1),
  (2, 'Upload - To be verified', 0, 0, NULL, NULL, 1),
  (3, 'Checked - Rework', 0, 1, NULL, NULL, 1),
  (4, 'Verified', 0, 1, NULL, NULL, 1),
  (5, 'Verified - Exception', 0, 1, NULL, NULL, 1),
  (6, 'Verified - Final', 1, 0, NULL, NULL, 1);

INSERT into tStatus ( Transaction_Type, Status_Display, Is_Final, Is_Default) VALUES
  ('DBCRNOTE', 'PENDIG', 0, 1),
  ('DBCRNOTE', 'OPEN', 0, 0),
  ('DBCRNOTE', 'VERIFIED', 0, 0),
  ('DBCRNOTE', 'CLOSED', 1, 0),
  ('TICKET', 'PENDING', 0, 1),
  ('TICKET', 'OPEN', 0, 0),
  ('TICKET', 'CLOSED', 1, 0);

INSERT INTO tVault (Vault_ID, Created_On, Created_By, Type, Name, File_Type, Left_Node, Right_Node, Is_Delete, Last_Updated_On, Last_Updated_By, Parent_ID)
  VALUE
  (1, now(), NULL, 'FOLDER', 'My Vault', NULL, 1, 2, 0, now(), NULL, NULL);

insert into tFileFolderType (Type, Display, Type_Code, Is_Delete) VALUES
  ('RETURNS', 'Returns', 'VRETURNS', 0),
  ('KAROINV', 'Invoice', 'VINVOICE', 0),
  ('SUBMISSION', 'Submission', 'VSUBMISSION', 0),
  ('OTHERS', 'Other', 'VOTHER', 0) ;

INSERT INTO tExcelHelperHeader (Created_By, Created_On, Object_Type, Transaction_Type, Is_Active, Last_Updated_By, Last_Updated_On)
VALUES
  (NULL, now(), 'DBCRNOTE', 'UPLOAD', 1, NULL, now());

INSERT INTO tExcelHelperDetail (Excel_ID, Column_Name, Column_Type, Attribute, Default_Value, Is_Mandatory, Is_Upload_Column, Sort_Order)
VALUES
  (1, 'Invoice ID', 'INT', 'invoice_id', '', 0, 0, 1),
  (1, 'Invoice Number', 'STRING', 'invoice_number', '', 0, 0, 2),
  (1, 'Invoice Date', 'DATE', 'invoice_date', '', 0, 0, 3),
  (1, 'Item ID', 'INT', 'item_id', '', 0, 0, 4),
  (1, 'Item Name', 'STRING', 'item_name', '', 0, 0, 5),
  (1, 'Category', 'STRING', 'category', '', 0, 0, 6),
  (1, 'Quantity', 'FLOAT', 'quantity', '', 0, 0, 7),
  (1, 'Rate', 'FLOAT', 'rate', '', 0, 0, 8),
  (1, 'GST', 'FLOAT', 'gst', '', 0, 0, 9),
  (1, 'Your Rate', 'FLOAT', 'your_rate', '', 0, 1, 10),
  (1, 'Your GST', 'FLOAT', 'your_gst', '', 0, 1, 11);

TRUNCATE tConfig;
INSERT INTO tConfig (Config_Item, Configured_Value) VALUES
  ('CHURN', 300),
  ('PICKUP_THRESHOLD', 2),
  ('PAYMENT_THRESHOLD', 1),
  ('RECYCLER_GST', 5),
  ('SELLER_GST', 5),
  ('IS_TRANSACTION_DATE_ENABLED', 1),
  ('WORKFLOW_DEFAULT_ASSIGNEE', 1),
  ('DBCRNOTE_DEFAULT_ASSIGNEE', 1);


insert into tTicketType (Ticket_Type) VALUES  ('POE'), ('INVOICE') ;


$$
