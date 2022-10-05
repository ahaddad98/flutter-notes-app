import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


void main() {
  runApp(
    const MaterialApp(
      title: 'My app', // used by the OS task switcher
      home: HomePage(),
    ),
  );
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final TextEditingController _email;

  late final TextEditingController _password;
  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('To register'),
        ),
        body: Column(
          children: [
            TextField(
              controller: _email,
              decoration: const InputDecoration(hintText: 'Input Email'),
            ),
            TextField(
              controller: _password,
              decoration: const InputDecoration(hintText: 'Input Password'),
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
            ),
            TextButton(
              onPressed: () async{ 
                final email = _email.text;
                final password = _password.text;
                final usercredential =  await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
                print(usercredential);
               },
              child: Text('Register'),
            ),
          ],
        ));
    ;
  }
}
