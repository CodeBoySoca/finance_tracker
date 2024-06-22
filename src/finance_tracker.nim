import std/math
import strutils, typetraits
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
    echo "Very good! Lets set up your account\n"
    echo "First, lets get your full name:"
    let fullname: string = readLine(stdin)
    echo "What is your username? (this is what you will use when you log in):"
    let username: string = readLine(stdin)
    echo "Nice, now we will need your password:"
    let passwd: string = readLine(stdin)
    echo "Next, to help you manage your money, we will need to know your monthly salary after taxes(ex. 5000)\n"
    echo "salary:$"
    let salary: int = readLine(stdin).parseInt()
    let formattedSalary: int = fmt"{salary}00".parseInt()
    createAccount(username, fullname, passwd, formattedSalary)
elif optionResult == 2:
    #getAccount()
    discard
elif optionResult == 3:
    #cancelAccount()
    discard
else:
    echo "Please enter a valid option"
