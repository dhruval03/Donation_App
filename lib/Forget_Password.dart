import 'package:donation_app/Create_New_Password.dart';
import 'package:flutter/material.dart';
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
          title: 'Forget Password Page',
          debugShowCheckedModeBanner: false,
          // home: DonorLoginPage(),
        );
      },
    );
  }
}

class ForgetPasswordPage extends StatefulWidget {
  @override
  _ForgetPasswordPageState createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  final TextEditingController _emailController = TextEditingController();
  bool isButtonPressed = false;
  bool _isSendButtonPressed = false;
  bool _isEmailNotEmpty = false;

  final _formKey = GlobalKey<FormState>();

  // Focus nodes for OTP text fields
  FocusNode focusNode1 = FocusNode();
  FocusNode focusNode2 = FocusNode();
  FocusNode focusNode3 = FocusNode();
  FocusNode focusNode4 = FocusNode();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Forgot Password"),
        centerTitle: true,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 20),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width:  constraints.maxWidth >= 500 ? 210 : 190,
                            height:  constraints.maxWidth >= 500 ? 210 : 190,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.orange[100],
                            ),
                          ),
                          Image.asset(
                            'assets/icons/locked.png', // Replace 'your_image.png' with your image asset path
                            width: constraints.maxWidth >= 500 ? 100 :85,
                            height:constraints.maxWidth >= 500 ? 100 : 85,
                            // color: Colors.orange,
                          ),
                        ],
                      ),
                      SizedBox(height: 30),
                      Text(
                        'Enter the email address \nassociated with your account.',
                        style: TextStyle(
                          fontSize: constraints.maxWidth >= 500 ? 21 :19,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      
                      SizedBox(height: 40),
                      Container(
                        height: constraints.maxWidth >= 500 ? 55 :48,
                        width:constraints.maxWidth >= 500 ? 450 :350,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.circular(screenWidth * 0.047),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 3,
                              blurRadius: 7,
                              offset: Offset(0, 3),
                            ),
                          ],
                          border: Border.all(
                            color: _emailController.text.isEmpty &&
                                    _isSendButtonPressed
                                ? Colors.red
                                : Colors.white,
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.05),
                        child: Row(
                          children: [
                            Icon(Icons.email, color: Colors.orange, size:constraints.maxWidth >= 500 ? 36 : 33),
                            SizedBox(width: screenWidth * 0.03),
                            Expanded(
                              child: TextFormField(
                                controller: _emailController,
                                onChanged: (value) {
                                  setState(() {
                                    _isSendButtonPressed =
                                        false; // Reset the registration button press status
                                    _isEmailNotEmpty = value.isNotEmpty;
                                  });
                                },
                                style: TextStyle(fontSize:constraints.maxWidth >= 500 ? 21 : 19),
                                decoration: InputDecoration(
                                  hintText: 'Email',
                                  hintStyle: TextStyle(fontSize: constraints.maxWidth >= 500 ? 21 :19),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                                            LayoutBuilder(
                        builder: (context, constraints) {
                          return _emailController.text.isEmpty &&
                                  _isSendButtonPressed
                              ? Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: 33,
                                        top: 3), // Adjust left padding as needed
                                    child: Text(
                                      '* Please enter your email address',
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontSize: constraints.maxWidth >= 500
                                              ? 17
                                              : 14),
                                    ),
                                  ),
                                )
                              : Container();
                        },
                      ),

                      SizedBox(height:constraints.maxWidth >= 500 ? 230 : 260),
                      GestureDetector(
                        onTap: () {
                          if (_emailController.text.isEmpty) {
                            // Email field is empty, show red border
                            setState(() {
                              _isSendButtonPressed = true;
                            });
                          } else {
                            // Email field is not empty, show OTP dialog
                            _showOTPDialog(context, _emailController.text);
                          }
                        },
                        child: Container(
                          width: constraints.maxWidth >= 500 ? 430 : 350,
                          height:constraints.maxWidth >= 500 ? 50 : 48,
                          decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(
                                isButtonPressed ? 25.0 : 20.0),
                            boxShadow: isButtonPressed
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
                          child: Center(
                            child: Text(
                              'Send',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: constraints.maxWidth >= 500 ? 28 :25,
                              ),
                            ),
                          ),
                        ),
                      ),
                      // SizedBox(
                      //     height: constraints.maxWidth >= 500 ? 21 : 10), // Adjust this size accordingly
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  // Function to show OTP dialog
  void _showOTPDialog(BuildContext context, String emailAddress) {
    if (_emailController.text.isNotEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(27.0),
            ),
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Enter OTP',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    'Please enter the 4 digit code sent to:\n$emailAddress',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16.5,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildOTPBox(
                          context: context,
                          focusNode: focusNode1,
                          nextFocusNode: focusNode2),
                      _buildOTPBox(
                          context: context,
                          focusNode: focusNode2,
                          nextFocusNode: focusNode3),
                      _buildOTPBox(
                          context: context,
                          focusNode: focusNode3,
                          nextFocusNode: focusNode4),
                      _buildOTPBox(
                          context: context,
                          focusNode: focusNode4,
                          nextFocusNode: null),
                    ],
                  ),
                  SizedBox(height: 25.0),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          transitionDuration: Duration(milliseconds: 600),
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  CreateNewPasswordPage(),
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
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
                    child: Container(
                      width: 150,
                      height: 45.0,
                      decoration: BoxDecoration(
                        color: isButtonPressed
                            ? Colors.green.shade500
                            : Colors.orange,
                        borderRadius: BorderRadius.circular(
                            isButtonPressed ? 25.0 : 20.0),
                        boxShadow: isButtonPressed
                            ? []
                            : [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    spreadRadius: 2,
                                    blurRadius: 7,
                                    offset: Offset(0, 3))
                              ],
                      ),
                      child: Center(
                        child: Text(
                          'Submit',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 19,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    }
  }

  Widget _buildOTPBox(
      {required BuildContext context,
      FocusNode? focusNode,
      FocusNode? nextFocusNode}) {
    return Container(
      width: 50.0,
      height: 50.0,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(10.0),
      ),
      alignment: Alignment.center,
      child: TextField(
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
        decoration: InputDecoration(
          counterText: '',
          border: InputBorder.none,
        ),
        focusNode: focusNode,
        onChanged: (String value) {
          if (value.isNotEmpty && nextFocusNode != null) {
            FocusScope.of(context).requestFocus(nextFocusNode);
          }
        },
      ),
    );
  }
}
