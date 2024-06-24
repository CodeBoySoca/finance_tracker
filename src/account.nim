import nimcrypto
import strutils
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
        


proc createAccount*(userAccount: Account)=
   let db = open("accounts.db", "", "", "")
   db.exec(sql"INSERT INTO user (username, fullname, password, salary) VALUES (?, ?, ?, ?)", userAccount.username, userAccount.fullname, keccak_256.digest(userAccount.password), userAccount.salary)
   db.close()
    
proc getAccount*(username: string, password: string): int =
    let db = open("accounts.db", "", "", "")
    var userId: int
    for x in db.fastRows(sql"SELECT (user_id) FROM user WHERE username=? AND password=?", username, keccak_256.digest(password)):
        userId = x[0].parseInt()
    return userId

proc saveExpense*(expenseReport: seq[Expense])=
    let db = open("accounts.db", "", "", "")
    for expense in expenseReport:
        db.exec(sql"INSERT INTO debts (name, amount, user_id) VALUES(?, ?, ?)", expense.name, expense.amount, expense.user_id)

    
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