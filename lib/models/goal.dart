class Goal {
  final String userId;
  final String category;
  final String title;
  final int goal;
  final String frequency;
  final int amount;
  final int currentBalance;
  final String goalId;
// removed the amount Deposited bit
  Goal({
    this.userId,
    this.category,
    this.title,
    this.goal,
    this.frequency,
    this.amount,
    this.currentBalance,
    this.goalId,
  });
}

class GoalData {
  final String userId;
  final String category;
  final String title;
  final int goal;
  final String frequency;
  final int amount;
  final int currentBalance;

  GoalData({
    this.userId,
    this.category,
    this.title,
    this.goal,
    this.frequency,
    this.amount,
    this.currentBalance,
  });
}
