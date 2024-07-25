import 'package:flutter/material.dart';
import 'package:donation_app/Donor/Donor_Home_page/donor_home.dart';

class ChangePasswordPage extends StatefulWidget {
  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  TextEditingController _oldPasswordController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  bool _isOldPasswordNotEmpty = false;
  bool _isPasswordNotEmpty = false;
  bool _isConfirmPasswordNotEmpty = false;
  bool _isOldPasswordObscure = true;
  bool _isPasswordObscure = true;
  bool _isConfirmPasswordObscure = true;
  bool _isSaveButtonPressed = false;
  final _formKey = GlobalKey<FormState>();

  void _save() {
    setState(() {
      _isSaveButtonPressed = true;
    });

    if (_formKey.currentState!.validate()) {
      if (_oldPasswordController.text.isNotEmpty &&
          _passwordController.text.isNotEmpty &&
          _confirmPasswordController.text.isNotEmpty) {
        const String predefinedOldPassword = '1';

        if (_oldPasswordController.text == predefinedOldPassword) {
          if (_passwordController.text == _confirmPasswordController.text) {
            if (_passwordController.text.length >= 8 &&
                _passwordController.text.contains(RegExp(r'[A-Z]')) &&
                _passwordController.text.contains(RegExp(r'[a-z]')) &&
                _passwordController.text.contains(RegExp(r'[0-9]')) &&
                _passwordController.text.contains(RegExp(r'[!@#$%&]'))) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Password Change Successfully...!',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  backgroundColor: Colors.green,
                  duration: Duration(seconds: 2),
                ),
              );
              Future.delayed(Duration(seconds: 2), () {
                setState(() {
                  _isSaveButtonPressed = false;
                });
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => DonorHomePage()),
                );
              });
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Password must be at least 8 characters long and contain at least one uppercase letter, one lowercase letter, one digit, and one special character(!@#\$%&).',
                    style: TextStyle(fontSize: 16),
                  ),
                  backgroundColor: Colors.red,
                  duration: Duration(seconds: 5),
                ),
              );
            }
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Passwords do not match',
                  style: TextStyle(fontSize: 16),
                ),
                backgroundColor: Colors.red,
                duration: Duration(seconds: 3),
              ),
            );
          }
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Old password is incorrect',
                style: TextStyle(fontSize: 16),
              ),
              backgroundColor: Colors.red,
              duration: Duration(seconds: 3),
            ),
          );
        }
      } else {
        // Show messages using LayoutBuilder
        setState(() {});
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
        title: Text("Change Password"),
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
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.orange[100],
                        ),
                      ),
                      Image.asset(
                        'assets/icons/locked.png', // Replace 'your_image.png' with your image asset path
                        width: 80,
                        height: 80,
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
                    width: screenWidth * 0.86,
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
                        color: ((_oldPasswordController.text.isEmpty ||
                                    _oldPasswordController.text != '1') &&
                                _isSaveButtonPressed)
                            ? Colors.red
                            : Colors.white,
                      ),
                    ),
                    padding:
                        EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
                    child: TextFormField(
                      controller: _oldPasswordController,
                      onChanged: (value) {
                        setState(() {
                          _isOldPasswordNotEmpty = value.isNotEmpty;
                          _isSaveButtonPressed = false;
                        });
                      },
                      style: TextStyle(fontSize: 19),
                      decoration: InputDecoration(
                        hintText: 'Old Password',
                        hintStyle: TextStyle(fontSize: 19),
                        border: InputBorder.none,
                        prefixIcon:
                            Icon(Icons.lock, color: Colors.orange, size: 31),
                        suffixIcon: _isOldPasswordNotEmpty
                            ? IconButton(
                                icon: Icon(
                                  _isOldPasswordObscure
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.black,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _isOldPasswordObscure =
                                        !_isOldPasswordObscure;
                                  });
                                },
                              )
                            : null,
                      ),
                      obscureText: _isOldPasswordObscure,
                    ),
                  ),
                  LayoutBuilder(
                    builder: (context, constraints) {
                      return _oldPasswordController.text.isEmpty &&
                              _isSaveButtonPressed
                          ? Align(
                              alignment: Alignment.bottomLeft,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: 33,
                                    top: 3), // Adjust left padding as needed
                                child: Text(
                                  '* Please enter the old password',
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
                    width: screenWidth * 0.86,
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
                        color: ((_passwordController.text.isEmpty ||
                                    _passwordController.text.length < 8 ||
                                    !_passwordController.text
                                        .contains(RegExp(r'[A-Z]')) ||
                                    !_passwordController.text
                                        .contains(RegExp(r'[a-z]')) ||
                                    !_passwordController.text
                                        .contains(RegExp(r'[0-9]')) ||
                                    !_passwordController.text
                                        .contains(RegExp(r'[!@#$%&]'))) &&
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
                        hintText: 'New Password',
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
                                  '* Please enter the new password',
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
                    width: screenWidth * 0.86,
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
                        color: ((_confirmPasswordController.text.isEmpty ||
                                    _confirmPasswordController.text !=
                                        _passwordController.text) &&
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
                        suffixIcon: _isConfirmPasswordNotEmpty
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
                  SizedBox(height: screenHeight * 0.05),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _isSaveButtonPressed = true;
                      });
                      _save();
                    },
                    child: Text('Save',
                        style: TextStyle(
                            color: Colors.white)), // Set text color to white
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.orange), // Set the background color to orange
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                        EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.35,
                            vertical: screenHeight * 0.018),
                      ),
                      textStyle: MaterialStateProperty.all<TextStyle>(
                        TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight
                                .bold), // Ensure the text color is white
                      ),
                      elevation: MaterialStateProperty.all<double>(
                          0), // Remove shadow effect by setting elevation to 0
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
