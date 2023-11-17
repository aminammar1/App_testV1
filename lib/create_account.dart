import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'openscreen.dart';

class CreateAccountScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CreateAccountScreenState();
}

class CreateAccountScreenState extends State<CreateAccountScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double fem = MediaQuery.of(context).size.width / 393;
    double ffem = fem * 0.97;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(20 * fem, 47 * fem, 20 * fem, 20 * fem),
          decoration: BoxDecoration(color: Color(0xffffffff)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 38 * fem),
                child: Text(
                  'Create Account',
                  style: GoogleFonts.inter(
                    fontSize: 30 * ffem,
                    fontWeight: FontWeight.w700,
                    height: 1.3 * ffem / fem,
                    letterSpacing: -0.3 * fem,
                    color: Color(0xff000000),
                  ),
                ),
              ),
              _buildTextField('Username', usernameController, fem, ffem),
              _buildTextField('Email', emailController, fem, ffem),
              _buildTextField('Password', passwordController, fem, ffem),
              _buildSignUpButton(fem),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
      String label, TextEditingController controller, double fem, double ffem) {
    return Container(
      margin: EdgeInsets.only(bottom: 20 * fem),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: GoogleFonts.inter(
              fontSize: 14 * ffem,
              fontWeight: FontWeight.w400,
              height: 1.25 * ffem / fem,
              color: Color(0xff000000),
            ),
          ),
          TextFormField(
            controller: controller,
            obscureText: label == 'Password',
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xff000000)),
                borderRadius: BorderRadius.circular(10 * fem),
              ),
            ),
            style: GoogleFonts.inter(
              fontSize: 16 * ffem,
              height: 1.25 * ffem / fem,
              color: Color(0xff000000),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSignUpButton(double fem) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 20 * fem),
      child: ElevatedButton(
        onPressed: () async {
          // Call the function to store user data
          await _storeUserData();

          // Navigate to the desired screen after successful data storage (replace with your route)
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => OpeningScreen()),
          );
        },
        style: ElevatedButton.styleFrom(
          primary: Color(0xff000000),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10 * fem),
          ),
          padding: EdgeInsets.symmetric(vertical: 14 * fem),
        ),
        child: Text(
          'Sign Up',
          style: GoogleFonts.inter(
            fontSize: 16 * fem * 0.97,
            fontWeight: FontWeight.w600,
            color: Color(0xffffffff),
          ),
        ),
      ),
    );
  }

  Future<void> _storeUserData() async {
    try {
      // Access Firestore and add a new document with the user data
      await FirebaseFirestore.instance.collection('users').add({
        'email': emailController.text,
        'password': passwordController.text,
      });
    } catch (e) {
      // Handle Firestore errors
      print('Error storing user data: $e');
    }
  }
}
