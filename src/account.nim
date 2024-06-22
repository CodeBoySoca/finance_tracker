import std/strformat
import nimcrypto


proc createAccount*(username: string, password: string)=
   let hashed_passwd = keccak_256.digest(password)
    
proc getAccount*(username: string, password: string): string  =
    discard

proc cancelAccount*(username: string, password: string)=
    discard