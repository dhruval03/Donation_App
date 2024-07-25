// ignore_for_file: unused_field, duplicate_ignore

import 'package:donation_app/NGO/NGO_Loginpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NGO Registration Page',
      debugShowCheckedModeBanner: false,
      home: NGORegistrationPage(),
    );
  }
}

class NGORegistrationPage extends StatefulWidget {
  @override
  _NGORegistrationPageState createState() => _NGORegistrationPageState();
}

 class _NGORegistrationPageState extends State<NGORegistrationPage> {
  bool _isPasswordObscure = true;
bool _isConfirmPasswordObscure = true;

  bool _isButtonPressed = false;
  final _formKey = GlobalKey<FormState>(); // Define a global key for the form
  bool _isRegisterButtonPressed = false;
  // ignore: unused_field
  bool _isNGONameNotEmpty = false;
  bool _isEmailNotEmpty = false;
  bool _isContactNotEmpty = false;
  bool _isPasswordNotEmpty = false;
  bool _isConformPasswordNotEmpty = false;
  bool _isImageNotEmpty = false;
  bool _isFormValid = false;

  // void _togglePasswordVisibility() {
  //   setState(() {
  //     _isObscure = !_isObscure;
  //   });
  // }
  // Define a TextEditingController to control the text field
  TextEditingController _imageNameController = TextEditingController();
  TextEditingController _NGONameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  void _register() {
  if (_formKey.currentState!.validate()) {
    _formKey.currentState!.reset();
    setState(() {
      _isRegisterButtonPressed = true;
    });

    if (_NGONameController.text.isNotEmpty &&
        _emailController.text.isNotEmpty &&
        _phoneController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty &&
        _confirmPasswordController.text.isNotEmpty &&
        _imageNameController.text.isNotEmpty) {

      // Check if passwords match
      if (_passwordController.text == _confirmPasswordController.text) {
        // Check if password meets criteria
        if (_passwordController.text.length >= 8 &&
            _passwordController.text.contains(RegExp(r'[A-Z]')) &&
            _passwordController.text.contains(RegExp(r'[a-z]')) &&
            _passwordController.text.contains(RegExp(r'[0-9]')) &&
            _passwordController.text.contains(RegExp(r'[!@#$%&]'))) {
          // Proceed with registration logic
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Register Successfully....!',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              backgroundColor: Colors.green,
              duration: Duration(seconds: 2),
            ),
          );
          

          

          // Simulate registration process
          Future.delayed(Duration(seconds: 1), () {
            setState(() {
              _isButtonPressed = false;
            });
            // Navigate to home screen or perform necessary action
          });

           Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => NGORegistrationPage()),
    );
        } else {
          // Password does not meet criteria, show error message
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                  'Password must be at least 8 characters long and contain at least one uppercase letter, one lowercase letter, one digit, and one Special Character(!@#\$%&).',
                  style: TextStyle(fontSize: 13.95, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.justify, ),
            backgroundColor: Colors.red,
              duration: Duration(seconds: 2),

            ),
          );
        }
      } else {
        // Passwords do not match, show error message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Passwords do not match',
                  style: TextStyle(fontSize: 15.5, fontWeight: FontWeight.bold),
            ),
            backgroundColor: Colors.red[700],
              duration: Duration(seconds: 2),

          ),
        );
      }
    } else {
      // Form is not fully filled, display an error message
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(
      //     content: Text('Please fill all required fields',
      //             style: TextStyle(fontSize: 15.5, fontWeight: FontWeight.bold),
          
      //     ),
      //     backgroundColor: Colors.red[700],
      //         duration: Duration(seconds: 2),

      //   ),
      // );
    }
  }
}

  // Define a variable to store the selected image
  XFile? _imageFile;

