import nimcrypto
import db_connector/db_sqlite



proc createAccount*(username: string, fullname: string,  password: string, salary: int)=
   let db = open("accounts.db", "", "", "")
   db.exec(sql"INSERT INTO user (username, fullname, password, salary) VALUES (?, ?, ?, ?)", username, fullname, keccak_256.digest(password), salary)
   db.close()
    
# proc getAccount*(username: string, password: string): string  =
#     for x in db.fastRows(sql"SELECT (user_id) FROM user WHERE username=? AND password=?", username, keccak_256.digest(password)):
#         echo x

proc cancelAccount*(username: string, password: string)=
    discard

