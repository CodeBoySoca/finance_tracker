import std/math
import strutils, typetraits
import std/strformat
import std/tables
from std/sequtils import zip

import account


echo "****************************************"
echo "\n***** Welcome to Finance Tracker *****\n\n"
echo "\t\tMain menu\t\t"
echo "---------------------------------------"
echo "[1] create an account"
echo "[2] sign into account"
echo "[3] cancel your account"
echo "Enter your choice and press Enter "
echo "\n"
stdout.write(":")
let optionResult = readLine(stdin).parseInt()
echo "\n"

if optionResult == 1:
    #create account
    echo "Very good! Lets set up your account"
    echo "\n"
    stdout.write("First, lets get your full name: ")
    let fullname: string = readLine(stdin)
    echo "\n"
    stdout.write("What is your username? (this is what you will use when you log in): ")
    let username: string = readLine(stdin)
    echo "\n"
    stdout.write("Nice, now we will need your password: ")
    let passwd: string = readLine(stdin)
    echo "\n"
    echo "Next, to help you manage your money, we will need to know your monthly salary after taxes(ex. 5000)\n"
    stdout.write("salary:$ ")
    let salary: int = readLine(stdin).parseInt()
    let formattedSalary: int = fmt"{salary}00".parseInt()
    echo "\n"
    createAccount(username, fullname, passwd, formattedSalary)

  #save expense
    echo "Great, now you will need to start adding your monthly expenses. Press [1] followed by enter to continue\n"
    var expenses = newSeq[string]()
    var amounts = newSeq[int]()
    var expenseReport = initTable[string, int]()
    stdout.write(":")
    var expenseOption = readLine(stdin).parseInt()
    echo "\n"
    while true:  
      if expenseOption == 1:
          stdout.write("Name of monthly expense: ")
          var expense: string = readLine(stdin)
          expenses.add(expense)
          echo "\n"
          stdout.write("Enter amount:$ ")
          var amount = readLine(stdin).parseInt()
          amounts.add(amount)
          echo "\n"
          echo "to continue press [1] and enter/ to exit to the main menu press [2] and enter"
          stdout.write(":")
          var exitMainMenu = readLine(stdin).parseInt()
          echo "\n"
          if exitMainMenu == 2:
              for items in zip(expenses, amounts):
                  let (expense, amount) = items
                  expenseReport[expense] = amount
              echo expenseReport   #saveExpense(expenseReport)
              break



    #expense menu
    # echo "Great, your expense has been saved. What do you want to do next?"
    # echo "[1] add another expense"
    # echo "[2] view your expense report"
    # echo "[3] add savings"
    # echo "[4] exit"
    # echo "Enter your choice and press Enter "
    # let option = readLine(stdin).parseInt()
    # if option == 1:
    #    discard
    # elif option == 2:
    #    discard
    # elif option == 3:
    #    discard  
    # else:
    #    discard




elif optionResult == 2:
    #getAccount()
    discard
elif optionResult == 3:
    #cancelAccount()
    discard
else:
    echo "Please enter a valid option"
