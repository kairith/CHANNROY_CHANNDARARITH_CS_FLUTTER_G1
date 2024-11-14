class BankAccount {
     final String accountOwner;
     final int accountID;
     double _balance  = 0;

     BankAccount({

      required this.accountOwner,
      required this.accountID
     });
     double get balance => _balance;

     void credit(double amount) {
       if (amount <= 0) {
         throw Exception('invalid amount');
       }
       _balance += amount;
     }

     void withdraw(double amount) {
       if (amount <= 0) {
         throw Exception('invalid amount');
       }
       if (_balance < amount) {
         throw Exception('insufficient balance for withdrawal!');
       }
       _balance -= amount;
     }
}
      class Bank {

    final String name ;
    final Map<int, BankAccount> _accounts = {};

    Bank({
      required this.name
    });

    BankAccount createAccount({
      required String accountOwner,
      required int accountID,
      required double deposit
      
      })
      {
          
          if(_accounts.containsKey(accountID)) {
            throw Exception("Account ID $accountID is already exists!");
          }
          BankAccount account = BankAccount(
          accountID: accountID,
          accountOwner: accountOwner,
      );
      if(deposit > 0) {
        account.credit(deposit);
      }
      _accounts[accountID] = account;
      return account;
      }

  }
  
  void main() {

    Bank myBank = Bank(name: "CADT Bank");
    BankAccount ronanAccount = myBank.createAccount(accountOwner: "ronan", deposit : 0 , accountID: 100);

    print('balance : \$${ronanAccount.balance}'); // Balance: $0
    ronanAccount.credit(100);
    print('balance : \$${ronanAccount.balance}'); // Balance: $100

    ronanAccount.withdraw(50);
    print('balance : \$${ronanAccount.balance}'); // Balance: $50

    try {
      ronanAccount.withdraw(75); // This will throw an exception
    } catch (e) {
      print(e); // Output: Insufficient balance for withdrawal!
    }
    try {
      myBank.createAccount(accountOwner:  'Honlgy' , accountID: 100 , deposit: 10); // This will throw an exception
    } catch (e) {
      print(e); // Output: Account with ID 100 already exists!
    }
}
