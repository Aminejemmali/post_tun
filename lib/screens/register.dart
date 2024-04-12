import 'package:flutter/material.dart';
import 'package:mysql1/mysql1.dart';
import '../AppLocalizations.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future<void> _registerUser() async {
    final conn = await MySqlConnection.connect(ConnectionSettings(
      host: '192.168.171.204',
      port: 3307,
      user: 'alluser',
      password: 'alluser',
      db: 'post_tun',
    ));

    var result = await conn.query(
        'INSERT INTO users (email, password) VALUES (?, ?)',
        [_emailController.text, _passwordController.text]);

    await conn.close();

    if (result.affectedRows == 1) {
      Navigator.pop(context);
    } else {
      // Handle registration error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            SizedBox(height: 20),
            Image.asset(
              'assets/images/register.jpg',
              height: 200,
            ),
            SizedBox(height: 20),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context)!.translate('email'),
                contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context)!.translate('password'),
                contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
              ),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _registerUser,
              child: Text(AppLocalizations.of(context)!.translate('register')),
              style: ElevatedButton.styleFrom(
                minimumSize: Size.fromHeight(50),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(AppLocalizations.of(context)!.translate('alreadyHaveAccount')),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    AppLocalizations.of(context)!.translate('login'),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
