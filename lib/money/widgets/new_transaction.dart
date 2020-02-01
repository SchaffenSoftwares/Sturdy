import 'dart:io';

import 'package:sturdy/money//widgets/adaptive_flat_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:sturdy/money//widgets/adaptive_flat_button.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx) {
    print('Constructor NewTransaction Widget');
  }

  @override
  _NewTransactionState createState() {
    print('Createstate newstransaction widget');
    return _NewTransactionState();
  }
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectedDate;

  _NewTransactionState() {
    print('construction new transaction state');
  }

  @override
  void initState() { 
    super.initState();
    print('initstate()');
    
  }
  @override
  void didUpdateWidget(NewTransaction oldWidget) {
    print('Did update widget()');
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    print('dispose()');
    super.dispose();
  }

  void _submitData() {
    if (_amountController.text.isEmpty) {
      return;
    }
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);

    // VALIDATION: HAving this exits the function is either are true siince we don't want to then execute addTx
    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null) {
      return;
    }

    // Allows access of properties and methods inside widget class to be used inside state class
    widget.addTx(
      enteredTitle,
      enteredAmount,
      _selectedDate,
    );

    // Closes modal after submitting data/new transaction. NAvigator pop closes the top most screen
    // Context is a special property available to give context of the widget
    Navigator.of(context).pop();
  }

  // Allows the date picker to return a value, stored in the datetime variable above
  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 3,
        child: Container(
          padding: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom +
                10, //Stuff coming into view, like keyboard
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: 'Title'),
                controller: _titleController,
                autofocus: true,
                onSubmitted: (_) => _submitData(),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Amount'),
                controller: _amountController,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => _submitData(),
              ),
              Container(
                height: 70,
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: Text(_selectedDate == null
                            ? 'No Date Chosen!'
                            : 'Picked Date: ${DateFormat.yMd().format(_selectedDate)}')),
                    AdaptiveFlatButton("Choose Date", _presentDatePicker),
                  ],
                ),
              ),
              RaisedButton(
                child: Text('Add Transaction'),
                color: Theme.of(context).primaryColor,
                textColor: Theme.of(context).textTheme.button.color,
                onPressed: _submitData,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