void _pickImage() async {
  final ImagePicker _picker = ImagePicker();
  try {
    XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      // Validate the file extension
      String imageExtension = image.path.split('.').last.toLowerCase();
      if (imageExtension == 'jpg' || imageExtension == 'jpeg' || imageExtension == 'png') {
        setState(() {
          _imageFile = image;
          // Extract the file name from the path and set it as the text for the text field
          _imageNameController.text = image.path.split('/').last;
        });
      } else {
        // Show error message if the selected file has an invalid extension
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Only JPG, JPEG, and PNG formats are allowed'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  } catch (e) {
    print('Error picking image: $e');
  }
}



  @override
  Widget build(BuildContext context) {
    // final screenHeight = MediaQuery.of(context).size.height;
    // final screenWidth = MediaQuery.of(context).size.width;
    final isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 236, 236, 236),
      body: Form(
        key: _formKey,
          onChanged: () {
            setState(() {
              _isFormValid =
                  _NGONameController.text.isNotEmpty &&
                  _emailController.text.isNotEmpty && 
                  _phoneController.text.isNotEmpty && 
                  _passwordController.text.isNotEmpty &&
                  _confirmPasswordController.text.isNotEmpty &&
                  _imageNameController.text.isNotEmpty;
            });
          },
       child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                LayoutBuilder(builder: (context, constraints) {
                  return Container(
                    height: constraints.maxWidth >= 750
                        ? ScreenUtil().screenHeight *
                            (isKeyboardOpen ? 0.145 : 0.200)
                        : constraints.maxWidth >= 550
                        ? ScreenUtil().screenHeight *
                            (isKeyboardOpen ? 0.145 : 0.210)
                        : ScreenUtil().screenHeight *
                            (isKeyboardOpen ? 0.140 : 0.232),
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(ScreenUtil().setWidth(
                            36)), // Equivalent to 0.10 times the screen width
                        bottomRight: Radius.circular(ScreenUtil().setWidth(
                            36)), // Equivalent to 0.10 times the screen width
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(
                        ScreenUtil().setWidth(20),
                        ScreenUtil().setHeight(27.5),
                        ScreenUtil().setWidth(20),
                        ScreenUtil().setHeight(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Visibility(
                                visible: !isKeyboardOpen,
                                child: Container(
                                  width: constraints.maxWidth >= 550
                                      ? 100
                                      : constraints.maxWidth >= 400
                                          ? 75
                                          : ScreenUtil().setWidth(70),
                                  height: constraints.maxWidth >= 550
                                      ? 100
                                      : constraints.maxWidth >= 400
                                          ? 75
                                          : ScreenUtil().setWidth(70),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                  ),
                                  child: Transform.scale(
                                    scale: 1.0,
                                    child: Image.asset(
                                       'assets/icons/NGO.png',
                                      color: Colors.orange,
                                    ),
                                  ),
                                ),
                              ),
                              Visibility(
                                visible: !isKeyboardOpen,
                                child:
                                    SizedBox(width: ScreenUtil().setWidth(10)),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Visibility(
                                    visible: !isKeyboardOpen,
                                    child: Text(
                                      'NGO',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'PlayfairDisplay',
                                        fontSize: constraints.maxWidth >= 800
                                            ? 27
                                            : constraints.maxWidth >= 400
                                                ? 25
                                                : ScreenUtil().setSp(23),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Visibility(
                                    visible: !isKeyboardOpen,
                                    child: SizedBox(
                                        height: ScreenUtil().setHeight(7)),
                                  ),
                                  if (constraints.maxWidth >= 550)
                                    Visibility(
                                      visible: !isKeyboardOpen,
                                      child: Text(
                                        constraints.maxWidth >= 840
                                            ?  '"Empowering Hope, Inspiring Change Join Our NGO Movement."'
                                            :  '"Empowering Hope, Inspiring Change:\n Join Our NGO Movement."',
                                        textAlign: TextAlign.justify,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: constraints.maxWidth >= 830
                                              ? 21
                                              : constraints.maxWidth >= 550
                                                  ? 20
                                                  : constraints.maxWidth >= 400
                                                      ? 18
                                                      : ScreenUtil()
                                                          .setSp(16.5),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                              Visibility(
                                visible: isKeyboardOpen,
                                child: Container(
                                  width: ScreenUtil().setWidth(56),
                                  height: ScreenUtil().setWidth(56),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                  ),
                                  child: Transform.scale(
                                    scale: 1.0,
                                    child: Image.asset(
                                       'assets/icons/NGO.png',
                                      color: Colors.orange,
                                    ),
                                  ),
                                ),
                              ),
                              Visibility(
                                visible: isKeyboardOpen,
                                child:
                                    SizedBox(width: ScreenUtil().setWidth(10)),
                              ),
                              Visibility(
                                visible: isKeyboardOpen,
                                child: Text(
                                  'NGO',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'PlayfairDisplay',
                                    fontSize: ScreenUtil().setSp(20),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          if (constraints.maxWidth < 550)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Visibility(
                                  visible: !isKeyboardOpen,
                                  child: SizedBox(
                                      height: ScreenUtil().setHeight(8)),
                                ),
                                Visibility(
                                  visible: !isKeyboardOpen,
                                  child: Text(
                                    '"Empowering Hope, Inspiring Change:\n Join Our NGO Movement."',
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: constraints.maxWidth >= 400
                                          ? 18
                                          : ScreenUtil().setSp(16.5),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                        ],
                      ),
                    ),
                  );
                }),
                Expanded(
                  child: LayoutBuilder(builder: (context, constraints) {
                  return SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: ScreenUtil().setWidth(30)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: ScreenUtil().setHeight(14)),
                          Container(
                            height: constraints.maxWidth >= 750
                                ? 51
                                : ScreenUtil().setHeight(42),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                  constraints.maxWidth >= 550
                                      ? 21.5
                                      : constraints.maxWidth >= 470
                                          ? 21
                                          : ScreenUtil().setWidth(17.5)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: ScreenUtil().setWidth(3),
                                  blurRadius: ScreenUtil().setWidth(7),
                                  offset: Offset(0, ScreenUtil().setHeight(3)),
                                ),
                              ],
                              border: Border.all(
                                color: _NGONameController.text.isEmpty &&
                                        _isRegisterButtonPressed
                                    ? Colors.red
                                    : Colors.white,
                              ),
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: ScreenUtil().setWidth(15.5)),
                            child: Row(
                              children: [
                                Icon(Icons.person,
                                    color: Colors.orange,
                                    size: constraints.maxWidth >= 750
                                        ? 36
                                        : constraints.maxWidth >= 550
                                            ? 32
                                            : constraints.maxWidth >= 400
                                                ? 28
                                                : ScreenUtil().setSp(25)),
                                SizedBox(width: ScreenUtil().setWidth(10)),
                                Expanded(
                                  child: TextFormField(
                                    controller:  _NGONameController,
                                    onChanged: (value) {
                                      // Update the border color when the text changes
                                      setState(() {
                                        _isRegisterButtonPressed =
                                            false; // Reset the login button press status
                                        _isNGONameNotEmpty = value.isNotEmpty;
                                      });
                                    },
                                    style: TextStyle(
                                        fontSize: constraints.maxWidth >= 750
                                            ? 24
                                            : constraints.maxWidth >= 550
                                                ? 22
                                                : constraints.maxWidth >= 400
                                                    ? 19
                                                    : ScreenUtil().setSp(17.5)),
                                    decoration: InputDecoration(
                                      hintText: 'NGO Name',
                                      hintStyle: TextStyle(
                                          fontSize: constraints.maxWidth >= 750
                                              ? 24
                                              : constraints.maxWidth >= 550
                                                  ? 22
                                                  : constraints.maxWidth >= 400
                                                      ? 19
                                                      : ScreenUtil()
                                                          .setSp(17.5)),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          SizedBox(height: ScreenUtil().setHeight(16)),

                          Container(
                            height: constraints.maxWidth >= 750
                                ? 51
                                : ScreenUtil().setHeight(42),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                  constraints.maxWidth >= 550
                                      ? 21.5
                                      : constraints.maxWidth >= 470
                                          ? 21
                                          : ScreenUtil().setWidth(17.5)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: ScreenUtil().setWidth(3),
                                  blurRadius: ScreenUtil().setWidth(7),
                                  offset: Offset(0, ScreenUtil().setHeight(3)),
                                ),
                              ],
                              border: Border.all(
                                color: _emailController.text.isEmpty &&
                                        _isRegisterButtonPressed
                                    ? Colors.red
                                    : Colors.white,
                              ),
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: ScreenUtil().setWidth(15.5)),
                            child: Row(
                              children: [
                                Icon(Icons.email,
                                    color: Colors.orange,
                                    size: constraints.maxWidth >= 750
                                        ? 36
                                        : constraints.maxWidth >= 550
                                            ? 32
                                            : constraints.maxWidth >= 400
                                                ? 28
                                                : ScreenUtil().setSp(25)),
                                SizedBox(width: ScreenUtil().setWidth(10)),
                                Expanded(
                                  child: TextFormField(
                                    controller: _emailController,
                                    onChanged: (value) {
                                      setState(() {
                                        _isRegisterButtonPressed =
                                            false; // Reset the registration button press status
                                        _isEmailNotEmpty = value.isNotEmpty;
                                      });
                                    },
                                    style: TextStyle(
                                        fontSize: constraints.maxWidth >= 750
                                            ? 24
                                            : constraints.maxWidth >= 550
                                                ? 22
                                                : constraints.maxWidth >= 400
                                                    ? 19
                                                    : ScreenUtil().setSp(17.5)),
                                    decoration: InputDecoration(
                                      hintText: 'Email',
                                      hintStyle: TextStyle(
                                          fontSize: constraints.maxWidth >= 750
                                              ? 24
                                              : constraints.maxWidth >= 550
                                                  ? 22
                                                  : constraints.maxWidth >= 400
                                                      ? 19
                                                      : ScreenUtil()
                                                          .setSp(17.5)),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: ScreenUtil().setHeight(16)),

                          Container(
                            height: constraints.maxWidth >= 750
                                ? 51
                                : ScreenUtil().setHeight(42),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                  constraints.maxWidth >= 550
                                      ? 21.5
                                      : constraints.maxWidth >= 470
                                          ? 21
                                          : ScreenUtil().setWidth(17.5)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: ScreenUtil().setWidth(3),
                                  blurRadius: ScreenUtil().setWidth(7),
                                  offset: Offset(0, ScreenUtil().setHeight(3)),
                                ),
                              ],
                              border: Border.all(
                                color: _phoneController.text.isEmpty &&
                                        _isRegisterButtonPressed
                                    ? Colors.red
                                    : Colors.white,
                              ),
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: ScreenUtil().setWidth(15.5)),
                            child: Row(
                              children: [
                                Icon(Icons.phone,
                                    color: Colors.orange,
                                    size: constraints.maxWidth >= 750
                                        ? 36
                                        : constraints.maxWidth >= 550
                                            ? 32
                                            : constraints.maxWidth >= 400
                                                ? 28
                                                : ScreenUtil().setSp(25)),
                                SizedBox(width: ScreenUtil().setWidth(10)),
                                Expanded(
                                  child: TextFormField(
                                    controller: _phoneController,
                                    onChanged: (value) {
                                      // Update the border color when the text changes
                                      setState(() {
                                        _isRegisterButtonPressed =
                                            false; // Reset the login button press status
                                        _isContactNotEmpty = value.isNotEmpty;
                                      });
                                    },
                                    keyboardType: TextInputType
                                        .number, // Set keyboard type to number
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.digitsOnly,
                                      LengthLimitingTextInputFormatter(
                                          10), // Allow only digits
                                    ],
                                    style: TextStyle(
                                        fontSize: constraints.maxWidth >= 750
                                            ? 24
                                            : constraints.maxWidth >= 550
                                                ? 22
                                                : constraints.maxWidth >= 400
                                                    ? 19
                                                    : ScreenUtil().setSp(17.5)),
                                    decoration: InputDecoration(
                                      hintText: 'Contact No.',
                                      hintStyle: TextStyle(
                                          fontSize: constraints.maxWidth >= 750
                                              ? 24
                                              : constraints.maxWidth >= 550
                                                  ? 22
                                                  : constraints.maxWidth >= 400
                                                      ? 19
                                                      : ScreenUtil()
                                                          .setSp(17.5)),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          SizedBox(height: ScreenUtil().setHeight(16)),

                          Container(
                            height: constraints.maxWidth >= 750
                                ? 51
                                : ScreenUtil().setHeight(42),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                  constraints.maxWidth >= 550
                                      ? 21.5
                                      : constraints.maxWidth >= 470
                                          ? 21
                                          : ScreenUtil().setWidth(17.5)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: ScreenUtil().setWidth(3),
                                  blurRadius: ScreenUtil().setWidth(7),
                                  offset: Offset(0, ScreenUtil().setHeight(3)),
                                ),
                              ],
                              border: Border.all(
                                color: _passwordController.text.isEmpty &&
                                        _isRegisterButtonPressed
                                    ? Colors.red
                                    : Colors.white,
                              ),
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: ScreenUtil().setWidth(15.5)),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.lock,
                                  color: Colors.orange,
                                  size: constraints.maxWidth >= 750
                                      ? 36
                                      : constraints.maxWidth >= 550
                                          ? 32
                                          : constraints.maxWidth >= 400
                                              ? 28
                                              : ScreenUtil().setSp(25),
                                ),
                                SizedBox(width: ScreenUtil().setWidth(10)),
                                Expanded(
                                  child: TextFormField(
                                    controller: _passwordController,
                                    onChanged: (value) {
                                      // Handle the change in the password field
                                      setState(() {
                                        _isPasswordNotEmpty = value.isNotEmpty;
                                        _isRegisterButtonPressed =
                                            false; // Reset the login button press status
                                      });
                                    },
                                    style: TextStyle(
                                      fontSize: constraints.maxWidth >= 750
                                          ? 24
                                          : constraints.maxWidth >= 550
                                              ? 22
                                              : constraints.maxWidth >= 400
                                                  ? 19
                                                  : ScreenUtil().setSp(17.5),
                                    ),
                                    decoration: InputDecoration(
                                      hintText: 'Password',
                                      hintStyle: TextStyle(
                                        fontSize: constraints.maxWidth >= 750
                                            ? 24
                                            : constraints.maxWidth >= 550
                                                ? 22
                                                : constraints.maxWidth >= 400
                                                    ? 19
                                                    : ScreenUtil().setSp(17.5),
                                      ),
                                      border: InputBorder.none,
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
                                                  _isPasswordObscure =
                                                      !_isPasswordObscure;
                                                });
                                              },
                                            )
                                          : null,
                                    ),
                                    obscureText: _isPasswordObscure,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          SizedBox(height: ScreenUtil().setHeight(16)),

                          Container(
                            height: constraints.maxWidth >= 750
                                ? 51
                                : ScreenUtil().setHeight(42),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                  constraints.maxWidth >= 550
                                      ? 21.5
                                      : constraints.maxWidth >= 470
                                          ? 21
                                          : ScreenUtil().setWidth(17.5)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: ScreenUtil().setWidth(3),
                                  blurRadius: ScreenUtil().setWidth(7),
                                  offset: Offset(0, ScreenUtil().setHeight(3)),
                                ),
                              ],
                              border: Border.all(
                                color:
                                    _confirmPasswordController.text.isEmpty &&
                                            _isRegisterButtonPressed
                                        ? Colors.red
                                        : Colors.white,
                              ),
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: ScreenUtil().setWidth(15.5)),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.lock,
                                  color: Colors.orange,
                                  size: constraints.maxWidth >= 750
                                      ? 36
                                      : constraints.maxWidth >= 550
                                          ? 32
                                          : constraints.maxWidth >= 400
                                              ? 28
                                              : ScreenUtil().setSp(25),
                                ),
                                SizedBox(width: ScreenUtil().setWidth(10)),
                                Expanded(
                                  child: TextFormField(
                                    controller: _confirmPasswordController,
                                    onChanged: (value) {
                                      // Handle the change in the password field
                                      setState(() {
                                        _isConformPasswordNotEmpty =
                                            value.isNotEmpty;
                                        _isRegisterButtonPressed =
                                            false; // Reset the login button press status
                                      });
                                    },
                                    style: TextStyle(
                                      fontSize: constraints.maxWidth >= 750
                                          ? 24
                                          : constraints.maxWidth >= 550
                                              ? 22
                                              : constraints.maxWidth >= 400
                                                  ? 19
                                                  : ScreenUtil().setSp(17.5),
                                    ),
                                    decoration: InputDecoration(
                                      hintText: 'Conform Password',
                                      hintStyle: TextStyle(
                                        fontSize: constraints.maxWidth >= 750
                                            ? 24
                                            : constraints.maxWidth >= 550
                                                ? 22
                                                : constraints.maxWidth >= 400
                                                    ? 19
                                                    : ScreenUtil().setSp(17.5),
                                      ),
                                      border: InputBorder.none,
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
                              ],
                            ),
                          ),

                          SizedBox(height: ScreenUtil().setHeight(16)),

                          GestureDetector(
                            onTap:
                                _pickImage, // Call _pickImage function when tapped
                            child: Container(
                              height: constraints.maxWidth >= 750
                                  ? 51
                                  : ScreenUtil().setHeight(42),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(
                                    constraints.maxWidth >= 550
                                        ? 21.5
                                        : constraints.maxWidth >= 470
                                            ? 21
                                            : ScreenUtil().setWidth(17.5)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: ScreenUtil().setWidth(3),
                                    blurRadius: ScreenUtil().setWidth(7),
                                    offset:
                                        Offset(0, ScreenUtil().setHeight(3)),
                                  ),
                                ],
                                border: Border.all(
                                  color: _imageNameController.text.isEmpty &&
                                          _isRegisterButtonPressed
                                      ? Colors.red
                                      : Colors.white,
                                ),
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: ScreenUtil().setWidth(15.5)),
                              child: Row(
                                children: [
                                  Icon(Icons.image,
                                      color: Colors.orange,
                                      size: constraints.maxWidth >= 750
                                          ? 36
                                          : constraints.maxWidth >= 550
                                              ? 32
                                              : constraints.maxWidth >= 400
                                                  ? 28
                                                  : ScreenUtil().setSp(25)),
                                  SizedBox(width: ScreenUtil().setWidth(10)),
                                  Expanded(
                                    child: TextFormField(
                                      onChanged: (value) {
                                        // Update the border color when the text changes
                                        setState(() {
                                          _isRegisterButtonPressed =
                                              false; // Reset the login button press status

                                          _isImageNotEmpty = value.isNotEmpty;
                                        });
                                      },
                                      onTap: _pickImage,
                                      style: TextStyle(
                                          fontSize: constraints.maxWidth >= 750
                                              ? 24
                                              : constraints.maxWidth >= 550
                                                  ? 22
                                                  : constraints.maxWidth >= 400
                                                      ? 19
                                                      : ScreenUtil().setSp(
                                                          17.5)), // Call _pickImage function when tapped
                                      decoration: InputDecoration(
                                        hintText: 'Upload Image',
                                        hintStyle: TextStyle(
                                            fontSize: constraints.maxWidth >=
                                                    750
                                                ? 24
                                                : constraints.maxWidth >= 550
                                                    ? 22
                                                    : constraints.maxWidth >=
                                                            400
                                                        ? 19
                                                        : ScreenUtil()
                                                            .setSp(17.5)),
                                        border: InputBorder.none,
                                      ),
                                      readOnly: true,
                                      controller: _imageNameController,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          SizedBox(height: ScreenUtil().setHeight(17)),

                          GestureDetector(
                            onTap: _register,
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeOutBack,
                              alignment: Alignment.center,
                              width: _isButtonPressed ? 50.0 : double.infinity,
                              height: _isButtonPressed
                                  ? ScreenUtil().setHeight(
                                      51) // Adjusted height for pressed state
                                  : constraints.maxWidth >= 750
                                  ? 51
                                  : ScreenUtil().setHeight(42), // Default height
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
                                          offset: Offset(0,
                                              3), // changes position of shadow
                                        ),
                                      ],
                              ),
                              child: _isButtonPressed
                                  ? Icon(
                                      Icons.check,
                                      color: Colors.white,
                                    )
                                  : Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Register',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize:constraints.maxWidth >=
                                                    750
                                                ? 26
                                                : constraints.maxWidth >= 550
                                                    ? 24
                                                    : constraints.maxWidth >=
                                                            400
                                                        ? 22
                                                        : ScreenUtil()
                                                            .setSp(20)// Adjusted font size
                                          ),
                                        ),
                                      ],
                                    ),
                            ),
                          ),
                          SizedBox(
                            height:
                                ScreenUtil().setHeight(7), // Adjusted height
                          ),

                      Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Expanded(
      child: Divider(
        color: Colors.black,
      ),
    ),
    Padding(
      padding: EdgeInsets.symmetric(
        horizontal: ScreenUtil().setWidth(8.0), // Adjusted horizontal padding
      ),
      child: Text(
        'or',
        style: TextStyle(
          color: Colors.black,
          fontSize:constraints.maxWidth >= 750
                                        ? 30
                                        : constraints.maxWidth >= 550
                                        ? 28
                                        : ScreenUtil().setSp(18), // Adjusted font size using ScreenUtil
        ),
      ),
    ),
    Expanded(
      child: Divider(
        color: Colors.black,
      ),
    ),
  ],
),

                            SizedBox(
                            height:
                                ScreenUtil().setHeight(5), // Adjusted height
                          ), // Adjust spacing as needed
                         Row(
  mainAxisAlignment: MainAxisAlignment.spaceAround,
  children: [
    Container(
      width:constraints.maxWidth >= 750
                                        ? 230
                                        :constraints.maxWidth >= 550
                                        ? 195
                                        : constraints.maxWidth >= 450
                                        ? 175
                                        : ScreenUtil().setWidth(142),
      height:constraints.maxWidth >= 750
                                        ? 57
                                        : constraints.maxWidth >= 550
                                        ? 52
                                        :constraints.maxWidth >= 450
                                        ? 48
                                        : ScreenUtil().setHeight(40),
      child: ElevatedButton.icon(
        onPressed: () {
          // Handle Facebook login
        },
        icon: Image.asset(
          'assets/icons/facebook.png',
          width:constraints.maxWidth >= 750
                                        ? 35
                                        : constraints.maxWidth >= 550
                                        ? 32
                                        :constraints.maxWidth >= 450
                                        ? 28
                                        : ScreenUtil().setWidth(23),
          height:constraints.maxWidth >= 750
                                        ? 35
                                        :constraints.maxWidth >= 550
                                        ? 32
                                        : constraints.maxWidth >= 450
                                        ? 28
                                        : ScreenUtil().setHeight(23),
        ),
        label: Text(
          'Facebook',
          style: TextStyle(
            fontSize:constraints.maxWidth >= 750
                                        ? 27
                                        :constraints.maxWidth >= 550
                                        ? 24
                                        : constraints.maxWidth >= 450
                                        ? 21.5
                                        : ScreenUtil().setSp(16.5),
            color: Colors.indigo[900],
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(ScreenUtil().setWidth(17)),
          ),
        ),
      ),
    ),
    SizedBox(width: ScreenUtil().setWidth(20)), // Add space between buttons
    Container(
      width: constraints.maxWidth >= 750
                                        ? 230
                                        : constraints.maxWidth >= 550
                                        ? 195
                                        :  constraints.maxWidth >= 450
                                        ? 175
                                        : ScreenUtil().setWidth(138),
      height: constraints.maxWidth >= 750
                                        ? 57
                                        : constraints.maxWidth >= 550
                                        ? 52
                                        :  constraints.maxWidth >= 450
                                        ? 48
                                        : ScreenUtil().setHeight(40),
      child: ElevatedButton.icon(
        onPressed: () {
          // Handle Google login
        },
        icon: Image.asset(
          'assets/icons/google.png',
           width:constraints.maxWidth >= 750
                                        ? 35
                                        : constraints.maxWidth >= 550
                                        ? 32
                                        :constraints.maxWidth >= 450
                                        ? 28
                                        : ScreenUtil().setWidth(23),
          height:constraints.maxWidth >= 750
                                        ? 35
                                        :constraints.maxWidth >= 550
                                        ? 32
                                        : constraints.maxWidth >= 450
                                        ? 28
                                        : ScreenUtil().setHeight(23),
        ),
        label: RichText(
          text: TextSpan(
            style: TextStyle(
              fontSize:constraints.maxWidth >= 750
                                        ? 27
                                      :   constraints.maxWidth >= 550
                                        ? 25
                                        :constraints.maxWidth >= 450
                                        ? 22
                                        : ScreenUtil().setSp(17),
                                                      fontWeight: FontWeight.w500,
            ),
            children: [
              TextSpan(
                text: 'G',
                style: TextStyle(
                  color: Colors.blueAccent[700],
                ),
              ),
              TextSpan(
                text: 'o',
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
              TextSpan(
                text: 'o',
                style: TextStyle(
                  color: Colors.yellow[800],
                ),
              ),
              TextSpan(
                text: 'g',
                style: TextStyle(
                  color: Colors.blueAccent[700],
                ),
              ),
              TextSpan(
                text: 'l',
                style: TextStyle(
                  color: Colors.green,
                ),
              ),
              TextSpan(
                text: 'e',
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(ScreenUtil().setWidth(17)),
          ),
        ),
      ),
    ),
  ],
),

                          SizedBox(
                            height: 70,
                          )
                        ],
                      ),
                    ),
                  );
                }))
              ],
            ),
          Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            height: 0.062.sh,
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
                    fontSize: constraints.maxWidth >= 650 ? 21 : constraints.maxWidth >= 500 ? 19 : 17.5,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: "Already have an account? ",
                    ),
                    TextSpan(
                      text: "Login",
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
                                  NGOLoginPage(),
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
        ),     ),
    );
  }

}