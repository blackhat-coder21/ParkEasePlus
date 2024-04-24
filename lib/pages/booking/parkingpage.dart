import 'package:flutter/material.dart';
import 'package:park_ease/pages/booking/parking_controller/canceledtab.dart';
import 'package:park_ease/pages/booking/parking_controller/completedtab.dart';
import 'package:park_ease/pages/booking/parking_controller/ongoingtab.dart';
import '../../config/colors.dart';

class ParkingPage extends StatefulWidget {
  @override
  _ParkingPageState createState() => _ParkingPageState();
}

class _ParkingPageState extends State<ParkingPage> {
  late int _currentIndex;
  late List<Widget> _screens;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _currentIndex = 0;
    _screens = [
      OngoingTab(),
      CompletedTab(),
      CanceledTab(),
    ];
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blueColor,
        title: const Text(
          "PARKING",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        centerTitle: true,
      ),
      body: GestureDetector(
        onHorizontalDragEnd: (details) {
          if (details.primaryVelocity! > 0 && _currentIndex > 0) {
            setState(() {
              _currentIndex--;
              _pageController.animateToPage(_currentIndex, duration: Duration(milliseconds: 300), curve: Curves.ease);
            });
          } else if (details.primaryVelocity! < 0 && _currentIndex < 2) {
            setState(() {
              _currentIndex++;
              _pageController.animateToPage(_currentIndex, duration: Duration(milliseconds: 300), curve: Curves.ease);
            });
          }
        },
        child: Column(
          children: [
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildButton('Ongoing', 0),
                _buildButton('Completed', 1),
                _buildButton('Canceled', 2),
              ],
            ),
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                children: _screens,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(String text, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _currentIndex = index;
          _pageController.animateToPage(_currentIndex, duration: Duration(milliseconds: 300), curve: Curves.ease);
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        decoration: BoxDecoration(
          border: Border.all(
            color: blueColor,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(20.0),
          color: _currentIndex == index ? blueColor : Colors.transparent,
        ),
        child: Text(
          text,
          style: TextStyle(
            color: _currentIndex == index ? Colors.white : blueColor,
          ),
        ),
      ),
    );
  }
}