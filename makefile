#!/bin/sh

sys:
	nasm sys.asm -o ./bin/SYS.COM -f bin -l ./lst/sys.lst -O0v
