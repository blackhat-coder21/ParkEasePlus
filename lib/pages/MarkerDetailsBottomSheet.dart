import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'MapPage.dart';
import 'ParkingDetailsScreen.dart';

class MarkerDetailsBottomSheet extends StatelessWidget {
  final MarkerId markerId;
  final VoidCallback onClose;
  final ParkingSpot spot;

  MarkerDetailsBottomSheet({
    required this.markerId,
    required this.onClose,
    required this.spot,
  });

  void _navigateToParkingDetailsScreen(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ParkingDetailsScreen(
          name: spot.name,
          address: spot.address,
          imagePath: spot.imagePath,
          rating: spot.rating,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Text(
              'Details',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 10),
          Image.asset(
            spot.imagePath, // Using the provided imagePath
            height: 150,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 10),
          Text(
            'Parking lot of ${spot.name}',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            spot.address,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: onClose,
                child: Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () {
                  _navigateToParkingDetailsScreen(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                child: Text(
                  'Details ->',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
