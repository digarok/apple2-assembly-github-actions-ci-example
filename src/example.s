****************************************
* Example                              *
*                                      *
*  Dagen Brock <dagenbrock@gmail.com>  *
*  2020-02-10                          *
****************************************

                  org   $2000                   ; start at $2000 (all ProDOS8 system files)
                  dsk   example.system          ; tell compiler what name for output file
                  typ   $ff                     ; set P8 type ($ff = "SYS") for output file

MLI               equ   $bf00

Main              ldx   #0

:lp1              lda   _demoStr,x
                  beq   :doneStr
                  sta   $400,x
                  inx
                  bne   :lp1

:doneStr          jsr   $FD0C                   ; wait for key
                  jmp   Quit


_demoStr          STR   "WELCOME TO THE FUTURE.",00

Quit              jsr   MLI                     ; first actual command, call ProDOS vector
                  dfb   $65                     ; with "quit" request ($65)
                  da    QuitParm
                  bcs   Error
                  brk   $00                     ; shouldn't ever  here!

QuitParm          dfb   4                       ; number of parameters
                  dfb   0                       ; standard quit type
                  da    $0000                   ; not needed when using standard quit
                  dfb   0                       ; not used
                  da    $0000                   ; not used


Error             brk   $00                     ; shouldn't be here either
