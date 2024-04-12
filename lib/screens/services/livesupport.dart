import 'package:flutter/material.dart';

class LiveSupportScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Live Support'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Image.asset(
              'assets/images/support.jpg',
              height: 200,
            ),
            SizedBox(height: 20),
            Text(
              'Live Chat with a Support Representative',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: <Widget>[
                  ChatMessage(isMe: false, message: 'Hello! How can I help you today?'),
                  ChatMessage(isMe: true, message: 'Hi, I have a question about my account.'),
                  // Add more chat messages here
                ],
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Type your message...',
                suffixIcon: IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    // Send message logic
                  },
                ),
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  final bool isMe;
  final String message;

  const ChatMessage({required this.isMe, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      margin: EdgeInsets.symmetric(vertical: 5.0),
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: isMe ? Colors.blueAccent : Colors.grey[300],
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Text(
        message,
        style: TextStyle(color: isMe ? Colors.white : Colors.black),
      ),
    );
  }
}
