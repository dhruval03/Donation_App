import 'package:donation_app/Common_Pages/Settings.dart';
import 'package:donation_app/Donor/History/history.dart';
import 'package:donation_app/Donor/NGO_list/ngo_list.dart';
import 'package:donation_app/Main_homepage/Home_Drawer.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:donation_app/Donor/auth/Donor_Loginpage.dart';
import 'package:donation_app/NGO/NGO_Loginpage.dart';
import 'package:donation_app/Main_homepage/Images_Slider.dart';
// import './splash_screen/splash_screen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:donation_app/Donor/Donor_Home_page/donor_home.dart';
import 'Donor/Profile/profile.dart';
void main() {
  runApp(
    ScreenUtilInit(
      designSize: Size(360, 690), // Your design size
      builder: (context, _) => MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // Define the initial route
      initialRoute: '/',
      // Define routes
      routes: {
        // Define the root route
        '/': (context) => HomePage(),
        '/donor': (context) => DonorLoginPage(),
        '/ngo': (context) => NGOLoginPage(),
        '/donor_home': (context) => DonorHomePage(),
        '/profile': (context) => ProfilePage(),
        '/history': (context) => HistoryPage(),
        '/NGO_list':(context) => NGOListPage(),
        // Add more routes as needed
      },
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  int current_index = 0;
  final List<Widget> pages = [HomePage(), HomePage(), HomePage(), HomePage()];

  void onTapped(int index) {
    setState(() {
      current_index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(82.0),
        child: Stack(
          children: [
            AppBar(
              backgroundColor: Colors.orange,
              shape: CustomShapeBorder(),
              automaticallyImplyLeading: false,
            ),
            Positioned(
              top: 28.0,
              left: screenWidth * 0.091,
              child: Container(
                width: screenWidth * 0.82,
                height: 43.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Row(
                  children: [
                    IconButton(
                      padding: const EdgeInsets.only(left: 8.0),
                      icon: Icon(Icons.menu, color: Colors.orange, size: 39),
                      onPressed: () {
                        _scaffoldKey.currentState?.openDrawer();
                      },
                    ),
                    Spacer(), // This will expand and push the next icon to the rightmost side
                    IconButton(
                      padding: const EdgeInsets.only(right: 8.0),
                      icon: Icon(Icons.share, color: Colors.orange, size: 29),
                      onPressed: () {
                        Share.share(
                            "https://play.google.com/store/apps/details?id=com.instructivetech.testapp");
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // SizedBox(
            //   height: 40.0, // Adjust the top padding here
            // ),
            // Padding(
            //   padding: EdgeInsets.only(
            //       left: 15.0,
            //       right: 15.0), // Adjust the left and right padding here
            //   child: Container(
            //     width: MediaQuery.of(context).size.width *
            //         0.93, // Adjust the width of the image slider
            //     child: ProductSlider(),
            //   ),
            // ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 15.0), // Adjust the padding as needed
              child: Column(
                children: [
                  // Container(
                  //   width: MediaQuery.of(context).size.width *
                  //       0.95, // Adjust the width of the heading
                  //   child: Text(
                  //     '"Donate Today, Change Tomorrow"',
                  //     style: TextStyle(
                  //         fontSize: 21.5, fontWeight: FontWeight.bold),
                  //     textAlign: TextAlign.justify, // Justify the heading
                  //   ),
                  // ),
                  // SizedBox(
                  //     height:
                  //         8.0), // Adjust the spacing between the heading and content
                  // Container(
                  //   width: MediaQuery.of(context).size.width *
                  //       0.95, // Adjust the width of the content
                  //   child: Text(
                  //     'Every donation of food and clothing offers hope to those in need. Your generosity provides sustenance to the hungry and comfort to the cold. With each contribution, you share essentials and extend compassion and dignity. Join us in our mission to ensure that no one goes hungry or without clothing in our world.',
                  //     style: TextStyle(fontSize: 16.5),
                  //     textAlign: TextAlign.justify, // Justify the content
                  //   ),
                  // ),
                  SizedBox(height: 22.0),
                  Divider(
                    height: 2.0,
                    thickness: 3.0,
                    color: Colors.orange,
                  ), // Add some space before the next container
                  Container(
                    width: MediaQuery.of(context).size.width * 0.95,
                    padding: EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 50.0),
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(25.0), // Add border radius

                      // border: Border.all(color: Colors.orange, width: 3.0),
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Want To Share Food Or Clothes?',
                          style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'PlayfairDisplay'),
                          textAlign: TextAlign.center, // Justify the content
                        ),
                        SizedBox(height: 3.0),
                        Text(
                          'Choose Any One',
                          style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'PlayfairDisplay'),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                            height:
                                30.0), // Add space between the heading and the circle icons
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  // Navigate to the login page when the first circle is tapped
                                  Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                      transitionDuration:
                                          Duration(milliseconds: 600),
                                      pageBuilder: (context, animation,
                                              secondaryAnimation) =>
                                          DonorLoginPage(),
                                      transitionsBuilder: (context, animation,
                                          secondaryAnimation, child) {
                                        var begin = 0.0;
                                        var end = 1.0;
                                        var curve = Curves.ease;

                                        var tween = Tween(
                                                begin: begin, end: end)
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
                                  width: 115.0,
                                  height: 115.0,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.orange,
                                  ),
                                  child: Transform.scale(
                                    scale:
                                        0.75, // Adjust the scale factor as needed
                                    child: Image.asset(
                                      'assets/icons/food-donation.png',
                                      color: const Color.fromARGB(
                                          255, 255, 255, 255),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                                width:
                                    20), // Add some space between the containers
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  // Navigate to the login page when the first circle is tapped
                                  Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                      transitionDuration:
                                          Duration(milliseconds: 600),
                                      pageBuilder: (context, animation,
                                              secondaryAnimation) =>
                                          NGOLoginPage(),
                                      transitionsBuilder: (context, animation,
                                          secondaryAnimation, child) {
                                        var begin = 0.0;
                                        var end = 1.0;
                                        var curve = Curves.ease;

                                        var tween = Tween(
                                                begin: begin, end: end)
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
                                  width: 115.0,
                                  height: 115.0,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.orange,
                                  ),
                                  child: Transform.scale(
                                    scale:
                                        0.95, // Adjust the scale factor as needed
                                    child: Image.asset(
                                      'assets/icons/NGO.png',
                                      color: const Color.fromARGB(
                                          255, 255, 255, 255),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),

                        SizedBox(
                            height:
                                5.0), // Add space between the circles and the text below
                        Container(
                          width: MediaQuery.of(context)
                              .size
                              .width, // Adjust this width according to your layout
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      right:
                                          12.5), // Adjust left and top margins
                                  child: Container(
                                    child: Text(
                                      'Donate',
                                      style: TextStyle(
                                        fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width <=
                                                600
                                            ? MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.06 // Font size for smaller screens
                                            : 24.0, // Maximum font size for larger screens
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left:
                                          12.5), // Adjust left and top margins
                                  child: Container(
                                    child: Text(
                                      'NGO Agent',
                                      style: TextStyle(
                                        fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width <=
                                                600
                                            ? MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.06 // Font size for smaller screens
                                            : 22.0, // Maximum font size for larger screens
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: 1.0),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 2.0, vertical: 0.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      right:
                                          8.5), // Adjust left and top margins
                                  child: Center(
                                    child: Container(
                                      child: Text(
                                        'Donate your food\n& clothes for needy',
                                        style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width <=
                                                  600
                                              ? MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.04 // Font size for smaller screens
                                              : 13.0, // Maximum font size for larger screens
                                        ),
                                        textAlign: TextAlign
                                            .center, // Center align the text
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 9.5), // Adjust left and top margins
                                  child: Center(
                                    child: Container(
                                      child: Text(
                                        'Food or Clothes \npickup and share',
                                        style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width <=
                                                  600
                                              ? MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.04 // Font size for smaller screens
                                              : 13.0, // Maximum font size for larger screens
                                        ),
                                        textAlign: TextAlign
                                            .center, // Center align the text
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      drawer: DrawerWidget(pageType: '',),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        color: Colors.orange,
        onTap: (int index) {
          if (index == 2) {
            // Navigate to DonorHomePage route
            Navigator.pushNamed(context, '/donor_home');
          }
        },
        height: 57,
        items: <Widget>[
          Icon(Icons.home, size: 30),
          Icon(Icons.people, size: 30),
          Icon(Icons.login_outlined, size: 30),
          Icon(Icons.home, size: 30),
        ],
      ),
    );
  }
}

class CustomShapeBorder extends ShapeBorder {
  const CustomShapeBorder();

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.all(0);

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return getOuterPath(rect, textDirection: textDirection);
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    double radius = rect.height / 3;
    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(0, rect.height);
    path.quadraticBezierTo(
        rect.width / 2, rect.height * 1.50, rect.width, rect.height);
    path.lineTo(rect.width, 0);
    path.close();
    return path;
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {}

  @override
  ShapeBorder scale(double t) {
    return this;
  }
}
