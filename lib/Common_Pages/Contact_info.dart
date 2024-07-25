import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContactUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Us'),
        backgroundColor: Colors.orange,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height, // Full height of the screen
        child: Stack(
          children: [
            Container(
              height: ScreenUtil().setHeight(0.2 * 1000), // Assuming standard iPhone 12 screen height
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/icons/donate.jpg'), // Replace this with your image
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Positioned(
              top: 190,
              left: 0,
              right: 0,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(20)),
                child: Container(
                  width: ScreenUtil().setWidth(150), // Adjust width as needed
                  height: ScreenUtil().setHeight(370), // Adjust height as needed
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.9), // Set shadow color
                        spreadRadius: 0, // Set spread radius
                        blurRadius: 10, // Set blur radius
                        offset: Offset(0, 3), // Set offset
                      ),
                    ],
                    borderRadius: BorderRadius.circular(10), // Rounded corners
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(ScreenUtil().setWidth(16)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'GET IN TOUCH!',
                              style: TextStyle(
                                fontSize: ScreenUtil().setSp(24),
                                fontWeight: FontWeight.bold,
                                fontFamily: 'PlayfairDisplay',
                              ),
                            ),
                            SizedBox(height: 90), // Add space between the title and the buttons
                            GestureDetector(
                              onTap: () {
                                // Handle phone button tap
                              },
                              child: Container(
                                width: 350.0, // Adjust width as needed
                                height: 50.0, // Adjust height as needed
                                decoration: BoxDecoration(
                                  color: Colors.orange, // Changed background color to orange
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: Colors.orange, // Change border color based on tap
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.phone,
                                      color: Colors.white, // Changed icon color to white
                                      size: 35,
                                    ),
                                    SizedBox(width: 8),
                                    Text(
                                      '63543 62435',
                                      style: TextStyle(
                                        color: Colors.white, // Changed text color to white
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 30),
                            GestureDetector(
                              onTap: () {
                                // Handle email button tap
                              },
                              child: Container(
                                width: 350.0, // Adjust width as needed
                                height: 50.0, // Adjust height as needed
                                decoration: BoxDecoration(
                                  color: Colors.orange, // Changed background color to orange
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: Colors.orange, // Change border color based on tap
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.email,
                                      color: Colors.white, // Changed icon color to white
                                      size: 35,
                                    ),
                                    SizedBox(width: 8),
                                    Text(
                                      'crystalinfotech@gmail.com',
                                      style: TextStyle(
                                        color: Colors.white, // Changed text color to white
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 77), // Add space between the buttons and the orange container
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40),
                              topRight: Radius.circular(40),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'THANK YOU!',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
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
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  Text(
                    'Follow Us:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
              Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    InkWell(
      onTap: () {
        // Handle Facebook button tap
      },
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.orange,
        ),
        child: Center(
          child: Image.asset(
            'assets/socialmedia/facebook.png',
            color: Colors.white,
            width: 24, // Adjust width of the image
            height: 24, // Adjust height of the image
          ),
        ),
      ),
    ),
    SizedBox(width: 10),
    InkWell(
      onTap: () {
        // Handle Instagram button tap
      },
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.orange,
        ),
        child: Center(
          child: Image.asset(
            'assets/socialmedia/instagram.png',
            color: Colors.white,
            width: 24, // Adjust width of the image
            height: 24, // Adjust height of the image
          ),
        ),
      ),
    ),
    SizedBox(width: 10),
    InkWell(
      onTap: () {
        // Handle Twitter button tap
      },
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.orange,
        ),
        child: Center(
          child: Image.asset(
            'assets/socialmedia/twitter.png',
            color: Colors.white,
            width: 24, // Adjust width of the image
            height: 24, // Adjust height of the image
          ),
        ),
      ),
    ),
  ],
),
],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
