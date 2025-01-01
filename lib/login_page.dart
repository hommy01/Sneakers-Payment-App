import 'package:flutter/material.dart';
import 'package:flutter_application_1/homepage.dart';
import 'signup_page.dart';
import 'forgot_password_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Container(
          height: height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/6.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: height * 0.2),
                    _buildAppTitle(),
                    const SizedBox(height: 40),
                    _buildInputField(
                      label: "Email",
                      hint: "Enter your email",
                      icon: Icons.email,
                      obscureText: false,
                    ),
                    _buildInputField(
                      label: "Password",
                      hint: "Enter your password",
                      icon: Icons.visibility,
                      obscureText: true,
                    ),
                    const SizedBox(height: 20),
                    _buildButton(
                      context,
                      label: "Login",
                      gradientColors: [
                        const Color(0xFF0288D1),
                        const Color(0xFF0A74DA),
                      ],
                      onTap: () {
                        // Navigate to home page
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SneakersPaymentApp(),
                          ),
                        );
                      },
                    ),
                    _buildTextLink(
                      text: "Forgot Password?",
                      color: const Color(0xFF0288D1),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ForgotPasswordPage(),
                          ),
                        );
                      },
                    ),
                    _buildTextLink(
                      text: "Don't have an account? Register",
                      color: Colors.white,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignUpPage(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 40,
                left: 0,
                child: IconButton(
                  icon: const Icon(Icons.keyboard_arrow_left),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper to build the app title
  Widget _buildAppTitle() {
    return RichText(
      textAlign: TextAlign.center,
      text: const TextSpan(
        text: 'Cloth Payment App ',
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.w700,
          color: Color.fromARGB(255, 25, 158, 147),
        ),
      ),
    );
  }

  // Helper to build input fields
  Widget _buildInputField({
    required String label,
    required String hint,
    required IconData icon,
    required bool obscureText,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          const SizedBox(height: 10),
          TextField(
            obscureText: obscureText,
            decoration: InputDecoration(
              hintText: hint,
              suffixIcon: Icon(icon, color: Colors.black54),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              fillColor: const Color(0xfff3f3f4),
              filled: true,
            ),
          ),
        ],
      ),
    );
  }

  // Helper to build buttons
  Widget _buildButton(
    BuildContext context, {
    required String label,
    required List<Color> gradientColors,
    required VoidCallback onTap,
  }) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(vertical: 15),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        gradient: LinearGradient(colors: gradientColors),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            offset: const Offset(2, 4),
            blurRadius: 5,
          ),
        ],
      ),
      child: InkWell(
        onTap: onTap,
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  // Helper to build text links
  Widget _buildTextLink({
    required String text,
    required Color color,
    required VoidCallback onTap,
  }) {
    return TextButton(
      onPressed: onTap,
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
