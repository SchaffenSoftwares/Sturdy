import 'dart:io'; // Allows Platform checks like .isIOS

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:sturdy/money//widgets/new_transaction.dart';
import 'package:sturdy/money//widgets/transaction_list.dart';
import 'package:sturdy/money//models/transaction.dart';
import 'package:sturdy/money//widgets/chart.dart';

import 'home_page/navigation_bloc.dart';

void main() => runApp(Money());

class Money extends StatelessWidget with NavigationStates{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expenses',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        accentColor: Colors.amber,
        fontFamily: 'Quicksand',
        textTheme: ThemeData.light().textTheme.copyWith(
          title: TextStyle(
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
          button: TextStyle(color: Colors.white),
        ),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
            title: TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 20,
              letterSpacing: 1.8,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with WidgetsBindingObserver {
  final List<Transaction> _userTransactions = [
    // Transaction(
    //     id: 't1', title: 'New Shoes', amount: 69.99, date: DateTime.now()),
    // Transaction(
    //     id: 't2',
    //     title: 'Weekly Groceries',
    //     amount: 16.53,
    //     date: DateTime.now()),
  ];
  bool _showChart = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print(state);
  }

  @override
  dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  // A getter to provide the last week of transactions
  List<Transaction> get _recentTransactions {
    return _userTransactions.where((tx) {
      return tx.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList(); // .where runs a function on every item in the list and returns a new list if truthy
  }

  void _addNewTransaction(String title, double amount, DateTime chosenDate) {
    final newTx = Transaction(
        id: DateTime.now().toString(),
        title: title,
        amount: amount,
        date: chosenDate);

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NewTransaction(_addNewTransaction),
        );
      },
    );
  }

  void _deleteTransaction(String id) {
    setState(
          () {
        _userTransactions.removeWhere(
              (tx) {
            return tx.id == id;
          },
        );
      },
    );
  }

  List<Widget> _buildLandscapeContent(
      MediaQueryData mediaQuery, AppBar appBar, Widget txListWidget) {
    return [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Show Chart',
            style: Theme.of(context).textTheme.title,
          ),
          Switch.adaptive(
            // .adaptive switches to the Cupertino look when on IOS
            activeColor: Theme.of(context).accentColor,
            value: _showChart,
            onChanged: (val) {
              setState(() {
                _showChart = val;
              });
            },
          ),
        ],
      ),
      _showChart
          ? Container(
        height: (mediaQuery.size.height -
            appBar.preferredSize.height -
            mediaQuery.padding.top) *
            0.7,
        child: Chart(_recentTransactions),
      )
          : txListWidget
    ];
  }

  List<Widget> _buildPortraitContent(
      MediaQueryData mediaQuery, AppBar appBar, Widget txListWidget) {
    return [
      Container(
        height: (mediaQuery.size.height -
            appBar.preferredSize.height -
            mediaQuery.padding.top) *
            0.3,
        child: Chart(_recentTransactions),
      ),
      txListWidget
    ];
  }

  Widget _buildAppBarContent() {
    return Platform.isIOS
        ? CupertinoNavigationBar(
      middle: const Text('Personal Expenses'), // title
      trailing: Row(
        //actions
        mainAxisSize: MainAxisSize
            .min, // Sets to minimum size of its child instead of default full width
        children: <Widget>[
          GestureDetector(
            // custom built icon button for IOS
            child: Icon(CupertinoIcons.add),
            onTap: () => _startAddNewTransaction(context),
          ),
        ],
      ),
    )
        : AppBar(
      title: const Text('Personal Expenses'),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () => _startAddNewTransaction(context),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final isLandscape = mediaQuery.orientation ==
        Orientation.landscape; // Find out which oreintation we're in
    // Below - we set type as PrederredSizeQWidget since we get an error on the getter and we tell Dart it is a prefferedsizewidget
    final PreferredSizeWidget appBar = _buildAppBarContent();
    final txListWidget = Container(
      height: (mediaQuery.size.height -
          appBar.preferredSize.height -
          mediaQuery.padding.top) *
          0.7,
      child: TransactionList(_userTransactions, _deleteTransaction),
    );
    final pageBody = SafeArea(
      // SafeArea allows IOS top to be reserved for correct positioning
      child: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // Special if statement that allows a list to be rendered determined on true or false of the condition {} aren't required
            if (isLandscape)
              ..._buildLandscapeContent(
                mediaQuery,
                appBar,
                txListWidget,
              ),

            if (!isLandscape)
              ..._buildPortraitContent(
                mediaQuery,
                appBar,
                txListWidget,
              ),
          ],
        ),
      ),
    );

    return Platform.isIOS
        ? CupertinoPageScaffold(
      child: pageBody,
      navigationBar: appBar,
    )
        : Scaffold(
      appBar: appBar,
      body: pageBody,
      floatingActionButtonLocation:
      FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Platform.isIOS
          ? Container()
          : FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewTransaction(context),
      ),
    );
  }
}