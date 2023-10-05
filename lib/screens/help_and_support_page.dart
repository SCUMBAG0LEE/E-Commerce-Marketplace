import 'package:flutter/material.dart';

class HelpAndSupportPage extends StatefulWidget {
  @override
  _HelpAndSupportPageState  createState() => _HelpAndSupportPageState();
}

class _HelpAndSupportPageState extends State<HelpAndSupportPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Legal Support'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Legal Support & Information',
              style: TextStyle(
                color: Colors.red,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'For legal inquiries, information, or assistance, please contact our legal team.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Email: legal@yourcompany.com',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Phone: +1 (123) 456-7890',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 32),
            Text(
              'Legal Office Address',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Your Company Legal Department',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '123 Legal Avenue',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Legal City, LC 12345',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
