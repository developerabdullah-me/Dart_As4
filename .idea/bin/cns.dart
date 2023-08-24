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
      print('After interestRate Banlance $balance');
      print("Withdrawal of $amount successful.");
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
      print("Withdrawal of $amount successful.");
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
  savings.deposit(500.0);
  print(
      "Savings Account Balance after deposit: ${savings.balance.toStringAsFixed(2)}");
  savings.withdraw(70.0);
  print(
      "Savings Account Balance after withdrawal: ${savings.balance.toStringAsFixed(2)}");
  print('------------CurrentAccountBalance------------');

  // Create an instance of CurrentAccount
  CurrentAccount current = CurrentAccount(789012, 2000.0, 1000.0);
  print("Current Account Balance: ${current.balance.toStringAsFixed(2)}");

  // Perform operations on CurrentAccount instance
  current.deposit(2000.0);
  print(
      "Current Account Balance after deposit: ${current.balance.toStringAsFixed(2)}");
  current.withdraw(2500.0);
  print(
      "Current Account Balance after withdrawal: ${current.balance.toStringAsFixed(2)}");
}
