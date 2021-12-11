class Goal {
  final String userId;
  final String category;
  final String title;
  final int goal;
  final String frequency;
  final int amount;
  final int currentBalance;
// removed the amount Deposited bit
  Goal({
    this.userId,
    this.category,
    this.title,
    this.goal,
    this.frequency,
    this.amount,
    this.currentBalance,
  });
}
