import 'package:flutter/foundation.dart';

// Creates a Dart class, not a widget, to be used as transaction objects
class Transaction {
  String id, title;
  double amount;
  DateTime date;

  // Creates a constructor, using @required from Flutter Foundation which means the class object has to be created with all these props.
  Transaction({@required this.id, 
  @required this.title, 
  @required this.amount,
  @required this.date});
}
