abstract class Account {
  int accountNumber;
  double balance;

  Account(this.accountNumber, this.balance);

  void deposit(double amount) {
    balance += amount;
  }

  void withdraw(double amount);
}

class SavingsAccount extends Account {
  double interestRate;

  SavingsAccount(int accountNumber, double balance, this.interestRate)
      : super(accountNumber, balance);

  @override
  void withdraw(double amount) {
    if (amount <= balance) {
      balance -= amount;
      balance += balance * interestRate;
    } else {
      print("Insufficient funds for withdrawal.");
    }
  }
}

class CurrentAccount extends Account {
  double overdraftLimit;

  CurrentAccount(int accountNumber, double balance, this.overdraftLimit)
      : super(accountNumber, balance);

  @override
  void withdraw(double amount) {
    if (amount <= balance + overdraftLimit) {
      balance -= amount;
    } else {
      print("Insufficient funds for withdrawal.");
    }
  }
}

void main() {
  // Create an instance of SavingsAccount
  SavingsAccount savings = SavingsAccount(123456, 1000.0, 0.05);
  print("Savings Account Balance: ${savings.balance.toStringAsFixed(2)}");

  // Perform operations on SavingsAccount instance
  double initialSavingsBalance = savings.balance;
  savings.deposit(500.0);
  savings.withdraw(300.0);
  double balanceDifferenceSavings = initialSavingsBalance - savings.balance;

  print("Savings Account Balance after operations: ${savings.balance.toStringAsFixed(2)}");
  print('');
  print("Balance Difference after withdrawal: ${balanceDifferenceSavings.toStringAsFixed(2)}");

  // Create an instance of CurrentAccount
  CurrentAccount current = CurrentAccount(789012, 2000.0, 1000.0);
  print('');
  print("Current Account Balance: ${current.balance.toStringAsFixed(2)}");

  // Perform operations on CurrentAccount instance
  double initialCurrentBalance = current.balance;
  current.deposit(300.0);
  current.withdraw(2500.0);
  double balanceDifferenceCurrent = initialCurrentBalance - current.balance;
  print('');
  print("Current Account Balance after operations: ${current.balance.toStringAsFixed(2)}");
  print('');
  print("Balance Difference after withdrawal: ${balanceDifferenceCurrent.toStringAsFixed(2)}");
}
