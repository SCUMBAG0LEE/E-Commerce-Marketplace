import 'package:flutter/material.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SupportPage(),
    );
  }
}

class SupportPage extends StatefulWidget {
  @override
  _SupportPageState createState() => _SupportPageState();
}

class _SupportPageState extends State<SupportPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _senderEmailController = TextEditingController();
  final TextEditingController _senderNameController = TextEditingController();
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void dispose() {
    _senderEmailController.dispose();
    _senderNameController.dispose();
    _textEditingController.dispose();
    super.dispose();
  }

  Future<void> _sendEmail() async {
    final senderEmail = _senderEmailController.text;
    final senderName = _senderNameController.text;
    final recipientEmail = "darkpaladincreeper@gmail.com";
    final recipientName = "Bad Tech Support";
    final textContent = _textEditingController.text;

    final smtpServer = SmtpServer('smtp-relay.sendinblue.com',
        username: 'williamgunawan233@gmail.com',
        password: 'MnKBNUq3JfFtj9Vx',
        port: 587,
        ssl: false);

    final message = Message()
      ..from = Address(senderEmail, senderName)
      ..recipients.add(Address(recipientEmail, recipientName))
      ..subject = 'Bad Tech Support Page'
      ..text = textContent;

    try {
      final sendReport = await send(message, smtpServer);
      print('Mailer Information:\nConnection Opened: ${sendReport.connectionOpened} \nMessage Start: ${sendReport.messageSendingStart} \nMessage End: ${sendReport.messageSendingEnd} \nMail: ${sendReport.mail}');
    } on MailerException catch (e) {
      print('Message not sent. $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Support Page'),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        color: Colors.white, // Set the background color to white
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              TextFormField(
                controller: _senderNameController,
                decoration: InputDecoration(labelText: 'Your Name'),
                validator: (value) {
                  if (value.toString().isEmpty) {
                    return 'Please Enter Your Name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _senderEmailController,
                decoration: InputDecoration(labelText: 'Your Email'),
                validator: (value) {
                  if (value.toString().isEmpty) {
                    return 'Please Enter Your Email Address';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _textEditingController,
                decoration: InputDecoration(labelText: 'Message Content'),
                validator: (value) {
                  if (value.toString().isEmpty) {
                    return 'Please Enter The Message Content';
                  }
                  return null;
                },
                maxLines: 5,
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _sendEmail();
                  }
                },
                child: Text('Send Email'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
