import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'SelectVehiclePage.dart';

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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
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
                        ],
                      ),
                      IconButton(
                        icon: Icon(Icons.favorite),
                        onPressed: () {
                          // Add your favorite button logic here
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    height: 40,
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 8),
                          child: _buildInfoBox(Icons.location_on, '5 km'),
                        ),
                        SizedBox(width: 8),
                        _buildInfoBox(Icons.access_time_filled_rounded, '8 AM - 9 PM'),
                        SizedBox(width: 8),
                        Padding(
                          padding: EdgeInsets.only(right: 8),
                          child: _buildInfoBox(Icons.star, '4.5'),
                        ),
                      ],
                    ),
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
                  Container(
                    color: Color(0xFFe3f2fd),
                    padding: EdgeInsets.all(12),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '₹ 50',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'per hour',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(20),
        child: Row(
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
                Navigator.push(context, MaterialPageRoute(builder: (context) => SelectVehiclePage())); // Replace the current route with the homepage
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Set the background color to blue
              ),
              child: Text('Book Parking',style: TextStyle(color:Colors.white ),),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoBox(IconData iconData, String value) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.blue,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    iconData,
                    size: 15,
                    color: Colors.blue,
                  ),
                  SizedBox(width: 8),
                  Text(
                    value,
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
