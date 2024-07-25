import 'package:flutter/material.dart';
import 'package:another_carousel_pro/another_carousel_pro.dart';

class ProductSlider extends StatefulWidget {
  @override
  _ProductSliderState createState() => _ProductSliderState();
}

class _ProductSliderState extends State<ProductSlider> {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9, // Adjust aspect ratio as needed for responsiveness
      child: Container(
        child: AnotherCarousel(
          images: [
            AssetImage('assets/Main_Homepage_images/Home_image1.jpg'),
            AssetImage('assets/Main_Homepage_images/Home_image2.jpg'),
            AssetImage('assets/Main_Homepage_images/Home_image3.jpg'),
          ],
          borderRadius: true,
          radius: Radius.circular(40),
          dotSize: 5,
          dotBgColor: Colors.transparent,
          dotIncreasedColor: Colors.orange,
          animationCurve: Curves.fastOutSlowIn,
          animationDuration: Duration(
            milliseconds: 800,
          ),
        ),
      ),
    );
  }
}
