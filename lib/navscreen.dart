import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:police_feedback/Feedback.dart';
import 'package:police_feedback/homef.dart';
import 'package:police_feedback/status.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({Key? key}) : super(key: key);

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  int _selectedIndex = 0;
  final NotchBottomBarController _controller = NotchBottomBarController();
  late List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      home(),
      StatusFrom(),
      FeedbackPage(),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: AnimatedNotchBottomBar(
        durationInMilliSeconds: 400,
        showShadow: true,
        showLabel: true,
        itemLabelStyle:  TextStyle(
          color: Colors.grey,
          fontSize: 8.0,
        ),
        notchBottomBarController: _controller,
        bottomBarItems: [
          BottomBarItem(
            inActiveItem: Image.asset("assets/home_ani.gif",
            color: Colors.blue,
            ),
            activeItem: Image.asset("assets/home_ani.gif",
              color: Colors.blue,
            ),
            itemLabel: 'Home',
          ),
          BottomBarItem(
            inActiveItem: Image.asset("assets/clock.gif",
              color: Colors.blue,
            ),
            activeItem: Image.asset("assets/clock.gif",
              color: Colors.blue,
            ),
            itemLabel: 'Status',
          ),
          BottomBarItem(
            inActiveItem: Image.asset("assets/newspaper.gif",
              color: Colors.blue,
            ),
            activeItem: Image.asset("assets/newspaper.gif",
              color: Colors.blue,
            ),
            itemLabel: 'Feedbacks',
          ),
        ],
        onTap: _onItemTapped,
        kBottomRadius: 16.0, // Set the bottom radius
        kIconSize: 24.0, // Set the icon size // Provide controller
      ),
      body: _screens[_selectedIndex],
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: NavScreen(),
  ));
}
