import 'package:flutter/material.dart';
import 'package:mysql1/mysql1.dart';
import 'package:post_tun/screens/homepage.dart';
import 'package:post_tun/models/user.dart';
import 'package:post_tun/screens/register.dart';
import '../AppLocalizations.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

 Future<void> _loginUser(BuildContext context) async {
  if (!_formKey.currentState!.validate()) {
    return; // If the form is not valid, do nothing.
  }

  setState(() {
    _isLoading = true;
  });

  try {
    final conn = await MySqlConnection.connect(ConnectionSettings(
      host: '192.168.171.204',
      port: 3307,
      user: 'alluser',
      password: 'alluser',
      db: 'post_tun',
    ));

    var result = await conn.query(
      'SELECT * FROM users WHERE email = ? AND password = ?',
      [_emailController.text, _passwordController.text],
    );

    await conn.close();

    if (result.isNotEmpty) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage(user: User(id: result.first.fields['id'], email: result.first.fields['email']))));
    }  else {
      _showDialog(
        AppLocalizations.of(context)!.translate('loginFailed'),
        AppLocalizations.of(context)!.translate('invalidEmailPassword')
      );
    }
  } on MySqlException catch (e) {
    print('MySQL Exception: $e'); // Print the specific MySQL exception
    _showDialog(
      AppLocalizations.of(context)!.translate('loginError'),
      AppLocalizations.of(context)!.translate('databaseConnectionError')
    );
  } finally {
    setState(() {
      _isLoading = false;
    });
  }
}


  void _showDialog(String title, String content) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(AppLocalizations.of(context)!.translate('ok')),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20),
              Image.asset(
                'assets/images/login.jpg',
                height: 200,
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: AppLocalizations.of(context)!.translate('email'),
                  contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty || !value.contains('@')) {
                    return AppLocalizations.of(context)!.translate('invalidEmail');
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: AppLocalizations.of(context)!.translate('password'),
                  contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return AppLocalizations.of(context)!.translate('enterPassword');
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              _isLoading
                  ? CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: () => _loginUser(context),
                      child: Text(AppLocalizations.of(context)!.translate('login')),
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size.fromHeight(50),
                      ),
                    ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(AppLocalizations.of(context)!.translate('dontHaveAccount')),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen()));
                    },
                    child: Text(
                      AppLocalizations.of(context)!.translate('register'),
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
      ),
    );
  }
}
