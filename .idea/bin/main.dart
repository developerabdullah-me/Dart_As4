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
      print(balance);
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
  SavingsAccount savings = SavingsAccount(123456, 1000.0, 0.05);
  savings.deposit(1000.0);
  savings.withdraw(00.0);

  print("Savings Account Balance: \$${savings.balance.toStringAsFixed(2)}");

  CurrentAccount current = CurrentAccount(789012, 2000.0, 1000.0);
  current.deposit(300.0);
  current.withdraw(00.0);

  print("Current Account Balance: \$${current.balance.toStringAsFixed(2)}");
}
