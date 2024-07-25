import 'package:donation_app/Common_Pages/Contact_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:donation_app/Common_Pages/Settings.dart';

class DrawerWidget extends StatelessWidget {
  final String pageType;
  DrawerWidget({required this.pageType});
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        ScreenUtil.init(context, designSize: Size(360, 690));

        return Drawer(
          width: constraints.maxWidth >= 750
              ? 330
              : constraints.maxWidth >= 650
                  ? 300
                  : constraints.maxWidth >= 550
                      ? 275
                      : constraints.maxWidth >= 400
                          ? 255
                          : ScreenUtil().setWidth(235),
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              Container(
                height: constraints.maxWidth >= 750
                    ? 166
                    : constraints.maxWidth >= 650
                        ? 160
                        : constraints.maxWidth >= 550
                            ? 150
                            : constraints.maxWidth >= 400
                                ? 145
                                : ScreenUtil().setHeight(125),
                color: Colors.orange,
                padding: EdgeInsets.only(
                  right: constraints.maxWidth >= 750
                      ? 125
                      : constraints.maxWidth >= 650
                          ? 105
                          : constraints.maxWidth >= 550
                              ? 88
                              : constraints.maxWidth >= 400
                                  ? 80
                                  : ScreenUtil().setWidth(77),
                  top: constraints.maxWidth >= 750
                      ? 42
                      : constraints.maxWidth >= 650
                          ? 41
                          : constraints.maxWidth >= 550
                              ? 37
                              : constraints.maxWidth >= 400
                                  ? 39
                                  : ScreenUtil().setWidth(30),
                ),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/logo.png',
                        width: constraints.maxWidth >= 750
                            ? 74
                            : constraints.maxWidth >= 650
                                ? 70
                                : constraints.maxWidth >= 550
                                    ? 66
                                    : constraints.maxWidth >= 400
                                        ? 62
                                        : ScreenUtil().setWidth(55),
                        height: constraints.maxWidth >= 750
                            ? 74
                            : constraints.maxWidth >= 650
                                ? 70
                                : constraints.maxWidth >= 550
                                    ? 66
                                    : constraints.maxWidth >= 400
                                        ? 62
                                        : ScreenUtil().setWidth(55),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'SMART SEVEK',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: constraints.maxWidth >= 750
                              ? 27
                              : constraints.maxWidth >= 650
                                  ? 25.5
                                  : constraints.maxWidth >= 550
                                      ? 24
                                      : constraints.maxWidth >= 400
                                          ? 22.5
                                          : ScreenUtil().setSp(21),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.home,
                    size: constraints.maxWidth >= 750
                        ? 33
                        : constraints.maxWidth >= 650
                            ? 31
                            : constraints.maxWidth >= 550
                                ? 28
                                : constraints.maxWidth >= 400
                                    ? 26
                                    : ScreenUtil().setSp(24)),
                title: Text(
                  'Home',
                  style: TextStyle(
                      fontSize: constraints.maxWidth >= 750
                          ? 25.5
                          : constraints.maxWidth >= 650
                              ? 24.5
                              : constraints.maxWidth >= 550
                                  ? 23
                                  : constraints.maxWidth >= 400
                                      ? 21.5
                                      : ScreenUtil().setSp(18)),
                ),
                onTap: () {
                  // Handle home item tap
                },
              ),
              ListTile(
                leading: Icon(Icons.info,
                    size: constraints.maxWidth >= 750
                        ? 33
                        : constraints.maxWidth >= 650
                            ? 31
                            : constraints.maxWidth >= 550
                                ? 28
                                : constraints.maxWidth >= 400
                                    ? 26
                                    : ScreenUtil().setSp(24)),
                title: Text(
                  'About',
                  style: TextStyle(
                      fontSize: constraints.maxWidth >= 750
                          ? 25.5
                          : constraints.maxWidth >= 650
                              ? 24.5
                              : constraints.maxWidth >= 550
                                  ? 23
                                  : constraints.maxWidth >= 400
                                      ? 21.5
                                      : ScreenUtil().setSp(18)),
                ),
                onTap: () {
                  // Handle about item tap
                },
              ),
              ListTile(
                leading: Icon(Icons.contact_page,
                    size: constraints.maxWidth >= 750
                        ? 33
                        : constraints.maxWidth >= 650
                            ? 31
                            : constraints.maxWidth >= 550
                                ? 28
                                : constraints.maxWidth >= 400
                                    ? 26
                                    : ScreenUtil().setSp(24)),
                title: Text(
                  'Contact Info',
                  style: TextStyle(
                      fontSize: constraints.maxWidth >= 750
                          ? 25.5
                          : constraints.maxWidth >= 650
                              ? 24.5
                              : constraints.maxWidth >= 550
                                  ? 23
                                  : constraints.maxWidth >= 400
                                      ? 21.5
                                      : ScreenUtil().setSp(18)),
                ),
                onTap: () {
                  // Navigate to the ContactUsPage
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ContactUsPage()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.settings,
                    size: constraints.maxWidth >= 750
                        ? 33
                        : constraints.maxWidth >= 650
                            ? 31
                            : constraints.maxWidth >= 550
                                ? 28
                                : constraints.maxWidth >= 400
                                    ? 26
                                    : ScreenUtil().setSp(24)),
                title: Text(
                  'Settings',
                  style: TextStyle(
                      fontSize: constraints.maxWidth >= 750
                          ? 25.5
                          : constraints.maxWidth >= 650
                              ? 24.5
                              : constraints.maxWidth >= 550
                                  ? 23
                                  : constraints.maxWidth >= 400
                                      ? 21.5
                                      : ScreenUtil().setSp(18)),
                ),
                onTap: () {
                  // Navigate to the SettingsPage
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SettingsPage()),
                  );
                },
              ),
              if (pageType == 'donorhome' || pageType == 'ngohome') ...[
                ListTile(
                  leading: Icon(Icons.logout_rounded,
                      size: constraints.maxWidth >= 750
                          ? 33
                          : constraints.maxWidth >= 650
                              ? 31
                              : constraints.maxWidth >= 550
                                  ? 28
                                  : constraints.maxWidth >= 400
                                      ? 26
                                      : ScreenUtil().setSp(24)),
                  title: Text(
                    'Logout',
                    style: TextStyle(
                        fontSize: constraints.maxWidth >= 750
                            ? 25.5
                            : constraints.maxWidth >= 650
                                ? 24.5
                                : constraints.maxWidth >= 550
                                    ? 23
                                    : constraints.maxWidth >= 400
                                        ? 21.5
                                        : ScreenUtil().setSp(18)),
                  ),
                  onTap: () {
                    // Handle donor options item tap
                  },
                ),
              ],
            ],
          ),
        );
      },
    );
  }
}
