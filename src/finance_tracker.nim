import std/math
import strutils
import std/strformat

import account


echo "****************************************"
echo "\n***** Welcome to Finance Tracker *****\n\n"
echo "\t\tMain menu\t\t"
echo "---------------------------------------"
echo "[1] create an account"
echo "[2] sign into account"
echo "[3] cancel your account"
echo "Enter your choice and press Enter"
let optionResult = readLine(stdin).parseInt()

if optionResult == 1:
   #createAccount()
elif optionResult == 2:
   #getAccount()
elif optionResult == 3:
   #cancelAccount()
else:
   echo "Please enter a valid option"
