import 'package:flutter/material.dart';



class EnterAccountNumberPage extends StatefulWidget {
  @override
  _EnterAccountNumberPageState createState() => _EnterAccountNumberPageState();
}

class _EnterAccountNumberPageState extends State<EnterAccountNumberPage> {
  final _formKey = GlobalKey<FormState>();
  final _accountNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:  Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.account_balance_wallet, size: 100, color: Theme.of(context).primaryColor),
                SizedBox(height: 40),
                Text('Enter Your Account Number', style: Theme.of(context).textTheme.headline5),
                SizedBox(height: 20),
                Form(
                  key: _formKey,
                  child: TextFormField(
                    controller: _accountNumberController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'Account Number',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.confirmation_num),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your account number';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AccountBalancePage(accountNumber: _accountNumberController.text),
                        ),
                      );
                    }
                  },
                  child: Text('Check Balance'),
                ),
              ],
            ),
          ),
        ),
      );
    
  }
}

class AccountBalancePage extends StatelessWidget {
  final String accountNumber;

  AccountBalancePage({required this.accountNumber});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account Balance'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Account Number: $accountNumber',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              color: Colors.blueGrey[50],
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Available Balance',
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '\$1,234.56',
                      style: TextStyle(fontSize: 20, color: Colors.green[700]),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
