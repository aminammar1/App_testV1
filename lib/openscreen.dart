import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'create_account.dart';

class OpeningScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double fem = 1.0; 
    double ffem = 1.0; 

    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            padding:
                EdgeInsets.fromLTRB(20 * fem, 130 * fem, 20 * fem, 84 * fem),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 3.39 * fem, 67.58 * fem),
                  width: 315.61 * fem,
                  height: 273.42 * fem,
                  child: Image.asset(
                    'assets/joker.jpg',
                    width: 315.61 * fem,
                    height: 273.42 * fem,
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(18 * fem, 0, 18 * fem, 75 * fem),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 1 * fem, 11 * fem),
                        child: Text(
                          'Explore the app',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 32 * ffem,
                            fontWeight: FontWeight.w700,
                            height: 1.3 * ffem / fem,
                            letterSpacing: -0.32 * fem,
                            color: Color(0xff000000),
                          ),
                        ),
                      ),
                      Container(
                        constraints: BoxConstraints(maxWidth: 317 * fem),
                        child: Text(
                          'Welcome to MY APP :)',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 17 * ffem,
                            fontWeight: FontWeight.w400,
                            height: 1.25 * ffem / fem,
                            color: Color(0xb2000000),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0 * fem, 0, 0 * fem, 14 * fem),
                  width: double.infinity,
                  height: 56 * fem,
                  decoration: BoxDecoration(
                    color: Color(0xff000000),
                    borderRadius: BorderRadius.circular(10 * fem),
                  ),
                  child: TextButton(
                    // Log in Button
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                    child: Center(
                      child: Text(
                        'Log in',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 16 * ffem,
                          fontWeight: FontWeight.w600,
                          height: 1.25 * ffem / fem,
                          color: Color(0xffffffff),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 12 * fem), 
                Container(
                  width: double.infinity,
                  height: 56 * fem,
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xff737373)),
                    borderRadius: BorderRadius.circular(10 * fem),
                  ),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CreateAccountScreen()),
                      );
                    },
                    child: Center(
                      child: Text(
                        'Create Account',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 16 * ffem,
                          fontWeight: FontWeight.w600,
                          height: 1.25 * ffem / fem,
                          color: Color(0xff000000),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: OpeningScreen(),
  ));
}
