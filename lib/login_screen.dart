import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'product_screen.dart';
import 'woocommerce_service.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 393;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(20 * fem, 47 * fem, 20 * fem, 20 * fem),
          decoration: BoxDecoration(
            color: Color(0xffffffff),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 38 * fem),
                child: Text(
                  'Log in',
                  style: GoogleFonts.inter(
                    fontSize: 30 * ffem,
                    fontWeight: FontWeight.w700,
                    height: 1.3 * ffem / fem,
                    letterSpacing: -0.3 * fem,
                    color: Color(0xff000000),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20 * fem),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Email address',
                      style: GoogleFonts.inter(
                        fontSize: 14 * ffem,
                        fontWeight: FontWeight.w400,
                        height: 1.25 * ffem / fem,
                        color: Color(0xff000000),
                      ),
                    ),
                    TextFormField(
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
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20 * fem),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Password',
                      style: GoogleFonts.inter(
                        fontSize: 14 * ffem,
                        fontWeight: FontWeight.w400,
                        height: 1.25 * ffem / fem,
                        color: Color(0xff000000),
                      ),
                    ),
                    TextFormField(
                      obscureText: true,
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
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20 * fem),
                child: ElevatedButton(
                  onPressed: () async {
                    bool loginSuccess = true;

                    if (loginSuccess) {
                      // Navigate to the welcome screen on successful login
                      String accessToken =
                          await WooCommerceService.getAccessToken();
                      // ignore: unnecessary_null_comparison
                      if (accessToken != null) {
                        // ignore: use_build_context_synchronously
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductScreen()),
                        );
                        // Navigate to the product screen on successful login and authentication
                      } else {
                        // Handle authentication failure
                        // Maybe display an error message or redirect to login again
                      }
                      // ignore: dead_code
                    } else {
                      // Handle login failure
                      // Maybe show an error message or stay on the login screen
                    }
                    // Handle login logic
                  },
                  child: Text(
                    'Log in',
                    style: GoogleFonts.inter(
                      fontSize: 16 * ffem,
                      fontWeight: FontWeight.w600,
                      height: 1.25 * ffem / fem,
                      color: Color(0xffffffff),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    minimumSize: Size(353 * fem, 56 * fem),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10 * fem),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20 * fem),
                child: Text(
                  'Forgot password?',
                  style: GoogleFonts.inter(
                    fontSize: 14 * ffem,
                    fontWeight: FontWeight.w400,
                    height: 1.25 * ffem / fem,
                    color: Color(0xb2000000),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
