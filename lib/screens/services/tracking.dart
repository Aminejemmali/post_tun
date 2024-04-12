import 'package:flutter/material.dart';

class TrackingParcelScreen extends StatelessWidget {
  final TextEditingController _trackingNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tracking Parcel'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Image.asset(
              'assets/images/track.jpg',
              height: 200,
            ),
            SizedBox(height: 20),
            Text(
              'Enter your tracking number:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _trackingNumberController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Tracking Number',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implement tracking logic here
              },
              child: Text('Track'),
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
