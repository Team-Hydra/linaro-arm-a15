-- CD5003A.ADA

--                             Grant of Unlimited Rights
--
--     Under contracts F33600-87-D-0337, F33600-84-D-0280, MDA903-79-C-0687,
--     F08630-91-C-0015, and DCA100-97-D-0025, the U.S. Government obtained 
--     unlimited rights in the software and documentation contained herein.
--     Unlimited rights are defined in DFAR 252.227-7013(a)(19).  By making 
--     this public release, the Government intends to confer upon all 
--     recipients unlimited rights  equal to those held by the Government.  
--     These rights include rights to use, duplicate, release or disclose the 
--     released technical data and computer software in whole or in part, in 
--     any manner and for any purpose whatsoever, and to have or permit others 
--     to do so.
--
--                                    DISCLAIMER
--
--     ALL MATERIALS OR INFORMATION HEREIN RELEASED, MADE AVAILABLE OR
--     DISCLOSED ARE AS IS.  THE GOVERNMENT MAKES NO EXPRESS OR IMPLIED 
--     WARRANTY AS TO ANY MATTER WHATSOEVER, INCLUDING THE CONDITIONS OF THE
--     SOFTWARE, DOCUMENTATION OR OTHER INFORMATION RELEASED, MADE AVAILABLE 
--     OR DISCLOSED, OR THE OWNERSHIP, MERCHANTABILITY, OR FITNESS FOR A
--     PARTICULAR PURPOSE OF SAID MATERIAL.
--*
-- OBJECTIVE:
--     CHECK THAT A 'WITH' CLAUSE NAMING 'SYSTEM' NEED NOT BE GIVEN FOR
--     A PACKAGE BODY CONTAINING AN ADDRESS CLAUSE AS LONG AS A 'WITH'
--     CLAUSE IS GIVEN FOR THE SPECIFICATION.

-- HISTORY:
--     RJW 10/13/88  CREATED ORIGINAL TEST.
--     BCB 04/18/89  CHANGED EXTENSION TO '.ADA'.  REMOVED APPLICABILITY
--                   CRITERIA AND N/A ERROR MESSAGES.
-- PWN 11/30/94 ADDED A PROCEDURE TO KEEP PACKAGE BODIES LEGAL.

WITH SYSTEM;
PACKAGE CD5003A_PKG2 IS 
     PROCEDURE REQUIRE_BODY;
END CD5003A_PKG2;

WITH SPPRT13;
WITH REPORT; USE REPORT;
PRAGMA ELABORATE (SPPRT13);
PRAGMA ELABORATE (REPORT);
PACKAGE BODY CD5003A_PKG2 IS
     TEST_VAR : INTEGER;
     FOR TEST_VAR USE AT SPPRT13.VARIABLE_ADDRESS;
     USE SYSTEM;

     PROCEDURE REQUIRE_BODY IS
     BEGIN
       NULL;
     END;
BEGIN
     TEST ("CD5003A", "CHECK THAT A 'WITH' CLAUSE NAMING 'SYSTEM' " &
                      "NEED NOT BE GIVEN FOR A PACKAGE BODY " &
                      "CONTAINING AN ADDRESS CLAUSE AS LONG AS A " &
                      "'WITH' CLAUSE IS GIVEN FOR THE SPECIFICATION");

     TEST_VAR := IDENT_INT (3);

     IF TEST_VAR /= 3 THEN
          FAILED ("INCORRECT VALUE FOR TEST_VAR");
     END IF;

     IF TEST_VAR'ADDRESS /= SPPRT13.VARIABLE_ADDRESS THEN
          FAILED ("INCORRECT ADDRESS FOR TEST_VAR");
     END IF;

END CD5003A_PKG2;

WITH REPORT; USE REPORT;
WITH CD5003A_PKG2; USE CD5003A_PKG2;
WITH SPPRT13;
PROCEDURE CD5003A IS
BEGIN

    RESULT;
END CD5003A;
