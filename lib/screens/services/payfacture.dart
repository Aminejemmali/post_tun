import 'package:flutter/material.dart';

class PayFactureScreen extends StatelessWidget {
  final TextEditingController _accountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pay Facture'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Image.asset(
              'assets/images/pay.jpg',
              height: 200,
            ),
            SizedBox(height: 20),
            Text(
              'Enter your account number:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _accountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Account Number',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implement payment logic here
              },
              child: Text('Pay'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size.fromHeight(50),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
