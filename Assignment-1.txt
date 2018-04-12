       identification division.
       program-id. payroll.
      ******************************************************
      ** this program reads employee data, clculates weekly*
      ** wages and prints a payroll report                 *
      ******************************************************
       environment division.
       input-output division.
       file-control.
           Select input-file assign to "infile.txt"
                  organization is line sequential
           select output-file assign to "outfile.txt"
                  organization is line sequential.
       data division.
       File section.
       FD input-file.
       01 input-file.
           05 employee-name-in pic x(20).
           05 hours-worked-in pic 9(02).
           05 hourly-rate-in pic 9v99.
       FD output-file.
       01 output-rec pic x(78).
       working-storage section.
       01 eof pic x value "n".
       01 detail-line. 
           05 filler  pic x(20) value spaces.
           05 name-out  pic x(20).
           05 filler  pic x(10) value spaces. 
           05 hours-out pic 9(2).
           05 filler  pic x(8) value spaces.
           05 rate-out pic 9.99.
           05 filler pic x(6) value spaces.
           05 weekly-wages-out pic 999.99.
           05 filler pic xx value spaces.
         
       procedure division.
       100-main.
       open input-file.
       perform until eof = "y"
       read input-file.
       at end move "y" to eof
       not at end
       move spaces to output-rec
       move employee-name-in to name-out
       move hours-worked-in to hours-out
       move hourly-rate-in to rate-out
       multiply hours-worked-in to rate-out
       giving weekly-wages-out
       write output-rec from detail-line end-write
       end-read
       end-perform.
       close input-file, output-file.
       stop run.
           goback.
       
       end program Program1.