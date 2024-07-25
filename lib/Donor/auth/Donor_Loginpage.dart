import 'package:donation_app/Donor/auth/Donor_Registration.dart';
import 'package:donation_app/Forget_Password.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690), // Provide your design size
      builder: (BuildContext context, Widget? widget) {
        return MaterialApp(
          title: 'Donor Login Page',
          debugShowCheckedModeBanner: false,
          home: DonorLoginPage(),
        );
      },
    );
  }
}

class DonorLoginPage extends StatefulWidget {
  @override
  _DonorLoginPageState createState() => _DonorLoginPageState();
}

class _DonorLoginPageState extends State<DonorLoginPage> {
  bool _isObscure = true;
  bool _isButtonPressed = false;
  bool _isPasswordNotEmpty = false;
  bool _isEmailEmpty = true;
  bool _isPasswordEmpty = true;
  bool _isLoginButtonPressed = false;
  bool _isEmailNotEmpty = false;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _togglePasswordVisibility() {
    setState(() {
      _isObscure = !_isObscure;
    });
  }

  void _login() {
    setState(() {
      _isButtonPressed = true;
      _isLoginButtonPressed = true;

      // Check if email and password are empty
      _isEmailEmpty = _emailController.text.isEmpty;
      _isPasswordEmpty = _passwordController.text.isEmpty;

      // Check if both email and password are not empty
      if (!_isEmailEmpty && !_isPasswordEmpty) {
        // Simulate login process
        Future.delayed(Duration(seconds: 1), () {
          setState(() {
            _isButtonPressed = false;

            // Navigate to home screen or perform necessary action
          });
        });
      } else {
        // Reset login button press status if fields are empty
        _isButtonPressed = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFECECEC),
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 0.29.sh,
                decoration: BoxDecoration(
                  color: Color(0xFFFF9800),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0.09.sw),
                    bottomRight: Radius.circular(0.09.sw),
                  ),
                ),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return Padding(
                      padding: EdgeInsets.only(
                        left: constraints.maxWidth >= 800 ? 0.04.sw : 0.04.sw,
                        top: 0.045.sh,
                      ),
                      child: constraints.maxWidth >= 500
                          ? Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      bottom: constraints.maxWidth >= 800
                                          ? ScreenUtil().setHeight(20)
                                          : ScreenUtil().setHeight(
                                              25)), // Adjust top margin as per your requirement
                                  child: Container(
                                    width: constraints.maxWidth >= 800
                                        ? 140
                                        : constraints.maxWidth >= 650
                                            ? 130 // Font size for screens with width >= 600 and < 800
                                            : 120,
                                    height: constraints.maxWidth >= 800
                                        ? 140
                                        : constraints.maxWidth >= 650
                                            ? 130 // Font size for screens with width >= 600 and < 800
                                            : 120,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                    ),
                                    child: Center(
                                      child: Image.asset(
                                        'assets/icons/food-donation.png',
                                        color: Colors.orange,
                                        width: constraints.maxWidth >= 800
                                            ? 125
                                            : constraints.maxWidth >= 650
                                                ? 110 // Font size for screens with width >= 600 and < 800
                                                : 105,
                                        height: constraints.maxWidth >= 800
                                            ? 125
                                            : constraints.maxWidth >= 650
                                                ? 110 // Font size for screens with width >= 600 and < 800
                                                : 105,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 20),
                                Container(
                                  margin: EdgeInsets.only(
                                      top: constraints.maxWidth >= 1100
                                          ? 27
                                          : constraints.maxWidth >= 800
                                              ? 8
                                              : constraints.maxWidth >= 650
                                                  ? 9
                                                  : 17), // Adjust the top margin value as per your requirement
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 0.01.sh),
                                      Text(
                                        'DONOR',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'PlayfairDisplay',
                                          fontSize: constraints.maxWidth >= 800
                                              ? 35 // Font size for screens with width >= 800
                                              : constraints.maxWidth >= 650
                                                  ? 33 // Font size for screens with width >= 600 and < 800
                                                  : 30, // Font size for screens with width < 600
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 0.015.sh),
                                      Text(
                                        constraints.maxWidth >= 1100
                                            ? '"Be the Change, Donate Now Creating Brighter Futures."'
                                            : '"Be the Change, Donate Now\n Creating Brighter Futures."',
                                        textAlign: TextAlign.justify,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: constraints.maxWidth >= 800
                                              ? 30 // Font size for screens with width >= 800
                                              : constraints.maxWidth >= 650
                                                  ? 28 // Font size for screens with width >= 600 and < 800
                                                  : 25, // Font size for screens with width < 600
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Container(
                                    width: ScreenUtil().setWidth(70),
                                    height: ScreenUtil().setWidth(70),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                    ),
                                    child: Center(
                                      child: Image.asset(
                                        'assets/icons/food-donation.png',
                                        color: Colors.orange,
                                        width: ScreenUtil().setWidth(58),
                                        height: ScreenUtil().setWidth(58),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 0.01.sh),
                                Text(
                                  'DONOR',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'PlayfairDisplay',
                                    fontSize: ScreenUtil().setSp(20),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 0.015.sh),
                                Expanded(
                                  child: Text(
                                    '"Be the Change, Donate Now\n Creating Brighter Futures."',
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: ScreenUtil().setSp(17),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                    );
                  },
                ),
              ),
              LayoutBuilder(builder: (context, constraints) {
                return SizedBox(height: constraints.maxWidth >= 650 ? 25 : 10);
              }),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 0.08.sw),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      LayoutBuilder(
                        builder: (context, constraints) {
                          return Container(
                            height: constraints.maxWidth >= 650 ? 60 : 50,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                constraints.maxWidth >= 650 ? 25 : 20,
                              ),
                              boxShadow: constraints.maxWidth > 800
                                  ? [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: ScreenUtil().setWidth(1),
                                        blurRadius: ScreenUtil().setWidth(7),
                                        offset:
                                            Offset(0, ScreenUtil().setWidth(3)),
                                      ),
                                    ]
                                  : [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: ScreenUtil().setWidth(3),
                                        blurRadius: ScreenUtil().setWidth(7),
                                        offset:
                                            Offset(0, ScreenUtil().setWidth(3)),
                                      ),
                                    ],
                              border: Border.all(
                                color: _isEmailEmpty && _isLoginButtonPressed
                                    ? Colors.red
                                    : Colors.white,
                              ),
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: ScreenUtil().setWidth(17)),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.email,
                                  color: Colors.orange,
                                  size: constraints.maxWidth >= 650
                                      ? 40
                                      : constraints.maxWidth >= 550
                                          ? 35
                                          : 30,
                                ),
                                SizedBox(width: ScreenUtil().setWidth(10)),
                                Expanded(
                                  child: TextField(
                                    controller: _emailController,
                                    onChanged: (value) {
                                      setState(() {
                                        _isLoginButtonPressed =
                                            false; // Reset the registration button press status
                                        _isEmailNotEmpty = value.isNotEmpty;
                                      });
                                    },
                                    style: TextStyle(
                                        fontSize: constraints.maxWidth >= 650
                                            ? 28
                                            : constraints.maxWidth >= 550
                                                ? 24
                                                : 21),
                                    decoration: InputDecoration(
                                      hintText: 'Email',
                                      hintStyle: TextStyle(
                                          fontSize: constraints.maxWidth >= 650
                                              ? 28
                                              : constraints.maxWidth >= 550
                                                  ? 24
                                                  : 20),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                      LayoutBuilder(builder: (context, constraints) {
                        return _isEmailEmpty && _isLoginButtonPressed
                            ? Align(
                                alignment: Alignment.bottomLeft,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 20,
                                      top: 3), // Adjust left padding as needed
                                  child: Text(
                                    '* Please Enter Your Email.',
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontSize: constraints.maxWidth >= 800
                                            ? 17
                                            : constraints.maxWidth >= 550
                                                ? 15
                                                : 14),
                                  ),
                                ),
                              )
                            : Container();
                      }),
                      LayoutBuilder(
                        builder: (context, constraints) {
                          return SizedBox(
                            height: constraints.maxWidth >= 1100
                                ? _isEmailEmpty && _isLoginButtonPressed
                                    ? 25
                                    : 50
                                : constraints.maxWidth >= 800
                                    ? _isEmailEmpty && _isLoginButtonPressed
                                        ? 20
                                        : 40
                                    : _isEmailEmpty && _isLoginButtonPressed
                                        ? 10
                                        : 28,
                          );
                        },
                      ),
                      LayoutBuilder(
                        builder: (context, constraints) {
                          return Container(
                            height: constraints.maxWidth >= 650 ? 60 : 50,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                constraints.maxWidth >= 650 ? 25 : 20,
                              ),
                              boxShadow: constraints.maxWidth > 800
                                  ? [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: ScreenUtil().setWidth(1),
                                        blurRadius: ScreenUtil().setWidth(7),
                                        offset:
                                            Offset(0, ScreenUtil().setWidth(3)),
                                      ),
                                    ]
                                  : [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: ScreenUtil().setWidth(3),
                                        blurRadius: ScreenUtil().setWidth(7),
                                        offset:
                                            Offset(0, ScreenUtil().setWidth(3)),
                                      ),
                                    ],
                              border: Border.all(
                                color: _isPasswordEmpty && _isLoginButtonPressed
                                    ? Colors.red
                                    : Colors.white,
                              ),
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: ScreenUtil().setWidth(6)),
                            child: TextField(
                              controller: _passwordController,
                              onChanged: (value) {
                                setState(() {
                                  _isLoginButtonPressed = false;
                                  _isPasswordEmpty = value.isNotEmpty;
                                });
                              },
                              style: TextStyle(
                                  fontSize: constraints.maxWidth >= 650
                                      ? 28
                                      : constraints.maxWidth >= 550
                                          ? 24
                                          : 21),
                              decoration: InputDecoration(
                                hintText: 'Password',
                                hintStyle: TextStyle(
                                    fontSize: constraints.maxWidth >= 650
                                        ? 28
                                        : constraints.maxWidth >= 550
                                            ? 24
                                            : 20),
                                border: InputBorder.none,
                                prefixIcon: Padding(
                                  padding: EdgeInsets.only(
                                      left: ScreenUtil().setWidth(10),
                                      right: ScreenUtil().setWidth(10)),
                                  child: Icon(
                                    Icons.lock,
                                    color: Colors.orange,
                                    size: constraints.maxWidth >= 650
                                        ? 40
                                        : constraints.maxWidth >= 550
                                            ? 35
                                            : 30,
                                  ),
                                ),
                               suffixIcon: _isPasswordEmpty && _isLoginButtonPressed
    ? IconButton(
        icon: Icon(
          _isObscure
              ? Icons.visibility
              : Icons.visibility_off,
          color: Colors.black,
        ),
        onPressed: () {
          setState(() {
            _isObscure = !_isObscure;
          });
        },
      )
    : null,

                              ),
                              obscureText: _isObscure,
                            ),
                          );
                        },
                      ),
                      LayoutBuilder(builder: (context, constraints) {
                        return _isEmailEmpty && _isLoginButtonPressed
                            ? Align(
                                alignment: Alignment.bottomLeft,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 20,
                                      top: 3), // Adjust left padding as needed
                                  child: Text(
                                    '* Please Enter Your Password.',
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontSize: constraints.maxWidth >= 800
                                            ? 17
                                            : constraints.maxWidth >= 550
                                                ? 15
                                                : 14),
                                  ),
                                ),
                              )
                            : Container();
                      }),
                      SizedBox(height: ScreenUtil().setHeight(10)),
                    LayoutBuilder(builder: (context, constraints) {
  return Align(
    alignment: Alignment.centerRight,
    child: Padding(
      padding: EdgeInsets.only(right: ScreenUtil().setWidth(7)),
      child: GestureDetector(
        onTap: () {
          // Navigate to the forget password page here
            Navigator.push(
                            context,
                            PageRouteBuilder(
                              transitionDuration: Duration(milliseconds: 600),
                              pageBuilder: (context, animation, secondaryAnimation) =>
                                  ForgetPasswordPage(),
                              transitionsBuilder: (context, animation,
                                  secondaryAnimation, child) {
                                var begin = 0.0;
                                var end = 1.0;
                                var curve = Curves.ease;

                                var tween = Tween(begin: begin, end: end)
                                    .chain(CurveTween(curve: curve));

                                return ScaleTransition(
                                  scale: animation.drive(tween),
                                  child: child,
                                );
                              },
                            ),
                          );
        },
        child: Text(
          'Forget Password?',
          style: TextStyle(
            fontSize: constraints.maxWidth >= 800 ? 18 : 16,
            color: Colors.blue,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
  );
}),

                      SizedBox(height: 0.04.sh),
                      LayoutBuilder(builder: (context, constraints) {
                        return GestureDetector(
                          onTap: _login,
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeOutBack,
                            alignment: Alignment.center,
                            width: _isButtonPressed ? 50.0 : double.infinity,
                            height: constraints.maxWidth >= 800 ? 54 : 48,
                            decoration: BoxDecoration(
                              color: _isButtonPressed
                                  ? Colors.green.shade500
                                  : Colors.orange,
                              borderRadius: BorderRadius.circular(
                                  constraints.maxWidth >= 800
                                      ? _isButtonPressed
                                          ? 25.0
                                          : 23.0
                                      : _isButtonPressed
                                          ? 25.0
                                          : 20.0),
                              boxShadow: _isButtonPressed
                                  ? []
                                  : [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.3),
                                        spreadRadius: 2,
                                        blurRadius: 7,
                                        offset: Offset(0, 3),
                                      ),
                                    ],
                            ),
                            child: _isButtonPressed
                                ? Icon(
                                    Icons.check,
                                    color: Colors.white,
                                  )
                                : Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Login',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: constraints.maxWidth >= 800
                                              ? 30
                                              : 25,
                                        ),
                                      ),
                                    ],
                                  ),
                          ),
                        );
                      }),
                      SizedBox(height: 0.02.sh),
                      LayoutBuilder(
                        builder: (context, constraints) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Divider(
                                  color: Colors.black,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text(
                                  'or',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: constraints.maxWidth >= 800
                                        ? 32
                                        : constraints.maxWidth >= 650
                                            ? 28
                                            : 24, // Adjust the percentage as needed
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Divider(
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                      SizedBox(height: 0.015.sh),
                      LayoutBuilder(builder: (context, constraints) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: 
                                  constraints.maxWidth >= 420 ? 195 : 0.40.sw,
                              height: constraints.maxWidth >= 650 ? 60 :
                                  constraints.maxWidth >= 420 ? 57 : 0.12.sw,
                              child: ElevatedButton.icon(
                                onPressed: () {
                                  // Handle Facebook login
                                },
                                icon: Image.asset(
                                  'assets/icons/facebook.png',
                                  width:constraints.maxWidth >= 650 ? 35 :
                                      constraints.maxWidth >= 420 ? 30 : 23.sp,
                                  height:constraints.maxWidth >= 650 ? 35 :
                                      constraints.maxWidth >= 420 ? 30 : 23.sp,
                                ),
                                label: Text(
                                  'Facebook',
                                  style: TextStyle(
                                    fontSize:constraints.maxWidth >= 650 ? 25 :
                                     constraints.maxWidth >= 420
                                        ? 23
                                        : 17.sp,
                                    color: Colors.indigo[900],
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(0.05.sw),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 0.05.sw),
                            Container(
                              width: constraints.maxWidth >= 650 ? 225 :
                                  constraints.maxWidth >= 420 ? 195 : 0.39.sw,
                              height:constraints.maxWidth >= 650 ? 60 :
                                  constraints.maxWidth >= 420 ? 57 : 0.12.sw,
                              child: ElevatedButton.icon(
                                onPressed: () {
                                  // Handle Google login
                                },
                                icon: Image.asset(
                                  'assets/icons/google.png',
                                  width:constraints.maxWidth >= 650 ? 35 :
                                      constraints.maxWidth >= 420 ? 31 : 24.sp,
                                  height:constraints.maxWidth >= 650 ? 35 :
                                      constraints.maxWidth >= 420 ? 31 : 24.sp,
                                ),
                                label: RichText(
                                  text: TextSpan(
                                    style: TextStyle(
                                        fontSize:constraints.maxWidth >= 650 ? 26 :
                                         constraints.maxWidth >= 420
                                            ? 24
                                            : 18.sp,
                                        fontWeight: FontWeight.w500),
                                    children: [
                                      TextSpan(
                                        text: 'G',
                                        style: TextStyle(
                                            color: Colors.blueAccent[700]),
                                      ),
                                      TextSpan(
                                        text: 'o',
                                        style: TextStyle(color: Colors.red),
                                      ),
                                      TextSpan(
                                        text: 'o',
                                        style: TextStyle(
                                            color: Colors.yellow[800]),
                                      ),
                                      TextSpan(
                                        text: 'g',
                                        style: TextStyle(
                                            color: Colors.blueAccent[700]),
                                      ),
                                      TextSpan(
                                        text: 'l',
                                        style: TextStyle(color: Colors.green),
                                      ),
                                      TextSpan(
                                        text: 'e',
                                        style: TextStyle(color: Colors.red),
                                      ),
                                    ],
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(0.05.sw),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      }),
                    ],
                  ),
                ),
              ),
            ],
          ),

   
    // Existing content goes here
    Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            height: 0.066.sh,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(0.10.sh),
                topRight: Radius.circular(0.10.sh),
              ),
            ),
            child: Center(
              child: RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontSize: constraints.maxWidth >= 650 ? 21 : constraints.maxWidth >= 500 ? 19 : 15.5.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: "Don't have an account? ",
                    ),
                    TextSpan(
                      text: "Signup",
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              transitionDuration: Duration(milliseconds: 600),
                              pageBuilder: (context, animation, secondaryAnimation) =>
                                  DonorRegistrationPage(),
                              transitionsBuilder: (context, animation,
                                  secondaryAnimation, child) {
                                var begin = 0.0;
                                var end = 1.0;
                                var curve = Curves.ease;

                                var tween = Tween(begin: begin, end: end)
                                    .chain(CurveTween(curve: curve));

                                return ScaleTransition(
                                  scale: animation.drive(tween),
                                  child: child,
                                );
                              },
                            ),
                          );
                        },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    ),
  ],
),

    );
  }
}
