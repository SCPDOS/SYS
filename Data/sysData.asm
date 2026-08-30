sysDrive    db -1   ;Drive we want to install the system files on
memoryBlock dq 0    ;Null ptr is unused
inCrit      db 0    ;If -1, in critical section
sectorSize  dw 0
secPerClus  db 0
clustCnt    dd 0    ;Used for figuring out the FAT type
dpbPtr      dq 0    ;Used for finding the first sector of the Root Dir
xfrSector   dq 0    ;Used to temporarily store the sector number

;Free Cluster Information Backup (to overcome DOS's destruction)
dFreeClustCnt   dd -1  ;Number of free clusters, -1 unknown

biosPair:
biosHdlSrc  dw -1   ;File handles
biosHdlDst  dw -1

dosPair:
dosHdlSrc   dw -1
dosHdlDst   dw -1

cmdPair:
cmdHdlSrc   dw -1
cmdHdlDst   dw -1

biosNamePair:
biosFile    db "A:\SCPBIOS.SYS",0   ;A should be overwritten with current drive
biosNameL   equ $ - biosFile
biosDest    db "A:\SCPBIOS.SYS",0
dosNamePair:
dosFile     db "A:\SCPDOS.SYS",0
dosNameL   equ $ - dosFile
dosDest     db "A:\SCPDOS.SYS",0
cmdNamePair:
cmdFile     db "A:\COMMAND.COM",0
cmdNameL   equ $ - cmdFile
cmdDest     db "A:\COMMAND.COM",0
;Data for Boot Sector
biosSector  dq 0
biosSize    dw 0
dosSector   dq 0

rootDir  db "A:\*.*",0  ;A should be overwritten with the letter given

;Messages
badVerStr   db "Invalid DOS Version",CR,LF,"$"
badDrvLtr   db "Invalid Drive Specified",CR,LF,"$"
badRootDir  db "Root Directory Not Empty",CR,LF,"$"
badSearch   db "Error Finding System Files",CR,LF,"$"
badOpen     db "Cannot Open System Files.",CR,LF,"$"
badCreate   db "Cannot Create System Files.",CR,LF,"$"
badCopy     db "Error Transferring System Files",CR,LF,"$"
badMem      db "Not Enough Memory to Transfer System Files",CR,LF,"$"
badSecSize  db "Invalid Medium Sector Size",CR,LF,"$"
badDirectI  db "Unable to Read File",CR,LF,"$"
badDirectO  db "Unable to Write File",CR,LF,"$"
okMsg       db "System Transfer Complete",CR,LF,"$"