import 'package:donation_app/NGO/NGO_Loginpage.dart';
import 'package:flutter/material.dart';

class CreateNewPasswordPage extends StatefulWidget {
  @override
  _CreateNewPasswordPageState createState() => _CreateNewPasswordPageState();
}

class _CreateNewPasswordPageState extends State<CreateNewPasswordPage> {
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  bool _isPasswordNotEmpty = false;
  bool _isConfirmPasswordNotEmpty = false;
  bool _isPasswordObscure = true;
  bool _isConfirmPasswordObscure = true;
  final _formKey = GlobalKey<FormState>();
  bool _isSaveButtonPressed = false;
  bool _isButtonPressed = false;

  void _save() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isSaveButtonPressed = true;
      });

      if (_passwordController.text.isNotEmpty &&
          _confirmPasswordController.text.isNotEmpty) {
        if (_passwordController.text == _confirmPasswordController.text) {
          if (_passwordController.text.length >= 8 &&
              _passwordController.text.contains(RegExp(r'[A-Z]')) &&
              _passwordController.text.contains(RegExp(r'[a-z]')) &&
              _passwordController.text.contains(RegExp(r'[0-9]')) &&
              _passwordController.text.contains(RegExp(r'[!@#$%&]'))) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Change Successfully....!',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                backgroundColor: Colors.green,
                duration: Duration(seconds: 2),
              ),
            );
            Future.delayed(Duration(seconds: 2), () {
              setState(() {
                _isButtonPressed = false;
              });
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => NGOLoginPage()),
              );
            });
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                  'Password must be at least 8 characters long and contain at least one uppercase letter, one lowercase letter, one digit, and one Special Character(!@#\$%&).',
                  style:
                      TextStyle(fontSize: 13.95, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.justify,
                ),
                backgroundColor: Colors.red,
                duration: Duration(seconds: 2),
              ),
            );
          }
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Passwords do not match',
                style: TextStyle(fontSize: 15.5, fontWeight: FontWeight.bold),
              ),
              backgroundColor: Colors.red[700],
              duration: Duration(seconds: 2),
            ),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Create New Password"),
        centerTitle: true,
      ),
      body: Form(
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
                        width: 190,
                        height: 190,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.orange[100],
                        ),
                      ),
                      Image.asset(
                        'assets/icons/unlocked.png', // Replace 'your_image.png' with your image asset path
                        width: 85,
                        height: 85,
                        // color: Colors.orange,
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  Text(
                    'Your new password must be different from previously used password.',
                    style: TextStyle(
                      fontSize: 19,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 40),
                  Container(
                    height: screenHeight * 0.064,
                    width: screenHeight * 0.45,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(screenWidth * 0.047),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 3,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        ),
                      ],
                      border: Border.all(
                        color: (_passwordController.text.isEmpty &&
                                _isSaveButtonPressed)
                            ? Colors.red
                            : Colors.white,
                      ),
                    ),
                    padding:
                        EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
                    child: TextFormField(
                      controller: _passwordController,
                      onChanged: (value) {
                        setState(() {
                          _isPasswordNotEmpty = value.isNotEmpty;
                          _isSaveButtonPressed = false;
                        });
                      },
                      style: TextStyle(fontSize: 19),
                      decoration: InputDecoration(
                        hintText: 'Password',
                        hintStyle: TextStyle(fontSize: 19),
                        border: InputBorder.none,
                        prefixIcon:
                            Icon(Icons.lock, color: Colors.orange, size: 31),
                        suffixIcon: _isPasswordNotEmpty
                            ? IconButton(
                                icon: Icon(
                                  _isPasswordObscure
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.black,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _isPasswordObscure = !_isPasswordObscure;
                                  });
                                },
                              )
                            : null,
                      ),
                      obscureText: _isPasswordObscure,
                    ),
                  ),
                  LayoutBuilder(
                    builder: (context, constraints) {
                      return _passwordController.text.isEmpty &&
                              _isSaveButtonPressed
                          ? Align(
                              alignment: Alignment.bottomLeft,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: 33,
                                    top: 3), // Adjust left padding as needed
                                child: Text(
                                  '* Please enter your password',
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
                    },
                  ),
                  SizedBox(height: screenHeight * 0.025),
                  Container(
                    height: screenHeight * 0.064,
                    width: screenHeight * 0.45,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(screenWidth * 0.047),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 3,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        ),
                      ],
                      border: Border.all(
                        color: (_confirmPasswordController.text.isEmpty &&
                                _isSaveButtonPressed)
                            ? Colors.red
                            : Colors.white,
                      ),
                    ),
                    padding:
                        EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
                    child: TextFormField(
                      controller: _confirmPasswordController,
                      onChanged: (value) {
                        setState(() {
                          _isConfirmPasswordNotEmpty = value.isNotEmpty;
                          _isSaveButtonPressed = false;
                        });
                      },
                      style: TextStyle(fontSize: 19),
                      decoration: InputDecoration(
                        hintText: 'Confirm Password',
                        hintStyle: TextStyle(fontSize: 19),
                        border: InputBorder.none,
                        prefixIcon:
                            Icon(Icons.lock, color: Colors.orange, size: 31),
                        suffixIcon: _isPasswordNotEmpty
                            ? IconButton(
                                icon: Icon(
                                  _isConfirmPasswordObscure
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.black,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _isConfirmPasswordObscure =
                                        !_isConfirmPasswordObscure;
                                  });
                                },
                              )
                            : null,
                      ),
                      obscureText: _isConfirmPasswordObscure,
                    ),
                  ),
                  LayoutBuilder(
                    builder: (context, constraints) {
                      return _confirmPasswordController.text.isEmpty &&
                              _isSaveButtonPressed
                          ? Align(
                              alignment: Alignment.bottomLeft,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: 33,
                                    top: 3), // Adjust left padding as needed
                                child: Text(
                                  '* Please confirm the new password',
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
                    },
                  ),
                  SizedBox(height: 180),
                  GestureDetector(
                    onTap: _save,
                    child: Container(
                      width: 350,
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: _isButtonPressed
                            ? Colors.green.shade500
                            : Colors.orange,
                        borderRadius: BorderRadius.circular(
                            _isButtonPressed ? 25.0 : 20.0),
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
                      child: Center(
                        child: Text(
                          'Save',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: screenWidth * 0.058,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
