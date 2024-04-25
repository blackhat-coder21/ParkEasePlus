import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'ParkingDetailsScreen.dart';



class MarkerDetailsBottomSheet extends StatelessWidget {
  final MarkerId markerId;
  final VoidCallback onClose;

  MarkerDetailsBottomSheet({
    required this.markerId,
    required this.onClose,
  });
  void _navigateToParkingDetailsScreen(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ParkingDetailsScreen(markerId: markerId),
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
            'assets/images/tmp.jpg', // Replace with your image path
            height: 150,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 10),
          Text(
            'Parking lot of ${markerId.value}',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'CQJC+QC2, IIITA, Jhalwa, Chak Dadanpur, Prayagraj, Uttar Pradesh 211011',
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
                  // Implement continue action
                  _navigateToParkingDetailsScreen(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Set the background color to blue
                ),
                child: Text('Details ->',style: TextStyle(color:Colors.white ),),

              ),
            ],
          ),
        ],
      ),
    );
  }
}
