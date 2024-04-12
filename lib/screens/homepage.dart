import 'package:flutter/material.dart';
import 'package:post_tun/AppLocalizations.dart';
import 'package:post_tun/models/user.dart';
import 'package:post_tun/screens/services/bankaccount.dart';
import 'package:post_tun/screens/services/livesupport.dart';
import 'package:post_tun/screens/services/payfacture.dart';
import 'package:post_tun/screens/services/tracking.dart';
import 'package:post_tun/screens/welcome.dart';
 // Import your User model

class HomePage extends StatelessWidget {
  final User user;

  HomePage({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to Post Tun Services'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('User ID: ${user.id}'),
              accountEmail: Text(user.email),
              currentAccountPicture: CircleAvatar(
                child: Text(
                  user.email[0].toUpperCase(),
                  style: TextStyle(fontSize: 40.0),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text(AppLocalizations.of(context)!.translate('Home')),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text(AppLocalizations.of(context)!.translate('Settings')),
              onTap: () {
                // Navigate to settings screen
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text(AppLocalizations.of(context)!.translate('Logout')),
              onTap: () {
               Navigator.push(context, MaterialPageRoute(builder: (context) => WelcomeScreen()));
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Hi ${user.email},', style: TextStyle(fontSize: 24)),
            SizedBox(height: 20),
            GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
              shrinkWrap: true,
              children: <Widget>[
                _buildServiceCard(AppLocalizations.of(context)!.translate('Pay facture'), Icons.payment, () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => PayFactureScreen()));
                }),
                _buildServiceCard(AppLocalizations.of(context)!.translate('Tracking parcel'), Icons.local_shipping, () {
                   Navigator.push(context, MaterialPageRoute(builder: (context) => TrackingParcelScreen()));
                }),
                _buildServiceCard(AppLocalizations.of(context)!.translate('Check account balance'), Icons.account_balance, () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => EnterAccountNumberPage()));
                }),
                _buildServiceCard(AppLocalizations.of(context)!.translate('Live support'), Icons.live_help, () {
                   Navigator.push(context, MaterialPageRoute(builder: (context) => LiveSupportScreen()));
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildServiceCard(String title, IconData icon, VoidCallback onTap) {
    return Card(
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(icon, size: 50.0),
            SizedBox(height: 10.0),
            Text(title, style: TextStyle(fontSize: 16.0)),
          ],
        ),
      ),
    );
  }
}
