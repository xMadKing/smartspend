class Payment {
  final int paymentID;
  final int categoryID;
  final String paymentDate;
  final num paymentAmount;


  Payment({
    required this.paymentID,
    required this.categoryID,
    required this.paymentDate,
    required this.paymentAmount,
  });

  Map<String, dynamic> toMap() {
    return {
      "paymentID" : paymentID,
      "categoryID" : categoryID,
      "paymentDate" : paymentDate,
      "paymentAmount" : paymentAmount,
    };
  }

  @override
  String toString(){
    return 'Payment{ID: $paymentID, Category: $categoryID, '
        'Payment Date: $paymentDate, Amount: $paymentAmount}';
  }
}