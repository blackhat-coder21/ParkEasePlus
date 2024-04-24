import 'package:flutter/material.dart';
import '../../../config/colors.dart';
import '../../../utils/devices_utils/device_util.dart';


// Class to represent parking spot data
class ParkingSpot {
  final String title;
  final String address;
  final String imageUrl;
  final double cost;
  final String paymentStatus;

  ParkingSpot({
    required this.title,
    required this.address,
    required this.imageUrl,
    required this.cost,
    required this.paymentStatus,
  });
}

class CompletedTab extends StatelessWidget {
  final List<ParkingSpot> parkingSpots = [
    ParkingSpot(
      title: 'Parking Spot 1',
      address: '123 Street, City',
      imageUrl: 'https://via.placeholder.com/150',
      cost: 10.0,
      paymentStatus: 'Completed',
    ),
    ParkingSpot(
      title: 'Parking Spot 2',
      address: '456 Avenue, Town',
      imageUrl: 'https://via.placeholder.com/150',
      cost: 15.0,
      paymentStatus: 'Completed',
    ),
    // Add more parking spots as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: parkingSpots.map((spot) {
            return Container(
              margin: EdgeInsets.only(top: 25, left: 5, right: 5),
              padding: EdgeInsets.all(10), // Add padding for content
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey), // Add grey border
                borderRadius: BorderRadius.circular(8), // Add border radius
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network(
                          spot.imageUrl,
                          width: 150,
                          height: 150,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: Device_util.get_width(context)*0.05),
                      Column(
                        children: [
                          Text(
                            spot.title,
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          SizedBox(height: 5),
                          Text(spot.address),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              Text('Cost: '),
                              Text('\$${spot.cost.toString()}', style: TextStyle(color: blueColor, fontWeight: FontWeight.bold),),
                              Text('/hrs'),
                            ],
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              // Text('Payment Status: ${spot.paymentStatus}',),
                              Text('Status: '),
                              if (spot.paymentStatus == 'Completed')
                                Container(
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.green, width: 2),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Text(
                                    spot.paymentStatus,
                                    style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
                                  ),
                                )
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                  SizedBox(height: 25),
                  ButtonBar(
                    alignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // Implement view ticket action
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: blueColor, backgroundColor: Colors.white,
                          side: BorderSide(color: blueColor), // Border color
                        ),
                        child: Text('View Ticket'),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
