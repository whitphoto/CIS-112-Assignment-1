       IDENTIFICATION DIVISION.
 
       PROGRAM-ID.  PAYROLL.
      ********************************************************
      * THIS PROGRAM READS EMPLOYEE DATA, CALCULATES WEEKLY *
      * WAGES AND PRINTS A PAYROLL REPORT.                  * 
      *******************************************************
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT INPUT-FILE ASSIGN TO "INFILE.TXT"
            ORGANIZATION  IS LINE  SEQUENTIAL.
         SELECT OUTPUT-FILE ASSIGN TO "OUTFILE.TXT"
            ORGANIZATION  IS LINE SEQUENTIAL.
       DATA DIVISION.
       FILE SECTION.
       FD  INPUT-FILE.
       01  INPUT-REC.
            05  EMPLOYEE-NAME-IN     PIC X(20).
            05  HOURS-WORKED-IN      PIC 9(02).
            05  HOURLY-RATE-IN       PIC 9V99.
           FD  OUTPUT-FILE.           	
       01  OUTPUT-REC PIC X(78).
        WORKING-STORAGE SECTION.
       01  EOF PIC X VALUE 'N'.
       01  DETAIL-LINE.
             05  FILLER               PIC X(20) VALUE SPACES. 
             05  NAME-OUT             PIC X(20).
             05  FILLER               PIC X(10) VALUE SPACES.
             05  HOURS-OUT            PIC 9(2).
             05  FILLER               PIC X(8) VALUE SPACES.
             05  RATE-OUT             PIC 9.99.
             05  FILLER               PIC X(6) VALUE SPACES.
             05  WEEKLY-WAGES-OUT     PIC 999.99.
           05  FILLER               PIC XX VALUE SPACES.
        PROCEDURE DIVISION.
        100-MAIN.
          OPEN INPUT INPUT-FILE 
          OUTPUT OUTPUT-FILE.
        PERFORM UNTIL EOF = 'Y'
            READ INPUT-FILE
               AT END MOVE 'Y' TO EOF
              NOT AT END
                 MOVE SPACES TO OUTPUT-REC
                 MOVE EMPLOYEE-NAME-IN TO NAME-OUT
                 MOVE HOURS-WORKED-IN  TO HOURS-OUT
                 MOVE HOURLY-RATE-IN   TO RATE-OUT
                 MULTIPLY HOURS-WORKED-IN BY HOURLY-RATE-IN
		 	        GIVING WEEKLY-WAGES-OUT
                 WRITE OUTPUT-REC FROM DETAIL-LINE END-WRITE
         END-READ        
        END-PERFORM.
       CLOSE INPUT-FILE, OUTPUT-FILE.
       STOP RUN.  