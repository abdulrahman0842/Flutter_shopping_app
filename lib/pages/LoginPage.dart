import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  moveToHome(context) {
    if (_formKey.currentState!.validate()) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(),
          ));
      email.clear();
      password.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 25),
                child: Image.asset('assets/images/welcome.png'),
              ),
              const Text(
                textAlign: TextAlign.center,
                'Login Here...',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    color: Colors.black54),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
                child: Column(
                  children: [
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Email Cannot be Empty';
                        }
                        return null;
                      },
                      controller: email,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          fillColor: Colors.teal.shade50,
                          filled: true,
                          prefixIcon: Icon(
                            Icons.mail_outlined,
                            color: Colors.teal.shade900,
                          ),
                          labelText: 'Email',
                          hintText: 'Enter Email'),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Password Cannot be Empty';
                        } else if (value.length < 8) {
                          return 'Password Length Must be minimum 8';
                        }
                        return null;
                      },
                      controller: password,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        fillColor: Colors.teal.shade50,
                        filled: true,
                        prefixIcon: Icon(
                          Icons.vpn_key,
                          color: Colors.teal.shade900,
                        ),
                        labelText: 'Password',
                        hintText: 'Enter Password',
                      ),
                      obscureText: true,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    InkWell(
                      onTap: () {
                        moveToHome(context);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.teal.shade600,
                            borderRadius: BorderRadius.circular(10)),
                        alignment: Alignment.center,
                        height: 40,
                        width: 100,
                        child: const Text(
                          'Login',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
