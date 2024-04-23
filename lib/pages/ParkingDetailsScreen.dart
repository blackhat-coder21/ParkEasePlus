import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:park_ease/pages/homepage/homepage.dart';

class ParkingDetailsScreen extends StatelessWidget {
  final MarkerId markerId;

  ParkingDetailsScreen({required this.markerId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Parking Details'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              width: double.infinity,
              child: Image.asset(
                'assets/images/tmp.jpg', // Replace with your image path
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Parking Name',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Address',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          // Implement favorite action
                        },
                        icon: Icon(Icons.favorite_border),
                      ),
                      // You can add distance, time, and rating widgets here
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Description',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Short description of the place. This can be a lengthy description if needed.',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Price Rate',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  // Add your price rate widget here
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context); // Cancel button action
                        },
                        child: Text('Cancel'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Implement book parking action
                          Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage())); // Replace the current route with the homepage
                          },
                        child: Text('Book Parking'),
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
