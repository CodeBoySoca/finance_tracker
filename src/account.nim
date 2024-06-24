import nimcrypto
import strutils
import std/strformat
import std/math
import db_connector/db_sqlite

type
   Account* = object
      username*: string
      fullname*: string
      password*: string
      salary*: int

type
   Expense* = object
      name*: string
      amount*: int
      user_id*: int


proc expenseCalculator(userId: int, expenseAmount: seq[int])=
    let db = open("accounts.db", "", "", "")
    var salary: int
    for item in db.fastRows(sql"SELECT (salary) FROM user WHERE user_id=?", userId):
         salary = item[0].parseInt()
    var amountSum: int = sum(expenseAmount)
    var result:int = salary - amountSum
    echo result
           

proc createAccount*(userAccount: Account)=
   let db = open("accounts.db", "", "", "")
   db.exec(sql"INSERT INTO user (username, fullname, password, salary) VALUES (?, ?, ?, ?)", userAccount.username, userAccount.fullname, keccak_256.digest(userAccount.password), userAccount.salary)
   db.close()
    
proc getAccount*(username: string, password: string): int =
    let db = open("accounts.db", "", "", "")
    var userId: int
    for item in db.fastRows(sql"SELECT (user_id) FROM user WHERE username=? AND password=?", username, keccak_256.digest(password)):
        userId = item[0].parseInt()
    return userId

proc saveExpense*(expenseReport: seq[Expense])=
    let db = open("accounts.db", "", "", "")
    for expense in expenseReport:
        db.exec(sql"INSERT INTO debts (name, amount, user_id) VALUES(?, ?, ?)", expense.name, expense.amount, expense.user_id)

proc viewExpenseReport*(userId: int)=
    let db = open("accounts.db", "", "", "")
    var amounts = newSeq[int]()
    echo "---------------- Expense Report -----------------"
    echo "\n" 
    echo "expense                              amount"
    echo "-------------------------------------------------"
    for item in db.fastRows(sql"SELECT * FROM debts WHERE user_id=?", userId):
          echo alignLeft(item[1], 40) & item[2]
          amounts.add(item[2].parseInt())
    echo "-------------------------------------------------"
    echo "\n"
    stdout.write("After your bills are paid you are left with: $") 
    expenseCalculator(userId, amounts)

    
proc cancelAccount*(username: string, password: string)=
   discard


proc expenseReport*()=
    discard

proc addExpense*()=
    discard

proc addSavings*()=
    discard

proc percentageCalculator*()=
    discard

proc generatePDF*()=
    discard

