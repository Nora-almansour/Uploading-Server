 INSERT INTO info ( FileName, ID, recoredID) 
VALUES ('sal', ID.NEXTVAL , (select max(ID) from information));