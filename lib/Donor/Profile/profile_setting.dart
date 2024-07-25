import 'package:donation_app/Donor/Profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ProfileSettingsPage extends StatefulWidget {
  @override
  _ProfileSettingsPageState createState() => _ProfileSettingsPageState();
}

class _ProfileSettingsPageState extends State<ProfileSettingsPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  bool _isRegisterButtonPressed = false;
  bool _isEmailNotEmpty = false;
  bool _isFullNameNotEmpty = false;
  bool _isPhoneNotEmpty = false;
  File? _pickedImageFile;

  // Function to pick an image from gallery
  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _pickedImageFile = File(pickedFile.path);
      });
    } else {
      print('No image selected');
    }
  }

  bool _isEmailValid(String email) {
    // Simple regex for email validation
    String pattern = r'^[^@]+@[^@]+\.[^@]+';
    RegExp regex = RegExp(pattern);
    return regex.hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: Size(360, 690));

    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Settings'), // Custom text for the AppBar
        backgroundColor: Colors.orange,
        elevation: 0,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  color: Colors.orange,
                  height: 300,
                  child: Column(
                    children: [
                      SizedBox(height: 10),
                      Row(
                        
                      ),
                      SizedBox(height: 15),
                      Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          CircleAvatar(
                            radius: 60,
                            backgroundColor: Colors.white,
                            child: _pickedImageFile != null
                                ? ClipOval(
                                    child: Image.file(
                                      _pickedImageFile!,
                                      fit: BoxFit.cover,
                                      width: 120,
                                      height: 120,
                                    ),
                                  )
                                : Icon(
                                    Icons.person,
                                    size: 60,
                                    color: Colors.orange,
                                  ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: GestureDetector(
                              onTap: _pickImage,
                              child: CircleAvatar(
                                radius: 15,
                                backgroundColor: Colors.black,
                                child: Icon(
                                  Icons.camera_alt,
                                  size: 15,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Text(
                        'DM',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        '+91 94097 24190',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
                Container(
                  transform: Matrix4.translationValues(0, -30, 0),
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: ScreenUtil().setHeight(16)),
                      _buildCustomTextField(
                        constraints: constraints,
                        controller: _nameController,
                        hintText: 'Full Name',
                        icon: Icons.person,
                        isFieldNotEmpty: _isFullNameNotEmpty,
                        isRegisterButtonPressed: _isRegisterButtonPressed,
                      ),
                      SizedBox(height: ScreenUtil().setHeight(16)),
                      _buildCustomTextField(
                        constraints: constraints,
                        controller: _emailController,
                        hintText: 'Email',
                        icon: Icons.email,
                        isFieldNotEmpty: _isEmailNotEmpty,
                        isRegisterButtonPressed: _isRegisterButtonPressed,
                      ),
                      SizedBox(height: ScreenUtil().setHeight(16)),
                      _buildCustomTextField(
                        constraints: constraints,
                        controller: _phoneController,
                        hintText: 'Contact No.',
                        icon: Icons.phone,
                        isFieldNotEmpty: _isPhoneNotEmpty,
                        isRegisterButtonPressed: _isRegisterButtonPressed,
                      ),
                      SizedBox(height: ScreenUtil().setHeight(16)),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _isRegisterButtonPressed = true;
                            _isFullNameNotEmpty =
                                _nameController.text.isNotEmpty;
                            _isEmailNotEmpty = _emailController.text.isNotEmpty;
                            _isPhoneNotEmpty = _phoneController.text.isNotEmpty;
                          });

                          if (_isFullNameNotEmpty &&
                              _isEmailNotEmpty &&
                              _isPhoneNotEmpty) {
                            if (!_isEmailValid(_emailController.text)) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Email format is not valid'),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            } else {
                              // Show success message
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Profile updated successfully'),
                                  backgroundColor: Colors.green,
                                  duration: Duration(seconds: 2)
                                ),
                              );
                              Future.delayed(Duration(seconds: 2), () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ProfilePage()),
                                );
                              });
                            }
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.orange,
                          padding: EdgeInsets.symmetric(vertical: 16),
                          textStyle: TextStyle(fontSize: 18),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Save Changes',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
      backgroundColor: Colors.grey[200],
    );
  }

 Widget _buildCustomTextField({
  required BoxConstraints constraints,
  required TextEditingController controller,
  required String hintText,
  required IconData icon,
  required bool isFieldNotEmpty,
  required bool isRegisterButtonPressed,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        height: constraints.maxWidth >= 750 ? 51 : ScreenUtil().setHeight(45),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(
            constraints.maxWidth >= 550
                ? 21.5
                : constraints.maxWidth >= 470
                    ? 21
                    : ScreenUtil().setWidth(17.5),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: ScreenUtil().setWidth(3),
              blurRadius: ScreenUtil().setWidth(7),
              offset: Offset(0, ScreenUtil().setHeight(3)),
            ),
          ],
          border: Border.all(
            color: controller.text.isEmpty && isRegisterButtonPressed
                ? Colors.red
                : Colors.white,
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(15.5)),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
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
                controller: controller,
                 keyboardType: hintText == 'Contact No.' ? TextInputType.number : TextInputType.text,
                onChanged: (value) {
                  setState(() {
                    _isRegisterButtonPressed = false;
                  });
                },
                style: TextStyle(
                  fontSize: constraints.maxWidth >= 750
                      ? 24
                      : constraints.maxWidth >= 550
                          ? 22
                          : constraints.maxWidth >= 400
                              ? 19
                              : ScreenUtil().setSp(19),
                ),
                decoration: InputDecoration(
                  hintText: hintText,
                  hintStyle: TextStyle(
                    fontSize: constraints.maxWidth >= 750
                        ? 24
                        : constraints.maxWidth >= 550
                            ? 22
                            : constraints.maxWidth >= 400
                                ? 19
                                : ScreenUtil().setSp(19),
                  ),
                  border: InputBorder.none,
                  // contentPadding: EdgeInsets.only(bottom: 9.5), /// Adjust as needed
                ),
              ),
            ),
          ],
        ),
      ),
      if (controller.text.isEmpty && isRegisterButtonPressed)
        Padding(
          padding: const EdgeInsets.only(top: 2.0, left: 15),
          child: Text(
            '* $hintText is required',
            style: TextStyle(color: Colors.red, fontSize: 12),
          ),
        ),
    ],
  );
}


}
