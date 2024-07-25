import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize =>
      Size.fromHeight(kToolbarHeight + 100); // Adjust the height as needed

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isTablet = screenWidth > 600; // Check if the device is a tablet

    // Define sizes for tablet screens
    final double tabletCircleAvatarRadius = screenHeight * 0.052;
    final double tabletTextFontSize = screenHeight * 0.035;

    // Get the current time
    final currentTime = TimeOfDay.now();

    // Function to get greeting based on time
    String getGreeting() {
      if (currentTime.hour >= 5 && currentTime.hour < 12) {
        return 'Good Morning 🌞';
      } else if (currentTime.hour >= 12 && currentTime.hour < 17) {
        return 'Good Afternoon ☀️';
      } else if (currentTime.hour >= 17 && currentTime.hour < 22) {
        return 'Good Evening 🌙';
      } else {
        return 'Good Night 🌜';
      }
    }

    // Sample completion count and reward point
    int completedTasks =
        5; // Change this to the actual count of completed tasks
    int totalTasks = 5; // Total number of tasks

    // Calculate the dynamic position of the text
    double progressValue = completedTasks / totalTasks;
    double textPosition = progressValue * (screenWidth - 110);

    // Calculate text size based on line height
    double lineHeight = 4.2;
    double textHeight = screenHeight * 0.015; // Initial text height
    double textSize = textHeight / lineHeight * 4.2; // Adjusted text size

    return Container(
      height: isTablet
          ? screenHeight * 0.3
          : screenHeight *
              0.164, // Adjust height based on screen height and device type
      decoration: BoxDecoration(
        color: Color(0xFFFF9800), // Orange color
        border: Border.all(color: Colors.transparent), // No border
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(30), // Rounded corners for the bottom
        ),
      ),
      child: Column(
        children: [
          AppBar(
            automaticallyImplyLeading: false,
            elevation: 0, // No shadow
            backgroundColor: Colors.transparent, // Transparent background
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Transform.translate(
                  offset: Offset(-11, 1.0), // Adjust these values as needed
                  child: IconButton(
                    icon: Icon(
                      Icons.menu,
                      color: Colors.white,
                      size: isTablet ? screenHeight * 0.05 : screenWidth * 0.08,
                    ),
                    onPressed: () {
                     Scaffold.of(context).openDrawer();
                    },
                  ),
                ),
                Expanded(
                  child: Transform.translate(
                    offset: Offset(-8.0, 0.0), // Adjust these values to move the position
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome D',
                          style: TextStyle(
                            color: Colors.white, // White text color
                            fontSize: isTablet
                                ? tabletTextFontSize
                                : screenWidth *
                                    0.04, // Adjust size based on screen width and device type
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          getGreeting(), // Get dynamic greeting
                          style: TextStyle(
                            color: Colors.white, // White text color
                            fontSize: isTablet
                                ? tabletTextFontSize * 0.8
                                : screenWidth *
                                    0.03, // Adjust size based on screen width and device type
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                CircleAvatar(
                  backgroundImage: AssetImage('assets/profile.jpg'),
                  radius:
                      isTablet ? tabletCircleAvatarRadius : screenWidth * 0.06,
                ),
              ],
            ),
          ),
          // Reward line representing progress
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 50.0),
            child: Transform.translate(
              offset: isTablet ? Offset(0, -1) : Offset(0, -3.5),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 9, // 90% of the space
                        child: LinearProgressIndicator(
                          backgroundColor:
                              Colors.grey[300], // Light grey background color
                          valueColor: AlwaysStoppedAnimation<Color>(
                              Color(0xFF1976D2)), // Deep blue progress color
                          value: progressValue, // Progress value
                          minHeight:
                              lineHeight, // Adjust the height of the progress bar
                        ),
                      ),
                      SizedBox(
                        width: 2,
                      ), // Space between progress bar and gif
                      Container(
                        width: 20, // Adjust the width as needed
                        height: 20, // Adjust the height as needed
                        color:
                            Color(0xFFFF9800), // Background color for the gif
                        child: Transform.translate(
                          offset: Offset(
                              0, -2), // Replace x and y with the desired values
                          child: Image.asset(
                            'assets/gift.gif', // Provide the path to your GIF file
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    ],
                  ),
                  Text(
                    '${completedTasks.toInt()}/$totalTasks',
                    style: TextStyle(
                      color: Colors.black, // Text color
                      fontWeight: FontWeight.bold, // Bold text
                      fontSize: isTablet
                          ? tabletTextFontSize * 0.8
                          : textSize, // Adjusted text size
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
