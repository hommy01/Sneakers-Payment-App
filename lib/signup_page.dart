import 'package:flutter/material.dart';
import 'login_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key, this.title});

  final String? title;

  @override
  // ignore: library_private_types_in_public_api
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: height,
          child: Stack(
            children: <Widget>[
              // Background Image
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        'images/delicious3.jpg'), // Path to your image
                    fit: BoxFit.cover, // Make sure the image covers the screen
                  ),
                ),
              ),
              // Signup Form Content
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: height * .2),
                      RichText(
                        textAlign: TextAlign.center,
                        text: const TextSpan(
                          text: 'Sign',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w700,
                            color: Color.fromARGB(255, 14, 159, 226),
                          ),
                          children: [
                            TextSpan(
                              text: 'Up ',
                              style: TextStyle(
                                color: Color.fromARGB(255, 194, 12, 179),
                                fontSize: 30,
                              ),
                            ),
                            TextSpan(
                              text: 'To ',
                              style: TextStyle(
                                color: Color.fromARGB(255, 35, 190, 178),
                                fontSize: 30,
                              ),
                            ),
                            TextSpan(
                              text: 'Cloth ',
                              style: TextStyle(
                                color: Color.fromARGB(255, 226, 12, 12),
                                fontSize: 30,
                              ),
                            ),
                            TextSpan(
                              text: 'Payment App',
                              style: TextStyle(
                                color: Colors.lightBlue,
                                fontSize: 30,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      // Form Fields
                      Column(
                        children: <Widget>[
                          _buildTextField(
                              'User Name', 'username', Icons.person, false),
                          _buildTextField(
                              'Email id', 'email', Icons.email, false),
                          _buildTextField(
                              'Password', 'password', Icons.visibility, true),
                          _buildTextField('Confirm Password', 'password',
                              Icons.visibility, true),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      _buildRegisterButton(context),
                      const SizedBox(
                        height: 30,
                      ),
                      _buildLoginOption(context),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 40,
                left: 0,
                child: _buildBackButton(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
      String label, String hint, IconData icon, bool isObscure) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          const SizedBox(height: 10),
          TextField(
            style: const TextStyle(fontSize: 20),
            textAlign: TextAlign.start,
            obscureText: isObscure,
            decoration: InputDecoration(
              hintText: hint,
              suffixIcon: Icon(icon, color: Colors.black54),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
              fillColor: const Color(0xfff3f3f4),
              filled: true,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRegisterButton(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(vertical: 15),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            offset: const Offset(2, 4),
            blurRadius: 5,
            spreadRadius: 2,
          )
        ],
        gradient: const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [Colors.blue, Colors.lightBlue],
        ),
      ),
      child: const Text(
        'Register Now',
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
    );
  }

  Widget _buildLoginOption(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const LoginPage()),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 20),
        padding: const EdgeInsets.all(15),
        alignment: Alignment.bottomCenter,
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Already have an account ?',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
            SizedBox(width: 10),
            Text(
              'Login',
              style: TextStyle(
                color: Color(0xFF0389F6),
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBackButton(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child:
                  const Icon(Icons.arrow_left, color: Colors.black, size: 30),
            ),
            const Text(
              'Back',
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
